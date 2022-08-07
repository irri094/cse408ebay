from django.http import JsonResponse
from django.shortcuts import render, redirect
from global_controller.models import *
import global_controller.authentication_module

def get_list(request):
    if 'username' not in request.session:
        return redirect(global_controller.authentication_module.logIn)
    else:
        orderlist = Order.objects.filter(deliveryman__name=request.session['username'])
        context = {
            'orderlist': orderlist
        }
        return render(request, 'deliveryman/home.html', context)