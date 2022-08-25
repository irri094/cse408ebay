import random
from django.shortcuts import render, redirect
from django.http import JsonResponse
import global_controller.authentication_module
from .models import *
from django.core.cache import cache
from datetime import datetime, timezone
from django.urls import reverse
from . import auction_checker


# Renders the Home page of Bengal Bay.
def home(request):
    inventories = Inventory.objects.all()[:8]
    if 'cart' not in request.session:
        request.session['cart'] = []
    context = {
        'inventories': inventories,
        "cart_size": count_cart_quantity(request)
    }
    return render(request, 'global_controller/global_home.html', context)


def product_details(request, inventory_id):
    total_random_products = 4

    current_product_category = Inventory.objects.get(id=inventory_id).product.category
    related_products_list = Product.objects.filter(category=current_product_category).values_list('id', flat=True)
    index_array = related_products_list
    notunarray = []
    for i in range(0, len(index_array)):
        notunarray.append(index_array[i])
    random.shuffle(notunarray)
    while len(notunarray) > total_random_products:
        notunarray.pop()
    related_products_list = Inventory.objects.filter(id__in=notunarray)
    notunarray = list(related_products_list)
    random.shuffle(notunarray)

    # If data in cache fetch from cache. Otherwise fetch from DB
    # CACHE TTL or product entries
    product_ttl = 30
    inventory_identifier = 'inv_id'

    if cache.get(inventory_identifier + inventory_id):
        inventory = cache.get(inventory_identifier + inventory_id)
        print('product fetched from cache')
    else:
        inventory = Inventory.objects.get(id=inventory_id)
        cache.set(inventory_identifier + inventory_id, inventory, timeout=product_ttl)
        print('product fetched from db')

    print(f'Product {inventory.product.name} -- TTL {cache.ttl(inventory_identifier + inventory_id)}')

    context = {
        # 'seller': Seller.objects.get(id=seller_id),
        'product': inventory.product,
        'inventories': notunarray,
        "cart_size": count_cart_quantity(request),
        'current_inventory': inventory
    }
    return render(request, 'global_controller/product_detail.html', context)


# Cart is added in the session variable as a tuple of  (seller_id, product_id, quantity)
# If an element exists the quantity is increased otherwise added.
def add_to_cart(request):
    if 'cart' not in request.session:
        request.session['cart'] = []

    seller_id = request.GET['seller_id']
    product_id = request.GET['product_id']
    quantity = request.GET['quantity']

    # Accessing cart infos from cookies i.e session
    temp_cart = request.session['cart']

    cart_found = False
    for cart_element in temp_cart:
        if cart_element[0] == seller_id and cart_element[1] == product_id:
            cart_element[2] = str(int(quantity) + int(cart_element[2]))
            cart_found = True
            break
    if not cart_found:
        temp_cart.append((seller_id, product_id, quantity))

    request.session['cart'] = temp_cart

    print(request.session['cart'])
    context = {
        "status": 1,
        "cart_size": count_cart_quantity(request)
    }
    return JsonResponse(context)


def auction_home(request):
    auction_checker.start_auction_checker_multithreaded(request)
    # To Do : Generate random objects to render the html.
    auctions = Auction.objects.filter(end_time__gte=datetime.now(timezone.utc))[:8]
    # ---------------TO DO-------------------------
    # Randomize 8 objects from the fetched auctions.
    # ---------------------------------------------

    if 'cart' not in request.session:
        request.session['cart'] = []
    context = {
        'auctions': auctions,
        "cart_size": len(request.session['cart'])
    }
    return render(request, 'global_controller/auction.html', context)


def auction_product_details(request, auction_id):
    # If data in cache fetch from cache. Otherwise fetch from DB
    # CACHE TTL or product entries
    auction_ttl = 30
    auction_identifier = 'auction_id'

    if cache.get(auction_identifier + auction_id):
        auction = cache.get(auction_identifier + auction_id)
        print('auction fetched from cache')
    else:
        auction = Auction.objects.get(id=auction_id)
        cache.set(auction_identifier + auction_id, auction, timeout=auction_ttl)
        print('auction fetched from db')

    print(f'auction {auction.id} -- TTL {cache.ttl(auction_identifier + auction_id)}')

    if auction.end_time >= datetime.now(timezone.utc):
        total_random_products = 5
        related_products_list = Auction.objects.exclude(id=auction_id)[:total_random_products]

        valid_low_bid = auction.base_price + 1

        if auction.bid is not None:
            valid_low_bid = auction.bid.bid_amount + 1

        if 'phone_num' in request.session:
            user = User.objects.get(username=request.session['phone_num'])
        else:
            user = None

        context = {
            'auction': auction,
            'valid_low_bid': valid_low_bid,
            'inventories': related_products_list,
            'user': user
        }
        return render(request, 'global_controller/auction_product_details.html', context)
    else:
        return redirect(reverse('auction_home'))


