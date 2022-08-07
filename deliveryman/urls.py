from django.urls import path, include
from . import views

app_name = 'deliveryman'

urlpatterns = [
    path('', views.get_list, name='home'),
]
