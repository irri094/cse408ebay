from django.urls import path, include
from . import views

app_name = 'seller'

urlpatterns = [
    path('', views.load_inventory, name='home'),
    path("test_function/", views.test_functioon, name="test_function"),
    # path('product_status/', views.load_product_status, name='product_status'),
]
