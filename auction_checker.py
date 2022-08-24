import time

import customer.views
import global_controller.views as gviews
from global_controller.models import *
from datetime import datetime, timezone


def check_auction():
    while True:
        auctions = Auction.objects.all()

        for auction in auctions:
            if gviews.convert_time(auction.end_time, False) <= gviews.convert_time(datetime.now(timezone.utc), True) and auction.auction_order is None:
                # Create a transaction record for the auction order
                if auction.bid is not None:
                    # make transaction
                    transaction = Transaction(type='buy', amount=auction.bid.bid_amount)
                    transaction.save()

                    # create a order_set for the order
                    order_set = Order_Set(customer=auction.bid.customer, transaction=transaction,
                                          date=datetime.now(timezone.utc).date())
                    order_set.save()

                    # fetch the status object
                    order_status = Order_Status.objects.get(status='In Shop')

                    # fetch a deliveryman
                    deliveryman = Deliveryman.objects.get(id=1)

                    # create a new order record
                    if not auction.is_package :
                        order = Order(seller=auction.seller, product=auction.inventory.product, status=order_status,
                                      deliveryman=deliveryman, OTP=customer.views.generate_otp(), quantity=auction.quantity)
                        order.save()
                        newAuctionOrder = Auction_Order(order=order)
                        newAuctionOrder.save()
                        
                    else:
                        packageItems = PackageItem.objects.filter(auction=auction)
                        for p in packageItems:
                            order = Order(seller=auction.seller, product=p.inventory.product, status=order_status,
                                          deliveryman=deliveryman, OTP=customer.views.generate_otp(),
                                          quantity=p.quantity)
                            order.save()
                            newAuctionOrder = Auction_Order(order=order)
                            newAuctionOrder.save()

        print("auctions edited")
        time.sleep(30)