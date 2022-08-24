from django.http import JsonResponse
from django.shortcuts import render, redirect
from global_controller.models import *
import global_controller.authentication_module
from datetime import date


def load_employee(request):
    if 'username' not in request.session:
        return redirect(global_controller.authentication_module.logIn)
    else:
        nam = request.session['username']

        emp= Hubman.objects.get(name=nam)
        order_list = Deliveryman.objects.filter()
        context = {
            #"emp_name": ,
            "employees": emp
        }
        # Fetches the session cart variable and sends them to front-end to show current-cart
        return render(request, 'employee/employee_home.html', context)

def load_return(request):
    context = {
            #"emp_name": ,
            #"employee": emp
        }
    return render(request, 'employee/return.html', context)