# Total elements of cart elements are counted
def count_cart_quantity(request):
    cart = request.session['cart']
    quantity = 0
    for cart_element in cart:
        quantity += int(cart_element[2])
    return quantity


def convert_time(t, ad6hour):
    T = (t.replace(tzinfo=None) - datetime(1970, 1, 1)).total_seconds()
    if ad6hour:
        T += 6 * 60 * 60
    return T


# The bid placed from the front end is greater than the current bid
# and it is gauranteed.
def place_bid(request):
    print(f"request.GET -- {request.GET}")

    if 'phone_num' not in request.session:
        print("phone number not in request session")
        # return render(request, 'global_controller/login.html')
        status = 3
    else:
        # Fetch data from GET request
        auction_id = request.GET['auction_id']
        bid_amount = request.GET['bid_amount']
        bid_amount = int(bid_amount)

        # For cache variables
        customer_identifier = 'customer_id'
        customer_ttl = 60

        if cache.get(customer_identifier + request.session['phone_num']):
            # cache Hit  -- Customer
            customer = cache.get(customer_identifier + request.session['phone_num'])
            print(
                f'Customer object for auction fetched from cache -- ttl {cache.ttl(customer_identifier + request.session["phone_num"])}')
        else:
            # cache Miss -- Customer
            customer = Customer.objects.get(phone=request.session['phone_num'])
            cache.set(customer_identifier + request.session['phone_num'], customer, timeout=customer_ttl)
            print(f"Customer object for auction fetched from DB")
        # ###################################################################

        # Get Auction object from cache or db
        auction_ttl = 30
        auction_identifier = 'auction_id'

        if cache.get(auction_identifier + auction_id):
            # cache hit -- auction
            auction = cache.get(auction_identifier + auction_id)
            print('auction fetched from cache')
        else:
            # cache miss -- auction
            auction = Auction.objects.get(id=auction_id)
            cache.set(auction_identifier + auction_id, auction, timeout=auction_ttl)
            print('auction fetched from db')

        # converts time to absolute second value
        A = convert_time(auction.start_time, False)
        B = convert_time(auction.end_time, False)
        C = convert_time(datetime.now(timezone.utc), False)
        print(auction.start_time)
        print(auction.end_time)
        print(datetime.now(timezone.utc))

        print(f"A -- {A}")
        print(f"B -- {B}")
        print(f"C -- {C}")

        # variable for notification
        status = 0

        # Update the bid of an auction if it is correct time range and greater than
        # previous bid value
        if A <= C and C <= B:
            # If not bid is placed
            if auction.bid is None:
                bid = Bid(bid_amount=bid_amount, customer=customer)
                bid.save()
                auction.bid = bid
                auction.save()

                status = 1
                print(f"First bid placed {auction.bid.bid_amount}")

            # If current bid value is greater than auction's running bid value
            elif auction.bid.bid_amount < bid_amount:
                auction.bid.bid_amount = bid_amount
                auction.bid.customer = customer
                auction.bid.save()

                status = 1
                print(f"Auction bid updated -- Current bid {auction.bid.bid_amount} -- customer {customer.name}")
            # Valid time for bidding
            print("within time range")

            print(f"Current highest bidder -- {auction.bid.customer}")

        else:
            status = 0
            # Invalid time for bidding
            print("outside range")

    context = {
        'status': status
    }
    return JsonResponse(context)


def search_module(request):
    print(request.GET)

    searchstring = request.GET['search']
    matchInvents = Inventory.objects.filter(product__name__icontains=searchstring)
    print(matchInvents)
    print("end matching string")

    if 'cart' not in request.session:
        request.session['cart'] = []
    context = {
        'inventories': matchInvents,
        "cart_size": count_cart_quantity(request)
    }
    return render(request, 'global_controller/global_home.html', context)


def category_module(request, category_name):
    print("category called")
    category_name = category_name.lower().capitalize()
    Category.objects.get_or_create(name=category_name)
    print(category_name)
    matchInvents = Inventory.objects.filter(product__category__name=category_name)

    if 'cart' not in request.session:
        request.session['cart'] = []
    context = {
        'inventories': matchInvents,
        "cart_size": count_cart_quantity(request)
    }

    return render(request, 'global_controller/global_home.html', context)
