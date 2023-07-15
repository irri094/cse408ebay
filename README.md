# Bengal Bay

Bengal Bay is our academic project of level 4/Term 1 . We tried to implement the features of an e-commerce site. The motivation for our project is to provide an efficient and faster platform for customer and seller interaction. Our major features include: 
 
  - Order a product
  - Sell a product 
  - Ship a product 
  - Order tracking
  - Auction of products 
  - Bid 
  - Wallet 
  - Mail Automation
  - Cache Implementation
  - Real-time Auction tracking

## Order a Product
Products from different vendors can be seen and browsed in the homepage. products can also be searched by category or with any keyword through the search box. After registering as a "Customer", any product from any vendor can be bought. All the products selected will be added to the cart and all can be bought together. Any product can be removed from the cart before finally buying. Orders and Transactions can be seen from respective tabs. Ordered can be tracked until it is delivered.

## Sell a Product
After registering as "Seller", products can be sold. Inventory can be added from the Add Product tab and restocked form the homepage.  Currently ordered products can be seen from Current Order tab. Also all the products sold will be shown in Order History tab. Ordered and auction summary can be seen in a summary card. 

## Order Tracking
After ordering a product, it can be tracked. It will be picked up from the seller by a deliveryman. Here an OTP is generated and must be matched before handing over the product. Then the order status will be changed to "Picked Up". Then the deliveryman will provide the product in a hub and the hubman will receive after checking. Then the status will be "In Hub". From here the product will be sent to the customer and another OTP must be matched before handing over to the customer. The status will now be "Delivered". When seller and customer are in same region under the same hub, it will be directly delivered to the customer without going through hub.


When customer and seller are under the same hub:

Seller &rarr Local Deliveryman &rarr Customer


(Status) : In Shop --> Picked Up --> Delivered

When customer and seller are under different hub:

Seller --> Local Deliveryman --> Hub Employee --> Inter-District Deliveryman --> Hub Employee --> Local Deliveryman --> Customer


(Status) : In Shop --> Picked Up --> In Hub --> On Highway --> In Hub2 --> Out To Delivery --> Delivered

 
## Bidding in an Auction
Bid can be placed by any customer on any products of any on-going auction. The bid amount must be higher than the current bid and lower than the wallet. After winning the auction the products will be added to his cart automatically. Any product can be chosen for auction. Multiple products can be chosen as a package auction with the Auction Multiple button. 

## Wallet
Transactions of customers are made from wallet. Products can be purchased if the amount isn't higher than current wallet. wallet can be recharged from Bkash/Nagad. Every seller also has his own wallet. Seller wallet can transferred to bank account that were provided while creating the account. Seller wallet will increase every-time a product is sold directly or from auction
 
## Map for faster traversal (LeafletJS)
Deliveryman can see the map for **finding the path** to seller shop and also to customer. **Shortest route** is shown from deliveryman to customer and seller current location for faster traversal.  

## Cache (Redis)
For **reducing Database load**, cache is implemented. Each time a customer browses a product or auction items, the cache will be checked first.If **cache hit** happens then data will be fetched from the cache, otherwise for **cache miss** the data is fetched from cache and saved to cache with a **TTL**. This will drastically **decrease the load time** and also Database load when a lot of customer are trying to browse. Cache implementation was done with the help of **Redis**.

## Realtime Auction Tracking (Multi-threading)
After an auction is placed, it will have an end time. After that time the auction will close, the product will be removed from the auction list and an order will be placed on the cart of the highest bidder automatically for purchase. For checking the auction end time and automate the process, **multi-threading** is used. 

## Mail Automation
Whenever a customer buys a product, a real-time mail is sent to the customer. 

#### Execution steps
1. Install the required dependencies:
   ```pip install -r requirements.txt```
2. Create database in MySQL and update `settings.py`.
3. Run the application:
 ```python3 manage.py runserver```
