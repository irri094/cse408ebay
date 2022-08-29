from django.urls import path, include
from . import views

app_name = 'deliveryman'

urlpatterns = [

    path('', views.load_deliveryman, name='home_empty'),
    path('home/', views.load_deliveryman, name='home'),
    path('delivery-details/', views.delivery_details_of_customer, name='delivery-details'),
    path('delivery-details/authenticate-customer/', views.authenticate_customer, name='authenticate-customer'),
]
