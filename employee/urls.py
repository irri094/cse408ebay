from django.urls import path, include
from . import views

app_name = 'employee'

urlpatterns = [
    path('', views.load_employee, name='home'),
    path('accept/', views.accept_order, name='accept'),
    path('reject/', views.reject_order, name='reject'),
    
]
