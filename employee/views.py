from django.http import JsonResponse
from django.shortcuts import render, redirect
from global_controller.models import *
import global_controller.authentication_module
from django.db.models import F
from django.db.models import Q
from datetime import date


def load_employee(request):
    if 'username' not in request.session:
        return redirect(global_controller.authentication_module.logIn)
    else:
        myOrders = getAllOrders(request)
        deliverymenlist = set()
        deliv_order = set()
        # context = {
        #     #"emp_name": ,
        #     "employees": deliverymenlist,
        #     "inventories:": {
        #         "order":deliv_order,}
        # }
        for o in myOrders:
            deliverymenlist.add(o.deliveryman)
        print(deliverymenlist)
        print("these are the deliveryment")
        for d in deliverymenlist:
            d_order=Order.objects.filter(deliveryman = d)
            deliv_order.add(d_order)
        # NOW deliverymenlist is a set with all deliverymen who should come to THIS hub
        print(deliv_order)
        print("these are the orders")
        context = {
            #"emp_name": ,
            "employees": deliverymenlist,
            "inventories:": myOrders,
        }
        # Fetches the session cart variable and sends them to front-end to show current-cart
        return render(request, 'employee/employee_home.html', context)

def getAllOrders(request):
    myHubid = Hubman.objects.get(phone=request.session['phone_num']).id
    myOrders = Order.objects.filter(Q(seller__hub_id=myHubid) | Q(order_set__customer__delivery_address_hub_id=myHubid))
    #myOrders = Order.objects.exclude( order_set__customer__delivery_address_hub_id=F('seller__hub_id')).filter(Q(seller__hub_id=myHubid) | Q(order_set__customer__delivery_address_hub_id=myHubid))
    print("------ different hub payload -------")
    print(myHubid)
    print(myOrders)
    print("---- end different hub --------")
    return myOrders
