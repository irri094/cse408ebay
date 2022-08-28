from django.urls import path, include
from . import views

app_name = 'employee'

urlpatterns = [
    path('', views.load_employee, name='home'),
    path('receiveglobal/', views.load_employee2, name='shipmentreceive'),
    path('sendglobal/', views.load_sending_global, name='shipmentsend'),
    path('sendlocal/', views.load_sending_local, name='localdelivery'),
    path('accept/', views.accept_order),
    path('reject/', views.reject_order),
    
]
