"""cse408ebay URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django import views
from django.contrib import admin
from django.urls import path, include
import customer
import global_controller.views as global_view
import customer.views as customer_views
import global_controller.authentication_module
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', global_view.home, name='global_home'),
    path('customer/', include('customer.urls', namespace='customer')),
    path('employee/', include('employee.urls', namespace='employee')),
    path('seller/', include('seller.urls', namespace='seller')),
    path('deliveryman/', include('deliveryman.urls', namespace='deliveryman')),
    path('login/', global_controller.authentication_module.logIn, name='login'),
    path('register/', global_controller.authentication_module.register, name='register'),
    path('seller_register/', global_controller.authentication_module.seller_register, name='seller_register'),
    path("logout/", global_controller.authentication_module.logout_request, name="logout"),
    path("details/<slug:ids>/", global_view.product_details, name="details"),
    path("product-details/<slug:seller_id>/<slug:product_id>", global_view.product_details_rev, name="product-details"),
    path("auction-product-details/<slug:auction_id>", global_view.auction_product_details,
         name="auction-product-details"),
    path("add_to_cart/", global_view.add_to_cart, name="add_to_cart"),
    path('auction/', global_view.auction_home, name='auction_home'),
    # customer stuffs
    path("buy_product/", customer.views.buy_product, name="buy_product"),
    path("seller_register/get_location_from_coordinate/",
         global_controller.authentication_module.get_address_from_coordinate, name='coordinate-to-address'),
    path("send-mail", global_controller.authentication_module.test_mail, name='send-mail'),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
