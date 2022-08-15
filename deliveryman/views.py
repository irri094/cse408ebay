from django.shortcuts import render, redirect, reverse
from global_controller.models import *
import global_controller.authentication_module as a_moudle


# Create your views here.

def load_deliveryman(request):
    # username is the phone number
    if 'username' not in request.session:
        return redirect(reverse('login'))
    print(f"{request.session['username']} -- deliveryman load")

    deliveryman = Deliveryman.objects.get(name=request.session['username'])

    orders = Order.objects.filter(deliveryman=deliveryman)

    print(orders)

    print(' [*] deliveryman is loading ... ')

    deliveryman_coord = "23.725515, 90.390601"

    context = {
        'deliveryman_name': "Deliveryman",
        'title': 'Deliveryman',
        'info': 'This is deliveryman',
        'deliveryman_coord' : deliveryman_coord,
        'orders': orders,
    }

    return render(request, 'Deliveryman/home.html', context)
