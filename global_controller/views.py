import random

from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from django.urls import reverse
from .models import *
import itertools


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
        # 'inventories': Inventory.objects.filter(product_id__in=related_products_list)
    }
    return render(request, 'global_controller/product_detail.html', context)


def product_details_rev(request, seller_id, product_id):
    # ids = ids.split('-')    # TO DO -- generate 4 random similary category products and send them to front end
    # seller_id = ids[0]      # The generated product should be a record of 'INVENTORY'.
    # product_id = ids[1]

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
        # 'inventories': Inventory.objects.filter(product_id__in=related_products_list)
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


def auction_home(request):
    context = {}                                # To Do : Generate random objects to render the html.
    inventories = Auction.objects.all()[:8]   # The random objects must be of 'INVENTORY' record.
    if 'cart' not in request.session:
        request.session['cart'] = []
    context = {
        'inventories': inventories,
        "cart_size": len(request.session['cart'])
    }
    return render(request, 'global_controller/auction.html', context)

def auction_product_details(request, auction_id):
    
    total_random_products = 4
    pid=Auction.objects.get(id=auction_id).product.id
    #auction_id=Auction.objects.get(product_id=p_id).id
    print(auction_id)
    #related_products_list = Auction.objects.all()[:5]
    related_products_list = Auction.objects.exclude(id=auction_id)[:5]
    print(f"related_products_list -- {related_products_list}")
    #indexarray = related_products_list
    # random.shuffle(indexarray)
    #print(indexarray)
    notunarray = []
    #
    #del related_products_list[4:]
    #while len(related_products_list) > 4:
    #    related_products_list.pop()
    seller_name=Auction.objects.get(id=auction_id).seller.name

    context = {
        #'seller': seller_name,
        'auction': Auction.objects.get(id=auction_id),
        'inventories': related_products_list,
        # 'inventories': Inventory.objects.filter(product_id__in=related_products_list)
    }
    return render(request, 'global_controller/auction_product_details.html', context)

