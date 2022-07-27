from django.shortcuts import render, redirect
from django.urls import reverse
from .models import *
import customer.views as customer_views

def logIn(request):
    if 'username' in request.session:
        u_name = request.session['username']
        user = User.objects.get(username=u_name)
        print(f"redirection to corresponding account")
        if user.user_type.type == 'customer':
            print("redirecting to customer")
            return redirect(reverse('customer:home'))
        elif user.user_type.type == 'seller':
            print("redirecting to seller")
            print(f"seller found {u_name}")
        elif user.user_type.type == 'deliveryman':
            print("redirecting to deliveryman")
            print(f"delivery man found {u_name}")

    elif request.method == "POST":
        print("processing authentication")
        u_name = request.POST['username']
        p_word = request.POST['password']
        print('ioasdoiasud')
        user = User.objects.get(username=u_name)
        print(user)
        print("192739187238917")
        if user.username == u_name and user.password == p_word:
            if user.user_type.type == 'customer':
                create_session(request, u_name)
                return redirect(reverse('customer:home'))
            elif user.user_type.type == 'seller':
                create_session(request, u_name)
                print(f"seller found {u_name}")
            elif user.user_type.type == 'deliveryman':
                create_session(request, u_name)
    print("coming down here")
    return render(request, 'global_controller/login.html')


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

            hub_name = address.split(',')[-1].replace(" ", "").lower()
            print(hub_name)
            hub = Hub.objects.get(address=hub_name)
            print(hub)
            newSeller = Seller(name=name, address=address, NID=nid, phone=phone, wallet=0, hub=hub,
                               shop_name=shopname, bank_name=bank, bank_acc=bank_acc)
            newSeller.save()
            print(f'{newSeller} -- successfully registered')
    return render(request, 'global_controller/seller_register.html', context)


def logout_request(request):
    delete_session(request)
    return redirect("login")


def create_session(request, username):
    request.session['username'] = username
    request.session['cart'] = []

def delete_session(request):
    request.session.flush()
    request.session.clear_expired()
    return redirect(logIn)


def go_to_corresponding_account(request):
    u_name = request.session['username']
    user = User.objects.get(username=u_name)

    if user.user_type.type == 'customer':
        print("redirecting to customer")
        return redirect(reverse('customer:home'))
    elif user.user_type.type == 'seller':
        print("redirecting to seller")
        print(f"seller found {u_name}")
    elif user.user_type.type == 'deliveryman':
        print("redirecting to deliveryman")
        print(f"delivery man found {u_name}")