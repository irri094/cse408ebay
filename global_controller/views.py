from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from django.urls import reverse
from .models import *


def home(request):
    context = {}
    inventories = Inventory.objects.all()[:8]
    context = {
        'inventories': inventories,
    }
    return render(request, 'global_controller/global_home.html', context)


def product_details(request, ids):
    ids = ids.split('-')
    seller_id = ids[0]
    product_id = ids[1]

    context = {
        'seller': Seller.objects.get(id=seller_id),
        'product': Product.objects.get(id=product_id),
    }
    return render(request, 'global_controller/product_detail.html', context)


def add_to_cart(request):
    seller_id = request.GET['seller_id']
    product_id = request.GET['product_id']
    quantity = request.GET['quantity']

    temp_cart = request.session['cart']
    temp_cart.append((seller_id, product_id, quantity))
    request.session['cart'] = temp_cart

    print(request.session['cart'])
    context = {
        "status": 1,
        "cart_size": len(request.session['cart'])
    }
    return JsonResponse(context)


