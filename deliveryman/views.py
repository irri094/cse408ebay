from django.shortcuts import render, redirect, reverse
from global_controller.models import *
from django.http import JsonResponse
from django.db.models import Q
from datetime import date
# Create your views here.

def load_deliveryman(request):
    # username is the phone number
    if 'username' not in request.session:
        return redirect(reverse('login'))
    print(f"{request.session['username']} -- deliveryman load")

    deliveryman = Deliveryman.objects.get(name=request.session['username'])

    if deliveryman.designation == "Local":
        orders = Order.objects.filter(Q(status__status="Picked Up") | Q(status__status="In Shop") | Q(status__status="In Hub2") | Q(status__status="Out To Delivery"), deliveryman=deliveryman).order_by('-order_set__date')
    else:
        orders = Order.objects.filter(Q(status__status="On Highway") | Q(status__status="In Hub"), deliveryman=deliveryman).order_by('-order_set__date')

    print(orders)

    print(' [*] deliveryman is loading ... ')

    # deliveryman_coord = "23.725515, 90.390601"
    deliveryman_coord = deliveryman.current_hub.coord

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

    deliveryman = Deliveryman.objects.get(name=request.session['username'])

    orders = Order.objects.filter(Q(status__status='Picked up') | Q(status__status='Out To Delivery')).filter(order_set__customer__delivery_address_hub=deliveryman.current_hub)
    print("these are the orders...")
    print(orders)

    # deliveryman_coord = "23.725515, 90.390601"
    deliveryman_coord = deliveryman.current_hub.coord

    if deliveryman.designation != "Local":
        orders = Order.objects.none()
    context = {
        'orders': orders,
        'deliveryman_coord': deliveryman_coord,
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
        orderset = order.order_set
        orderset.date = date.today()
        orderset.save()
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
