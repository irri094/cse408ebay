import json

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
        # myOrders = getAllOrders(request)
        # deliverymenlist = set()
        # deliv_order = set()
        # for o in myOrders:
        #     deliverymenlist.add(o.deliveryman)
        # print(deliverymenlist)
        # print("these are the deliveryment")
        #
        # # NOW deliverymenlist is a set with all deliverymen who should come to THIS hub
        # context = {
        #     #"emp_name": ,
        #     "employees": deliverymenlist,
        #     "inventories:": myOrders,
        # }
        print(request.session['username'])
        my_orders = getAllOrders(request)

        deliveryman_distinct = my_orders.values('deliveryman').distinct()

        # print(my_orders)
        # print(f"distict -- \n\n {deliveryman_distinct}\n\n")

        lst = []
        context = {}
        context['info'] = {}
        print(deliveryman_distinct)
        for data in deliveryman_distinct:

            deliveryman = Deliveryman.objects.get(id=data['deliveryman'])


            context['info'][deliveryman.name] = {
                'deliveryman' : deliveryman,
            }
            context['info'][deliveryman.name]['deliveryman'] = deliveryman
            context['info'][deliveryman.name]['orders'] = Order.objects.filter(deliveryman=deliveryman, status__status="Picked Up")


        print(f'Payload -- \n {context}')
        # Fetches the session cart variable and sends them to front-end to show current-cart
        return render(request, 'employee/employee_home.html', context)


def getAllOrders(request):
    myHubid = Hubman.objects.get(phone=request.session['phone_num']).id
    # myOrders = Order.objects.filter(Q(seller__hub_id=myHubid) | Q(order_set__customer__delivery_address_hub_id=myHubid),
    #                                 status__status="Picked Up")
    myOrders = Order.objects.filter(Q(seller__hub_id=myHubid) | Q(order_set__customer__delivery_address_hub_id=myHubid),status__status="Picked Up")
    # myOrders = Order.objects.exclude( order_set__customer__delivery_address_hub_id=F('seller__hub_id')).filter(Q(seller__hub_id=myHubid) | Q(order_set__customer__delivery_address_hub_id=myHubid))
    # print("------ different hub payload -------")
    # print(myHubid)
    # print(myOrders)
    # print("---- end different hub --------")
    return myOrders

def accept_order(request):
    # o_name = request.GET['name']
    # print(o_name)
    o_id = request.GET['name']
    order=Order.objects.get(id=o_id)
    print(ord)
    order_status = "In Hub"
    stat = Order_Status.objects.get(status = order_status)

    order.status = stat
    order.save()

    context = {
        'status': 1,
    }

    return JsonResponse(context)

def reject_order(request):
    # o_name = request.GET['name']
    # print(o_name)
    o_id = request.GET['name']
    ord=Order.objects.get(id=o_id)
    print(ord)
    print(ord.quantity)
    #seller= ord.seller
    selr = Seller.objects.get(id = ord.seller.id) 
    print('seller:')
    print(selr)
    prod= Product.objects.get(id = ord.product.id)
    print('product')
    print(prod)
    inv = Inventory.objects.get(seller = selr, product = prod)
    print('inv:')
    print(inv.quantity)
    inv.quantity = int(inv.quantity) + int(ord.quantity)
    print('final inv')
    print(inv.quantity)
    inv.save()
    #order.product.id inventory.id niye +=order.quant 
    ord.delete()

    context = {
        'status': 1,
    }

    return JsonResponse(context)


