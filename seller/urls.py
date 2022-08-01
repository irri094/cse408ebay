from django.urls import path, include
from . import views

app_name = 'seller'

urlpatterns = [
    path('', views.load_seller, name='home'),
    path('order_history/', views.load_order_history, name='order_history'),
    path('product_status/', views.load_product_status, name='product_status'),
]
