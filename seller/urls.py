from django.urls import path, include
from . import views

app_name = 'seller'

urlpatterns = [
    path('', views.load_inventory, name='home'),
    path("test_function/", views.test_functioon, name="test_function"),
    path("order_history/", views.order_history, name="order_history"),
    path("current_order/", views.current_order, name="current_order"),
    path("add_products/", views.add_products, name="add_products"),
    path("auction/", views.auction, name="auction"),
    # path('product_status/', views.load_product_status, name='product_status'),
]
