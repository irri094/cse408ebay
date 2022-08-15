from django.urls import path, include
from . import views

app_name = 'deliveryman'

urlpatterns = [
    path('', views.load_deliveryman, name='home_empty'),
    path('home/', views.load_deliveryman, name='home'),

]
