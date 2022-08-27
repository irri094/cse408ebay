from django.shortcuts import render, redirect, reverse
from global_controller.models import *
from django.http import JsonResponse


# Create your views here.

def load_deliveryman(request):
    # username is the phone number
    if 'username' not in request.session:
        return redirect(reverse('login'))
    print(f"{request.session['username']} -- deliveryman load")

    deliveryman = Deliveryman.objects.get(name=request.session['username'])

    orders = Order.objects.filter(deliveryman=deliveryman).order_by('-order_set__date')

    print(orders)

    print(' [*] deliveryman is loading ... ')

    deliveryman_coord = "23.725515, 90.390601"

    context = {
        'deliveryman_name': "Deliveryman",
        'title': 'Deliveryman',
        'info': 'This is deliveryman',
        'deliveryman_coord': deliveryman_coord,
        'orders': orders,
    }

    return render(request, 'Deliveryman/home.html', context)


def delivery_details_of_customer(request):
    # order_set = Order_Set.objects.filter(order__status__status='Picked up')
    orders = Order.objects.filter(status__status='Picked up')
    print("these are the orders...")
    print(orders)

    context = {
        'orders': orders
    }
    return render(request, 'Deliveryman/delivery-details-of-customer.html', context)


def authenticate_customer(request):
    otp = request.GET['otp']
    order_id = request.GET['order_id']

    order = Order.objects.get(id=order_id)

    # Check the otp of the order
    if order.OTP == otp:
        # Update the status of the order
        order_status = Order_Status.objects.get(status='Delivered')
        order.status = order_status
        order.save()
        # set status to 1 for successful notification
        status = 1
    else:
        # set status to 0 for failure notification
        status = 0

    context = {
        'status': status
    }
    return JsonResponse(context)
