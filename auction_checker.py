# import customer.views
# import global_controller.views
# from global_controller.models import *
# from datetime import datetime, timezone
#
#
# def check_auction():
#     while True:
#         auctions = Auction.objects.all()
#
#         for auction in auctions:
#             if auction.end_time <= datetime.now(timezone.utc) and auction.auction_order is None:
#                 # Create a transaction record for the auction order
#                 transaction = Transaction(type='buy', amount=auction.bid.bid_amount)
#                 transaction.save()
#
#                 # create a order_set for the order
#                 order_set = Order_Set(customer=auction.bid.customer, transaction=transaction,
#                                       date=datetime.now(timezone.utc).date())
#                 order_set.save()
#
#                 # fetch the status object
#                 order_status = Order_Status.objects.get(status='In Shop')
#
#                 # fetch a deliveryman
#                 deliveryman = Deliveryman.objects.get(id=1)
#
#                 # create a new order record
#                 order = Order(seller=auction.seller, product=auction.inventory.product, status=order_status,
#                               deliveryman=deliveryman, OTP=customer.views.generate_otp(), quantity=)
#                 # order_set = Order_Set(customer=auction.bid.customer, )
#                 pass
