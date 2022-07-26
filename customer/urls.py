from django.urls import path, include
from . import views

app_name = 'customer'

urlpatterns = [
    path('', views.load_customer, name='home'),
    path('buying_history/', views.load_buying_history, name='buying_history'),
    path('ordered_product_history/', views.load_ordered_product_status, name='ordered_product_history'),
]
