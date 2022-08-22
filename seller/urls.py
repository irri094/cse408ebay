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
    path("wallet_to_bank/", views.wallet_to_bank, name="wallet_to_bank"),
    path("current_order/confirm_deliveryman/", views.confirm_deliveryman, name="confirm_deliveryman"),
    path("product_register/", views.product_register, name="product_register"),
    path("transcation-history/", views.transaction_history, name="transaction-history"),
    path("auction-multiple-product/", views.auction_multiple_product, name="auction-multiple-product"),
]
