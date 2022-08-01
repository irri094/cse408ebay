from django.http import JsonResponse
from django.shortcuts import render, redirect
from global_controller.models import *
import global_controller.authentication_module
from datetime import date


def load_employee(request):
    if 'username' not in request.session:
        return redirect(global_controller.authentication_module.logIn)
    else:

        context = {
            "emp_name": request.session['username'],
        }
        # Fetches the session cart variable and sends them to front-end to show current-cart

        return render(request, 'employee/employee_home.html', context)
