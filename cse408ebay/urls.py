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
import global_controller.views as global_view
import customer.views as customer_views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', global_view.home),
    path('customer/', include('customer.urls', namespace='customer')),
    path('login/', global_view.logIn, name='login'),
    path('register/', global_view.register, name='register'),
    path('seller_register/', global_view.seller_register, name='seller_register'),
    path("logout/", global_view.logout_request, name="logout"),

]
