from itertools import product
from unicodedata import category
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_protect
import json
import random
from datetime import date
from global_controller.models import *
from django.core.files.storage import FileSystemStorage
from django.core.cache import cache
from django.urls import reverse


def generate_otp():
    otp = ""
    for i in range(0, 6):
        x = random.randint(0, 61)
        if x < 26:
            otp += chr(x + 97)
        elif x < 52:
            otp += chr(x - 26 + 65)
        else:
            otp += chr(x - 52 + 48)
    return otp


# Create your views here.
def load_order_history(request):
    pass


def load_inventory(request):
    # This variable is used to display the current wallet amount of the seller.
    seller = Seller.objects.get(phone=request.session['phone_num'])
    print(seller)
    current_wallet = seller.wallet
    inventory = Inventory.objects.filter(seller__name=request.session['username'])
    # seller = Seller.objects.get(phone=request.session['phone_num'])
    ordered = Order.objects.filter(seller=seller, status__status="In Shop").count()
    delivered = Order.objects.filter(seller=seller, status__status="Delivered").count()
    returned = Order.objects.filter(seller=seller, status__status="Returned").count()
    auction = Auction.objects.filter(seller=seller).count()
    # spent =
    # wallet
    context = {
        'inventories': inventory,
        'current_wallet': current_wallet,
        'seller': seller,
        'ordered': ordered,
        'delivered': delivered,
        'returned': returned,
        'auction': auction
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
    orders = Order.objects.filter(seller__phone=seller_phone, status__status='In Shop').order_by('-order_set__date')
    # orders = Order.objects.filter(seller__phone=seller_phone, status__status == 'In Shop').order_by('-order_set__date')

    print(orders)
    context = {
        'orders': orders
    }
    return render(request, 'seller/current_order.html', context)


def order_history(request):
    seller = Seller.objects.get(phone=request.session['phone_num'])
    orders = Order.objects.filter(seller=seller).exclude(status__status='In Shop').order_by('-order_set__date')
    print(orders)
    context = {
        'orders': orders
    }
    return render(request, 'seller/order_history.html', context)


def auction(request):
    # Fetch data from GET request
    start = request.GET['start']
    end = request.GET['end']
    quantity = request.GET['quantity']
    price = request.GET['price']
    inv_id = request.GET['inventory_id']

    # Fetch seller from session for creating new auction object
    seller = Seller.objects.get(phone=request.session['phone_num'])

    # Fetch and update inventory
    inventory = Inventory.objects.get(id=inv_id)
    inventory.quantity = int(inventory.quantity) - int(quantity)
    inventory.save()

    # Create new auction object and save to DB
    auction = Auction(seller=seller, start_time=start, end_time=end,
                      base_price=price, auction_name=inventory.product.name)

    context = {
        'status': 1,
    }
    if auction.start_time > auction.end_time:
        context['status'] = 0
        print("auction time mismatch")
    else:
        auction.save()
        newPackageItem = PackageItem(auction=auction, inventory=inventory, quantity=quantity)
        newPackageItem.save()
        print("auction added")

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
        order.OTP = generate_otp()
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

    # transaction = Transaction(type='RECHARGE', amount=amount)
    # transaction.save()
    # print(f"Transaction saved {transaction}")

    # ord_set = Order_Set(customer=seller,date=date.todya(), transaction=transaction)
    # ord_set.save()
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


# Package auction
def auction_multiple_product(request):
    print(request.GET)
    pydict = request.GET.dict()
    print(pydict)
    # print(f"len of inventories -- {len(request.GET['inventoryidlst[]'])}")
    # print(f"len of qunantities -- {len(request.GET['quantitylst[]'])}")

    inventory_id_lst = json.loads(request.GET['inventoryidlst'])
    quantity_lst = json.loads(request.GET['quantitylst'])
    start_time = request.GET['start_time']
    end_time = request.GET['end_time']
    base_price = request.GET['base_price']
    package_name = request.GET['package_name']

    print(inventory_id_lst)
    print(quantity_lst)
    print(start_time)
    print(end_time)
    print(base_price)

    print("aaaaaaaaa")

    for i in range(0, len(quantity_lst)):
        actualcnt = Inventory.objects.get(id=inventory_id_lst[i]).quantity
        if int(quantity_lst[i]) >= actualcnt or int(quantity_lst[i]) <= 0:
            context = {
                'status': 0,
            }
            print("quantity is invalid")
            return JsonResponse(context)

    seller = Seller.objects.get(phone=request.session['phone_num'])
    new_auction = Auction(seller=seller, start_time=start_time, end_time=end_time,
                          base_price=base_price, auction_name=package_name)
    new_auction.save()

    for i in range(0, len(inventory_id_lst)):
        cur_inventory = Inventory.objects.get(id=inventory_id_lst[i])
        newPackageItem = PackageItem(inventory=cur_inventory, auction=new_auction, quantity=quantity_lst[i])
        newPackageItem.save()

    print("new package auction made")
    context = {
        'status': 1,
    }
    return JsonResponse(context)


def restock_inventory(request):
    quantity = request.GET['restock']
    inventory_id = request.GET['inventory_id']

    inventory = Inventory.objects.get(id=inventory_id)

    # update inventory
    inventory.quantity = int(inventory.quantity) + int(quantity)
    inventory.save()

    context = {
        'restocked_quantity': inventory.quantity
    }
    return JsonResponse(context)
