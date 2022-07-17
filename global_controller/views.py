from django.shortcuts import render

from multiprocessing import context
from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.forms import inlineformset_factory
from django.contrib.auth.forms import UserCreationForm

from .models import*
#from .forms import OrderForm
#from filters import OrderFilter

def register(request):
    context={}
    return render(request, 'global_controller/register.html',context)

def seller_register(request):
    context={}
    return render(request, 'global_controller/seller_register.html',context)

def logIn(request):
    context={}
    return render(request, 'global_controller/login.html',context)

def home(request):
    context={}
    return render(request, 'global_controller/home.html',context)

def user_home(request):
    context={}
    return render(request, 'user_home.html',context)



# Create your views here.