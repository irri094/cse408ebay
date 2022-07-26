from django.shortcuts import render


def load_customer(request):
    return render(request, 'customer/home.html', {})

def load_cart(request):
    pass

def load_ordered_product_status(request):
    return render(request, 'customer/ordered_product_status.html')

def load_buying_history(request):
    return render(request, 'customer/buying_history.html')