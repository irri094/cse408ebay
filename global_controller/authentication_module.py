from django.shortcuts import render, redirect
from django.urls import reverse
from .models import *
from django.http import JsonResponse
from geopy.geocoders import Nominatim
from django.core.mail import send_mail

# Login Authentication Module
def logIn(request):
    if 'username' in request.session:
        print(request.session['username'])  # To Do -- the login function should work with
    if 'username' in request.session:  # the phone number, not the first_name.
        phone = request.session['phone_num']
        user = User.objects.get(username=phone)
        print(f"redirection to corresponding account")
        if user.user_type.type == 'customer':
            print("redirecting to customer")
            return redirect(reverse('customer:home'))
        elif user.user_type.type == 'seller':
            print("redirecting to seller")
            return redirect(reverse('seller:home'))
        elif user.user_type.type == 'deliveryman':
            print("redirecting to deliveryman")
            return redirect(reverse('deliveryman:home'))
        elif user.user_type.type == 'employee':
            print("redirecting to employee")
            return redirect(reverse('employee:home'))

    elif request.method == "POST":
        print("processing authentication")
        u_name = request.POST['username']
        p_word = request.POST['password']
        print('ioasdoiasud')
        user = User.objects.get(username=u_name)
        print(user)
        print("192739187238917")
        print(f"user_username -- {user.username}  || {u_name}")
        print(f"user_password -- {user.password}  || {p_word}")

        if user.username == u_name and user.password == p_word:
            print('1')
            if user.user_type.type == 'customer':
                tmpname = Customer.objects.get(phone=u_name).name
                print(2)
                create_session(request, tmpname, u_name)
                return redirect(reverse('customer:home'))
            elif user.user_type.type == 'seller':
                print(3)
                tmpname = Seller.objects.get(phone=u_name).name
                create_session(request, tmpname, u_name)
                print(f"seller found {u_name}")
                return redirect(reverse('seller:home'))
            elif user.user_type.type == 'deliveryman':
                print(4)
                tmpname = Deliveryman.objects.get(phone=u_name).name
                create_session(request, tmpname, u_name)
                return redirect(reverse('deliveryman:home'))
            elif user.user_type.type == 'employee':
                print(4)
                tmpname = Hubman.objects.get(phone=u_name).name
                create_session(request, tmpname, u_name)
                return redirect(reverse('employee:home'))
    print("coming down here")
    return render(request, 'global_controller/login.html')


# The account is created and the phone number is used as the username
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
        if password1 == password2 and not User.objects.filter(username=phone).exists():
            # 'username': ['sfd'], 'email': ['a@f'], 'address': ['324'], 'nid': ['12321'], 'phone': ['235523'], 'password1': ['fqwf'], 'password2': ['fsa']}
            user_type = UserType.objects.get(type="customer")
            new_user = User(username=phone, password=password1, user_type=user_type)
            # user_type = UserType.objects.get(type="customer")
            try:
                hub = Hub.objects.get(address=address)
            except:
                return render(request, 'global_controller/customer_register.html', context)
            new_customer = Customer(name=name, address=address, NID=nid, phone=phone, wallet=0,
                                   delivery_address_hub=hub, mail=email)
            new_customer.save()
            new_user.save()

    # return render(request, 'global_controller/register.html', context)
    return render(request, 'global_controller/customer_register.html', context)


# The account is created and the phone number is used as the username.
def seller_register(request):
    context = {}

    if 'username' in request.session:
        return redirect("/")
    if request.method == "POST":

        print(f" post -- {request.POST}")

        name = request.POST['name']
        shopname = request.POST['shopname']
        email = request.POST['email']
        address = request.POST['address']
        nid = request.POST['nid']
        phone = request.POST['phone']
        bank = request.POST['bank']
        bank_acc = request.POST['bank_acc']
        coordinate = request.POST['coordinate']
        password1 = request.POST['password1']
        password2 = request.POST['password2']
        print(request.POST)
        # 'name': ['a'], 'shopname': ['asd'], 'email': ['a@v'], 'address': ['dhaka'], 'nid': ['25351'], 'bank': ['nhnhn'], 'bank_acc': ['3233'], 'phone': ['111'], 'password1': ['plm'], 'password2': ['plm']

        if password1 == password2 and not User.objects.filter(username=phone).exists():
            print(1)
            hub_name = address.split(',')[-1].replace(" ", "").lower()
            try:
                print(2)
                hub = Hub.objects.get(address=hub_name)
            except:
                print(3)
                return render(request, 'global_controller/seller_register.html', context)
            print(4)
            print(hub)
            user_type = UserType.objects.get(type="seller")
            new_user = User(username=phone, password=password1, user_type=user_type)
            new_user.save()
            print("seller register : user saved to db")
            new_seller = Seller(name=name, address=address, NID=nid, phone=phone, wallet=0, hub=hub,
                                shop_name=shopname, bank_name=bank, bank_acc=bank_acc, coord=coordinate)
            new_seller.save()
            print("seller register : seller saved to db")
            print(f'{new_seller} -- successfully registered')
            return redirect(reverse('login'))
    return render(request, 'global_controller/seller_register.html', context)


def logout_request(request):
    delete_session(request)
    print('session deleted')
    return redirect("login")


def create_session(request, username, phonennum):
    request.session['username'] = username
    request.session['phone_num'] = phonennum
    if 'cart' not in request.session:
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
        return redirect(reverse('seller:home'))
    elif user.user_type.type == 'deliveryman':
        print("redirecting to deliveryman")
        print(f"delivery man found {u_name}")
        return redirect(reverse('deliveryman:home'))


def get_address_from_coordinate(request):
    print(request.GET)
    print("here it is")
    coordinate = request.GET['coordinate']
    geo_loc = Nominatim(user_agent='GetLoc')
    location = geo_loc.reverse(coordinate)

    print(location.raw['display_name'])

    context = {
        'address': location.raw['display_name']
    }
    return JsonResponse(context)

def test_mail(request):
    print('test mail started')
    mail_from = 'bengalbay53@gmail.com'
    mail_to = ["1705109@ugrad.cse.buet.ac.bd"]
    mail_body = 'You have successfully bought your product'
    mail_name = 'Bengal Bay'
    mail_subject = 'Product Bought'
    # subject, mail_body, from, to
    send_mail(mail_subject,
              mail_body,
              mail_from,
              mail_to,
              fail_silently=True)
    print('test mail ended')
    return redirect(reverse('global_home'))
