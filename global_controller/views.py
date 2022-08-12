import random

from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from django.urls import reverse
from .models import *

# Renders the Home page of Bengal Bay.
def home(request):
    context = {}                                # To Do : Generate random objects to render the html.
    inventories = Inventory.objects.all()[:8]   # The random objects must be of 'INVENTORY' record.
    if 'cart' not in request.session:
        request.session['cart'] = []
    context = {
        'inventories': inventories,
        "cart_size": len(request.session['cart'])
    }
    return render(request, 'global_controller/global_home.html', context)

# Renders the product details of a current product
def product_details(request, ids):
    ids = ids.split('-')    # TO DO -- generate 4 random similary category products and send them to front end
    seller_id = ids[0]      # The generated product should be a record of 'INVENTORY'.
    product_id = ids[1]

    # total_random_products = 4
    #
    # current_product_category = Product.objects.get(id=product_id).category
    # print(f"current_product_category -- {current_product_category}")
    # # values_list('id', flat=True)
    # related_products_list = Product.objects.filter(category=current_product_category).values_list('id', flat=True)
    # print(f"related_products_list -- {related_products_list}")
    #
    # list_id = []
    # for id in related_products_list:
    #     list_id.append(id)
    #
    # print(f"{list(related_products_list)} -- {type(list_id)}")
    # related_products_list_id = random.sample(list(list_id), total_random_products)
    # print(f"related_products_list_id -- {related_products_list_id}")
    # print(related_products_list_id)
    #
    # related_products_list = Inventory.objects.filter(product_id__in=related_products_list_id)

    context = {
        'seller': Seller.objects.get(id=seller_id),
        'product': Product.objects.get(id=product_id),
        # 'inventories': Inventory.objects.filter(product_id__in=related_products_list_id)
    }
    return render(request, 'global_controller/product_detail.html', context)


# Cart is added in the session variable as a tuple of  (seller_id, product_id, quantity)
def add_to_cart(request):
    if 'cart' not in request.session:
        request.session['cart'] = []

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
