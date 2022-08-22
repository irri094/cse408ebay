import random
from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from django.urls import reverse
from .models import *
from django.core.cache import cache


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


def product_details_rev(request, seller_id, product_id):
    total_random_products = 4

    current_product_category = Product.objects.get(id=product_id).category
    related_products_list = Product.objects.filter(category=current_product_category).values_list('id', flat=True)
    index_array = related_products_list
    notunarray = []
    for i in range(0, len(index_array)):
        notunarray.append(index_array[i])
    random.shuffle(notunarray)
    while len(notunarray) > 4:
        notunarray.pop()
    related_products_list = Inventory.objects.filter(id__in=notunarray)
    notunarray = list(related_products_list)
    random.shuffle(notunarray)

    # If data in cache fetch from cache. Otherwise fetch from DB
    # CACHE TTL or product entries
    product_ttl = 30
    product_identifier = 'product_id'

    if cache.get(product_identifier + product_id):
        product = cache.get(product_identifier + product_id)
        print('product fetched from cache')
    else:
        product = Product.objects.get(id=product_id)
        cache.set(product_identifier + product_id, product, timeout=product_ttl)
        print('product fetched from db')

    print(f'Product {product.name} -- TTL {cache.ttl(product_identifier + product_id)}')

    context = {
        'seller': Seller.objects.get(id=seller_id),
        'product': product,
        'inventories': notunarray,
        "cart_size": count_cart_quantity(request),
        'current_inventory': Inventory.objects.get(seller_id=seller_id, product_id=product_id)
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

    # To Do : Generate random objects to render the html.
    auctions = Auction.objects.all()[:8]  # The random objects must be of 'INVENTORY' record.
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

    total_random_products = 5
    related_products_list = Auction.objects.exclude(id=auction_id)[:total_random_products]

    context = {
        'auction': auction,
        'inventories': related_products_list,
    }
    return render(request, 'global_controller/auction_product_details.html', context)


# Total elements of cart elements are counted
def count_cart_quantity(request):
    cart = request.session['cart']
    quantity = 0
    for cart_element in cart:
        quantity += int(cart_element[2])
    return quantity
