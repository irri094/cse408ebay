from django.http import JsonResponse
from django.shortcuts import render
from global_controller.models import *

# Create your views here.


def load_seller(request):
    context = {
        'seller_name': request.session['username']
    }
    return render(request, 'seller/home.html', context)


def load_order_history(request):
    pass


def load_inventory(request):
    # user = Seller.objects.get(name=request.session['username'])
    inventory = Inventory.objects.filter(seller__name=request.session['username'])

    context = {
        'inventories': inventory
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
    context = {}
    return render(request, 'seller/current_order.html', context)


def order_history(request):
    context = {}
    return render(request, 'seller/order_history.html', context)