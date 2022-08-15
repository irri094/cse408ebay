import random

from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from django.urls import reverse
from .models import *
import itertools


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

# Renders the product details of a current product
def product_details(request, ids):
    ids = ids.split('-')    # TO DO -- generate 4 random similary category products and send them to front end
    seller_id = ids[0]      # The generated product should be a record of 'INVENTORY'.
    product_id = ids[1]

    total_random_products = 4

    current_product_category = Product.objects.get(id=product_id).category
    print(f"current_product_category -- {current_product_category}")
    # values_list('id', flat=True)
    related_products_list = Product.objects.filter(category=current_product_category).values_list('id', flat=True)
    print(f"related_products_list -- {related_products_list}")
    indexarray = related_products_list
    # random.shuffle(indexarray)
    print(indexarray)
    notunarray = []
    for i in range(0, len(indexarray)):
        notunarray.append(indexarray[i])
    print(notunarray)
    random.shuffle(notunarray)
    while len(notunarray) > 4:
        notunarray.pop()
    print(notunarray)
    related_products_list = Inventory.objects.filter(id__in=notunarray)
    print(f"related_products_list -- {related_products_list}")
    notunarray = list(related_products_list)
    random.shuffle(notunarray)
    print(notunarray)
    print(f"this is the current context data -- \n {Inventory.objects.get(seller_id=seller_id, product_id=product_id)}")

    context = {
        'seller': Seller.objects.get(id=seller_id),
        'product': Product.objects.get(id=product_id),
        'inventories': notunarray,
        "cart_size": count_cart_quantity(request),
        # 'current_inventory' :
        # 'inventories': Inventory.objects.filter(product_id__in=related_products_list)
    }


    return render(request, 'global_controller/product_detail.html', context)


def product_details_rev(request, seller_id, product_id):

    total_random_products = 4

    current_product_category = Product.objects.get(id=product_id).category
    print(f"current_product_category -- {current_product_category}")
    # values_list('id', flat=True)
    related_products_list = Product.objects.filter(category=current_product_category).values_list('id', flat=True)
    print(f"related_products_list -- {related_products_list}")
    indexarray = related_products_list
    # random.shuffle(indexarray)
    print(indexarray)
    notunarray = []
    for i in range(0, len(indexarray)):
        notunarray.append(indexarray[i])
    print(notunarray)
    random.shuffle(notunarray)
    while len(notunarray) > 4:
        notunarray.pop()
    print(notunarray)
    related_products_list = Inventory.objects.filter(id__in=notunarray)
    print(f"related_products_list -- {related_products_list}")
    notunarray = list(related_products_list)
    random.shuffle(notunarray)
    print(notunarray)

    context = {
        'seller': Seller.objects.get(id=seller_id),
        'product': Product.objects.get(id=product_id),
        'inventories': notunarray,
        "cart_size": count_cart_quantity(request),
        'current_inventory': Inventory.objects.get(seller_id=seller_id, product_id=product_id)
        # 'inventories': Inventory.objects.filter(product_id__in=related_products_list)
    }
    print(f"context -- {context}")
    return render(request, 'global_controller/product_detail.html', context)


# Cart is added in the session variable as a tuple of  (seller_id, product_id, quantity)
# If an element exists the quantity is increased otherwise added.
def add_to_cart(request):
    if 'cart' not in request.session:
        request.session['cart'] = []

    seller_id = request.GET['seller_id']
    product_id = request.GET['product_id']
    quantity = request.GET['quantity']

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

# Total elements of cart elements are counted
def count_cart_quantity(request):
    cart = request.session['cart']
    quantity = 0
    for cart_element in cart:
        quantity += int(cart_element[2])
    return quantity