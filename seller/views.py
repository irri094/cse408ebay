from itertools import product
from unicodedata import category
from django.http import JsonResponse
from django.shortcuts import render
from global_controller.models import *


# Create your views here.
def load_order_history(request):
    pass


def load_inventory(request):
    # This variable is used to display the current wallet amount of the seller.

    current_wallet = Seller.objects.get(phone=request.session['phone']).wallet

    inventory = Inventory.objects.filter(seller__name=request.session['username'])

    context = {
        'inventories': inventory,
        'current_wallet': current_wallet,
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

    seller_phone = request.session['username']

    # orders = Order.objects.filter(seller__phone=seller_phone)
    orders = Order.objects.all()

    print(orders)
    context = {
        'orders': orders
    }
    return render(request, 'seller/current_order.html', context)


def order_history(request):
    context = {}
    return render(request, 'seller/order_history.html', context)


def auction(request):
    context = {
        'status': 1,
    }
    return JsonResponse(context)

# Authenticated deliveryman for a corresponding order.
def confirm_deliveryman(request):

    print(request.GET)
    stat=0
    if (request.GET['otp'] == Order.objects.get(id=request.GET['order_id']).OTP): 
        stat = 1 
    else: 
        stat = 2

    context = {
        'status': stat,
    }
    return JsonResponse(context)


# This method is used to make a transaction between the bank and the seller.
# It is done using the 'TRANSACTION' table and the 'wallet' attribute fo the
# current seller. The seller information is fetched from the session variable.
def wallet_to_bank(request):
    # This is amount is used to update the wallet amount in the wallet card of
    # the seller.
    current_wallet = 27000

    context = {
        'status': 1,
        'current_wallet': current_wallet,
    }
    return JsonResponse(context)

def product_register(request):
    context = {}

    # if 'username' in request.session:
    #     return redirect("seller/add_products/")
    if request.method == "POST":
        name = request.POST['name']
        price = request.POST['price']
        quantity = request.POST['quantity']
        warranty = request.POST['warranty']
        br = request.POST['brand']
        cat = request.POST['category']
        desc = request.POST['description']
        # bank_acc = request.POST['bank_acc']
        # password1 = request.POST['password1']
        # password2 = request.POST['password2']
        # print(request.POST)
        
        # 'name': ['a'], 'shopname': ['asd'], 'email': ['a@v'], 'address': ['dhaka'], 'nid': ['25351'], 'bank': ['nhnhn'], 'bank_acc': ['3233'], 'phone': ['111'], 'password1': ['plm'], 'password2': ['plm']

        #hub_name = address.split(',')[-1].replace(" ", "").lower()
        brand= Brand.objects.get(name=br)
        category=Category.objects.get(name="computer")
        newproduct= Product(name=name, brand=brand, caregory=category, warranty=warranty, description=desc, price=price)
        newproduct.save()
        
        seller=Seller.objects.get(name="asd")
        newinv= Inventory(seller=seller,product=newproduct,quantity=quantity)
        newinv.save()
        #user_type = UserType.objects.get(type="seller")
        # newUser = User(username=phone, password=password1, user_type=user_type)
        # newUser.save()
        # print("seller register : user saved to db")
        # newSeller = Seller(name=name, address=address, NID=nid, phone=phone, wallet=0, hub=hub,
        #                     shop_name=shopname, bank_name=bank, bank_acc=bank_acc)
        # newSeller.save()
        print("seller register : seller saved to db")
        print(f'{newproduct} -- successfully registered')
    return render(request, 'seller.html', context)

