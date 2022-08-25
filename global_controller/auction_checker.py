import time
from django.conf import settings
import customer.views
import global_controller.views as gviews
from global_controller.models import *
from datetime import datetime, timezone
import threading


def check_auction():
    thread_run_count = 0
    while True:
        print(f"Thread run count ----- {thread_run_count}")
        auctions = Auction.objects.all()
        check_order = False

        for auction in auctions:
            if gviews.convert_time(auction.end_time, False) <= gviews.convert_time(datetime.now(timezone.utc), True):
                print("auction order maybe placed")
                pkitems = PackageItem.objects.filter(auction=auction)
                for p in pkitems:
                    if p.order is not None:
                        check_order = True
                        continue
                if check_order:
                    check_order = False
                    continue
                
                # Create a transaction record for the auction order
                if auction.bid is not None:
                    print(f"Starting new auction order")

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

                    print(f"Processing new auction order")

                    # create a new order record
                    # pkitems = PackageItem.objects.filter(auction=auction)
                    for p in pkitems:
                        order = Order(seller=auction.seller, product=p.inventory.product, status=order_status,
                                      deliveryman=deliveryman, OTP=customer.views.generate_otp(),
                                      quantity=p.quantity, order_set=order_set)
                        order.save()

                        p.order = order
                        p.save()

                    print(f"New auciton order processed")

        thread_run_count += 1
        print("auctions edited")
        time.sleep(5)


def start_auction_checker_multithreaded(request):
    if not settings.AUCTION_CHECKER_START:
        settings.AUCTION_CHECKER_START = True
        auction_checker_thread = threading.Thread(target=check_auction, args=())
        auction_checker_thread.start()
        print(f"Auction checker thread started")
