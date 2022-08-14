from django.http import JsonResponse
from django.shortcuts import render
from global_controller.models import *


# Create your views here.


def load_seller(request):
    context = {
        'seller_name': request.session['username'],

    }

    print(context)

    return render(request, 'seller/home.html', context)


def load_order_history(request):
    pass


def load_inventory(request):
    # This variable is used to display the current wallet amount of the seller.
    current_wallet = 45400

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


def confirm_deliveryman(request):
    context = {
        'status': 1,
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
