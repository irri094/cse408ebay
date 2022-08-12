from django.shortcuts import render


# Create your views here.

def load_deliveryman(request):

    print(' [*] deliveryman is loading ... ')

    context = {
        'deliveryman_name': "Deliveryman",
        'title': 'Deliveryman',
        'info': 'This is deliveryman'
    }

    return render(request, 'Deliveryman/home.html', context)
