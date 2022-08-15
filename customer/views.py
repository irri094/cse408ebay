from django.http import JsonResponse
from django.shortcuts import render, redirect
from global_controller.models import *
import global_controller.authentication_module
import global_controller.views as global_controller_views
from datetime import date
import random
from django.urls import reverse

from django.db.models import Q


def load_customer(request):
    if 'username' not in request.session:
        return redirect(global_controller.authentication_module.logIn)
    else:
        # Fetches the session cart variable and sends them to front-end to show current-cart
        context = generate_cart_dict(request)

        return render(request, 'customer/home.html', context)


# Fetches product's which is not delivered and sends them to frond-end
def load_product_status(request):
    if 'username' not in request.session:
        return redirect(global_controller.authentication_module.logIn)
    else:
        user = Customer.objects.get(name=request.session['username'])
        status = Order_Status.objects.get(id=1)

        ordered_product = Order.objects.filter(order_set__customer=user).order_by('-order_set__date')

        print(ordered_product)

        context = {
            'orders': ordered_product
        }
        return render(request, 'customer/product_status.html', context)


# Fetches the order history and sends them to the front-end to render
def load_order_history(request):
    if 'username' not in request.session:
        return redirect(global_controller.authentication_module.logIn)
    else:
        status = Order_Status.objects.get(status='Picked Up')
        context = {
            'orders' : Order.objects.filter(status=status).order_by('-order_set__date')
        }

        return render(request, 'customer/order_history.html', context)


# When a product is bought from the customer module this function is invoked.
# a order is executed in the following steps sequentially
#       1.  Update seller inventory with the new product count
#       2.  Create new Transaction instance
#       3.  Create new Order_Set instance
#       4.  Create new Order instances per product
#       5.  Reset session cart variable
def buy_product(request):
    if len(request.session['cart']) == 0:
        return JsonResponse({})
    else:
        cart = request.session['cart']
        total_price = 0
        # Inventory update
        for inventory in cart:
            seller_id = inventory[0]
            product_id = inventory[1]
            quantity = inventory[2]

            seller = Seller.objects.get(id=seller_id)
            product = Product.objects.get(id=product_id)

            total_price += int(product.price) * int(quantity)

            # update the inventory after product purchase
            current_inventory = Inventory.objects.get(seller_id=seller_id, product_id=product_id)
            current_quantity = current_inventory.quantity
            current_quantity -= int(quantity)
            current_inventory = Inventory(id=current_inventory.id, quantity=current_quantity, seller=seller,
                                          product=product)
            current_inventory.save()

        print("current inventory updated")

        transaction = Transaction(type='buy', amount=total_price)
        transaction.save()
        print(f"Transaction saved {transaction}")

        customer = Customer.objects.get(name=request.session['username'])

        order_set = Order_Set(customer=customer, transaction=transaction, date=date.today())
        order_set.save()
        print(f"Order set created {order_set}")

        status = Order_Status.objects.get(id=1)
        deliveryman = Deliveryman.objects.get(id=1)

        otp = ""  # To Do -- THE OTP should be generated randomly of 6 character
        # length. This otp is used for product validation on hand-change.
        for i in range(0, 6):
            x = random.randint(0, 61)
            if x < 26:
                otp += chr(x + 97)
            elif x < 52:
                otp += chr(x - 26 + 65)
            else:
                otp += chr(x - 52 + 65)

        print("otp is " + otp)

        for inventory in cart:
            seller_id = inventory[0]
            product_id = inventory[1]
            quantity = inventory[2]

            seller = Seller.objects.get(id=seller_id)
            product = Product.objects.get(id=product_id)

            order = Order(seller=seller, product=product, status=status, deliveryman=deliveryman, OTP=otp,
                          quantity=quantity, order_set=order_set)
            order.save()
            print(f"Order saved {order}")
        # reset cart session variable for future use
        request.session['cart'] = []

        context = {
            'status': 1,
        }

        return JsonResponse(context)


def generate_cart_dict(request):
    cart = []
    for data in request.session['cart']:
        seller_id = data[0]
        product_id = data[1]
        quantity = data[2]

        inventory = Inventory.objects.get(seller_id=seller_id, product_id=product_id)

        cart.append({
            'inventory': inventory,
            'quantity': quantity,
            'amount': int(quantity) * int(inventory.product.price)
        })

    context = {
        "cart": cart,
        "customer_name": request.session['username'],
        "cart_size": global_controller_views.count_cart_quantity(request),
    }
    return context


def remove_from_cart(request):
    remove_id = request.GET['remove_id']

    cart = request.session['cart']
    cart_element = cart[int(remove_id) - 1]
    cart.remove(cart_element)
    request.session['cart'] = cart

    return JsonResponse({})


def update_to_cart(request):
    update_id = request.GET['update_id']
    new_quantity = request.GET['new_quantity']
    cart = request.session['cart']
    updated_cart = cart[int(update_id) - 1]
    updated_cart[2] = new_quantity
    cart[int(update_id) - 1] = updated_cart
    request.session['cart'] = cart

    context = {
        'status': 1,
        'cart_size': global_controller_views.count_cart_quantity(request)
    }

    print(context)

    return JsonResponse(context)


# This is function is called when the 'recharge via bKash' is clicked. It takes
# the recharge amount via request and updates the database. The current amount
# is then displayed to the user.
def recharge_wallet(request):
    current_wallet = 550
    context = {
        'amount': 550,
        'phone': '0170123456',
        'current_wallet': current_wallet,
    }
    return JsonResponse(context)


def change_info(request):
    context = {}
    return render(request, 'customer/change_account_info.html', context)