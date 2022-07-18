from django.contrib.auth import authenticate, logout
from django.shortcuts import render

from multiprocessing import context
from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.forms import inlineformset_factory
from django.contrib.auth.forms import UserCreationForm

from .models import *


# from .forms import OrderForm
# from filters import OrderFilter

def register(request):
    context = {}
    if 'username' in request.session:
        return redirect("/")
    if request.method == "POST":
        name = request.POST['username']
        email = request.POST['email']
        address = request.POST['address']
        nid = request.POST['nid']
        phone = request.POST['phone']
        password1 = request.POST['password1']
        password2 = request.POST['password2']
        print(request.POST)
        if password1 == password2 and not User.objects.filter(username=name).exists():
            # 'username': ['sfd'], 'email': ['a@f'], 'address': ['324'], 'nid': ['12321'], 'phone': ['235523'], 'password1': ['fqwf'], 'password2': ['fsa']}
            user_type = UserType.objects.get(type="customer")
            newUser = User(username=name, password=password1, user_type=user_type)
            # user_type = UserType.objects.get(type="customer")
            hubid = Hub.objects.get(address="Dhaka")
            newCustomer = Customer(name=name, address=address, NID=nid, phone=phone, wallet=0,
                                   delivery_address_hub=hubid)
            newCustomer.save()
            newUser.save()

    return render(request, 'global_controller/register.html', context)


def seller_register(request):
    context = {}

    if 'username' in request.session:
        return redirect("/")
    if request.method == "POST":
        name = request.POST['name']
        shopname = request.POST['shopname']
        email = request.POST['email']
        address = request.POST['address']
        nid = request.POST['nid']
        phone = request.POST['phone']
        bank = request.POST['bank']
        bank_acc = request.POST['bank_acc']
        password1 = request.POST['password1']
        password2 = request.POST['password2']
        print(request.POST)
        # 'name': ['a'], 'shopname': ['asd'], 'email': ['a@v'], 'address': ['dhaka'], 'nid': ['25351'], 'bank': ['nhnhn'], 'bank_acc': ['3233'], 'phone': ['111'], 'password1': ['plm'], 'password2': ['plm']

        if password1 == password2 and not User.objects.filter(username=name).exists():
            user_type = UserType.objects.get(type="seller")
            newUser = User(username=name, password=password1, user_type=user_type)
            newUser.save()

            hubid = Hub.objects.get(address="Dhaka")
            newSeller = Seller(name=name, address=address, NID=nid, phone=phone, wallet=0, hub=hubid,
                               shop_name=shopname, bank_name=bank, bank_acc=bank_acc)
            newSeller.save()

    return render(request, 'global_controller/seller_register.html', context)


def logIn(request):
    context = {}
    if 'username' in request.session:
        return redirect("/")
    if request.method == "POST":
        uname = request.POST['username']
        pword = request.POST['password']
        print(uname)
        print(pword)
        user = authenticate(username=uname, password=pword)
        if user is not None:
            request.session['username'] = uname
            # print("in authenticated")
            return redirect("/")

    return render(request, 'global_controller/login.html', context)


def home(request):
    context = {}
    return render(request, 'global_controller/home.html', context)


def user_home(request):
    context = {}
    return render(request, 'user_home.html', context)


def logout_request(request):
    logout(request)
    return redirect("login")