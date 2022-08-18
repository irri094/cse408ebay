from itertools import product
from unicodedata import category
from django.http import JsonResponse
from django.shortcuts import render, redirect, reverse
from global_controller.models import *
from django.core.files.storage import FileSystemStorage


# Create your views here.
def load_order_history(request):
    pass


def load_inventory(request):
    # This variable is used to display the current wallet amount of the seller.

    current_wallet = Seller.objects.get(phone=request.session['phone_num']).wallet
    inventory = Inventory.objects.filter(seller__name=request.session['username'])
    seller = Seller.objects.get(phone=request.session['phone_num'])

    context = {
        'inventories': inventory,
        'current_wallet': current_wallet,
        'seller': seller,
    }
    print(inventory)
    return render(request, 'seller/home.html', context)


def test_functioon(request):
    print(request.POST)
    return JsonResponse({})


def add_products(request):
    context = {}
    return render(request, 'seller/add_products.html', context)


def current_order(request):
    # the username is the phone number of the user.

    seller_phone = request.session['phone_num']

    # orders = Order.objects.filter(seller__phone=seller_phone)
    orders = Order.objects.filter(seller__phone=seller_phone).order_by('-order_set__date')

    print(orders)
    context = {
        'orders': orders
    }
    return render(request, 'seller/current_order.html', context)


def order_history(request):
    context = {}
    return render(request, 'seller/order_history.html', context)


def auction(request):
    print(request.GET)

    start = request.GET['start']
    end = request.GET['end']
    quantity = request.GET['quantity']
    price = request.GET['price']
    inv_id = request.GET['inventory_id']

    seller = Seller.objects.get(phone=request.session['phone_num'])
    inventory = Inventory.objects.get(id=inv_id)

    auction = Auction(seller=seller, inventory=inventory, start_time=start, end_time=end,
                      base_price=price, quantity=quantity)

    auction.save()

    context = {
        'status': 1,
    }
    return JsonResponse(context)


# Authenticated deliveryman for a corresponding order.
def confirm_deliveryman(request):
    otp = request.GET['otp']
    order_id = request.GET['order_id']

    order = Order.objects.get(id=order_id)
    # status
    #          1 ---- otp matched
    #          2 ---- otp did not match
    if order.OTP == otp:
        order_status = "Picked Up"
        order_status_obj = Order_Status.objects.get(status=order_status)

        order.status = order_status_obj
        order.save()

        status = 1
    else:
        status = 2
    context = {
        'status': status,
    }
    return JsonResponse(context)


# This method is used to make a transaction between the bank and the seller.
# It is done using the 'TRANSACTION' table and the 'wallet' attribute fo the
# current seller. The seller information is fetched from the session variable.
def wallet_to_bank(request):
    # This is amount is used to update the wallet amount in the wallet card of
    # the seller.

    amount = request.GET['amount']

    # update seller wallet
    seller = Seller.objects.get(phone=request.session['phone_num'])
    seller.wallet = int(seller.wallet) - int(amount)
    seller.save()

    current_wallet = seller.wallet

    context = {
        'status': 1,
        'current_wallet': current_wallet,
    }
    return JsonResponse(context)


def product_register(request):
    context = {}
    print(request)
    if request.method == "POST":
        name = request.POST['name']
        price = request.POST['price']
        quantity = request.POST['quantity']
        warranty = request.POST['warranty']
        br = request.POST['brand']
        cat = request.POST['category']
        desc = request.POST['description']
        product_image = request.FILES['image_select']

        new_brand, created = Brand.objects.get_or_create(name=br)

        cat = cat.lower().capitalize()
        new_cat, created = Category.objects.get_or_create(name=cat)

        brand = Brand.objects.get(name=br)
        category = Category.objects.get(name=cat)
        new_product = Product(name=name, brand=brand, category=category, warranty=warranty, description=desc,
                              price=price)
        new_product.save()

        seller = Seller.objects.get(phone=request.session['phone_num'])
        new_inv = Inventory(seller=seller, product=new_product, quantity=quantity, inventory_image=product_image)
        new_inv.save()

        print("seller register : seller saved to db")
        print(f'{new_product} -- successfully registered')
    return redirect(reverse('seller:home'))


def transaction_history(request):
    return render(request, 'seller/transaction_history.html', {})
