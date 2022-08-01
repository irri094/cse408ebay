from django.shortcuts import render


# Create your views here.
def load_seller(request):
    context = {
        'seller_name': request.session['username']
    }
    return render(request, 'seller/home.html', context)


def load_order_history(request):
    pass


def load_product_status(request):
    pass
