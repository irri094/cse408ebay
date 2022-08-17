from django.urls import path, include
from . import views

app_name = 'customer'

urlpatterns = [
    path('', views.load_customer, name='home'),
    path('order_history/', views.load_order_history, name='order_history'),
    path('product_status/', views.load_product_status, name='product_status'),
    path('remove_from_cart/', views.remove_from_cart, name='remove_from_cart'),
    path('update_to_cart/', views.update_to_cart, name='update_to_cart'),
    path('recharge_wallet/', views.recharge_wallet, name='recharge_wallet'),
    path('change-info/', views.change_info, name='change_info'),

]
