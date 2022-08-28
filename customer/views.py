from django.http import JsonResponse
from django.shortcuts import render, redirect
from global_controller.models import *
import global_controller.authentication_module
import global_controller.views as global_controller_views
import employee.views as employee_views
from datetime import date
import random
from django.core.mail import send_mail

from django.urls import reverse
from django.db.models import Q


def load_customer(request):
    if 'username' not in request.session:
        return redirect(global_controller.authentication_module.logIn)
    else:
        print(request.session['username'])
        customer = Customer.objects.get(phone=request.session['phone_num'])
        print(customer)
        # Fetches the session cart variable and sends them to front-end to show current-cart
        # process= Order.objects.get(status__status = "In Shop")
        # deliv= Order.objects.get(status__status = "Delivered")

        context = generate_cart_dict(request)

        return render(request, 'customer/home.html', context)


# Fetches product's which is not delivered and sends them to frond-end
def load_product_status(request):
    if 'username' not in request.session:
        return redirect(global_controller.authentication_module.logIn)
    else:
        user = Customer.objects.get(name=request.session['username'])
        status = Order_Status.objects.get(id=1)

        ordered_product = Order.objects.filter(order_set__customer=user).exclude(status__status='Delivered').order_by(
            '-order_set__date')

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
        status = Order_Status.objects.get(status='Delivered')
        context = {
            'orders': Order.objects.filter(status=status,
                                           order_set__customer__phone=request.session["phone_num"]).order_by(
                '-order_set__date')
        }

        return render(request, 'customer/order_history.html', context)


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


def send_product_bought_confirmation_mail(request):
    customer = Customer.objects.get(phone=request.session['phone_num'])
    mail_to = [customer.mail]
    mail_from = 'bengalbay53@gmail.com'
    mail_subject = "Bengal Bay"
    mail_body = 'Dear ' + customer.name + ",\nYou successfully bought your products. Thank you for shopping from Bengal Bay.\n\nBe safe and happy shopping 🛍\n\nRegards\nThe Bengal Bay"

    send_mail(mail_subject,
              mail_body,
              mail_from,
              mail_to,
              fail_silently=True)


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
        cnt = 1
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
                                          product=product, inventory_image=current_inventory.inventory_image)
            current_inventory.save()

        print("current inventory updated")

        # Create a Transaction for buying products of customer
        transaction = Transaction(type='buy', amount=total_price)
        transaction.save()
        print(f"Transaction saved {transaction}")

        #  Create an order set for a set of orders for future navigation through the orders
        customer = Customer.objects.get(name=request.session['username'])
        order_set = Order_Set(customer=customer, transaction=transaction, date=date.today())
        order_set.save()
        print(f"Order set created {order_set}")

        # Initialize the order's status and assign a deliveryman
        status = Order_Status.objects.get(status="In Shop")
        # deliveryman = Deliveryman.objects.get(id=2)

        # Generate an OTP for products
        otp = generate_otp()

        print("otp is " + otp)

        for inventory in cart:
            # Fetch session variables by element accordingly
            seller_id = inventory[0]
            product_id = inventory[1]
            quantity = inventory[2]

            # Fetch the respective objects
            seller = Seller.objects.get(id=seller_id)
            product = Product.objects.get(id=product_id)

            # Create an order for a corresponding order_set
            deliveryman = employee_views.getlocaldriver(seller.hub.id)
            order = Order(seller=seller, product=product, status=status, deliveryman=deliveryman, OTP=otp,
                          quantity=quantity, order_set=order_set)
            order.save()

            # update seller wallet
            seller = Seller.objects.get(id=seller_id)
            seller.wallet = int(seller.wallet) + (int(product.price) * int(quantity))
            seller.save()

            print(f"Order saved {order}")

        # Update customer wallet
        customer = Customer.objects.get(phone=request.session['phone_num'])
        customer.wallet = int(customer.wallet) - int(total_price)
        customer.save()

        # Send a mail to customer when successfully the products are bought and
        # backend logics are handled
        send_product_bought_confirmation_mail(request)

        # reset cart session variable
        request.session['cart'] = []

        context = {
            'status': 1,
        }

        return JsonResponse(context)


def generate_cart_dict(request):
    print('username')
    print(request.session['username'])
    customer = Customer.objects.get(phone=request.session['phone_num'])
    cart = []
    for data in request.session['cart']:
        seller_id = data[0]
        product_id = data[1]
        quantity = data[2]

        inventory = Inventory.objects.get(seller_id=seller_id, product_id=product_id)
        # process = Order.objects.get()
        # delivered

        cart.append({
            'inventory': inventory,
            'quantity': quantity,
            'amount': int(quantity) * int(inventory.product.price)
        })

    process = Order.objects.filter(order_set__customer=customer, status__status="In Shop").count()
    deliv = Order.objects.filter(order_set__customer=customer, status__status="Delivered").count()
    buy = 0
    rcgrg = 0
    buylst = Order_Set.objects.filter(customer=customer)
    # for b in buylst:
    #     buy+=b.transaction.amount
    # print(buy)

    # for b in buylst:
    #     type=b.transaction.type
    #     if type == "RECHARGE":
    #         rcgrg+=b.transaction.amount

    # for b in buylst:

    #     buy+=b.transaction.amount
    # print(buy)

    # spntlst= Order_Set.objects.filter(customer=customer)
    for b in buylst:
        type = b.transaction.type
        if type == "BUY":
            buy += b.transaction.amount
        elif type == "RECHARGE":
            rcgrg += b.transaction.amount
    print(buy)
    print(rcgrg)
    print(process)

    context = {
        "cart": cart,
        "customer_name": request.session['username'],
        "cart_size": global_controller_views.count_cart_quantity(request),
        "wallet": Customer.objects.get(phone=request.session['phone_num']).wallet,
        "processing": process,
        "delivered": deliv,
        "spent": buy,
        "recharge": rcgrg
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
    print("recharge wallet view.py")
    print(request.GET)

    addedtaka = request.GET['taka']
    addedtaka = int(addedtaka)
    phone = request.GET['phone']
    otp = request.GET['otp']
    current_wallet = Customer.objects.get(phone=phone).wallet
    # print("wallet  = ")
    # print(current_wallet)
    # print(addedtaka)
    current_wallet += addedtaka

    cust = Customer.objects.get(phone=phone)
    cust.wallet = current_wallet
    cust.save()

    transaction = Transaction(type='RECHARGE', amount=addedtaka)
    transaction.save()
    print(f"Transaction saved {transaction}")

    #  Create an order set for a set of orders for future navigation through the orders
    customer = Customer.objects.get(phone=request.session['phone_num'])
    order_set = Order_Set(customer=customer, transaction=transaction, date=date.today())
    order_set.save()
    print(f"Order set created {order_set}")

    context = {
        'amount': addedtaka,
        'phone': phone,
        'current_wallet': current_wallet,
    }

    print(context)

    return JsonResponse(context)


def change_info(request):
    context = {}
    return render(request, 'customer/change_account_info.html', context)

def transactions(request):
    print(request.session['username'])
    customer = Customer.objects.get(phone=request.session['phone_num'])
    t_list = Order_Set.objects.filter(customer=customer).order_by('-date')
    print(t_list)
    # transaction=[]
    # for t in t_list:
    #     transaction.add(t.transactions)
    context={
        'list': t_list
        #'list': transaction
    }
    return render(request, 'customer/transactions.html', context)
