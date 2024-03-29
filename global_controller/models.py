from django.db import models


# Create your models here.


class UserType(models.Model):
    type = models.CharField(max_length=20)

    def __str__(self):
        return self.type


class User(models.Model):
    username = models.CharField(max_length=100, primary_key=True)
    password = models.CharField(max_length=30)
    user_type = models.ForeignKey(UserType, on_delete=models.CASCADE)

    def __str__(self):
        return str(self.user_type) + " | " + self.username


class Hub(models.Model):
    address = models.CharField(max_length=100)
    coord = models.CharField(max_length=50, default="", null=True)

    def __str__(self):
        return str(self.address)


class Hubman(models.Model):
    hub = models.ForeignKey(Hub, on_delete=models.CASCADE)
    name = models.CharField(max_length=30)
    address = models.CharField(max_length=100)
    NID = models.CharField(max_length=20)
    phone = models.CharField(max_length=100)

    def __str__(self):
        return self.name


class Customer(models.Model):
    delivery_address_hub = models.ForeignKey(Hub, models.CASCADE)
    name = models.CharField(max_length=100)
    address = models.CharField(max_length=100)
    NID = models.CharField(max_length=20)
    phone = models.CharField(max_length=100)
    wallet = models.IntegerField()
    mail = models.EmailField(null=True)

    coord = models.CharField(max_length=50, default="", null=True)

    def __str__(self):
        return self.name + " | " + self.phone


class Seller(models.Model):
    hub = models.ForeignKey(Hub, on_delete=models.CASCADE)
    name = models.CharField(max_length=30)
    address = models.CharField(max_length=100)
    NID = models.CharField(max_length=20)
    phone = models.CharField(max_length=100)
    shop_name = models.CharField(max_length=50)
    bank_name = models.CharField(max_length=30)
    bank_acc = models.CharField(max_length=40)
    wallet = models.IntegerField()
    coord = models.CharField(max_length=50, default="")

    def __str__(self):
        return self.name + " | " + self.shop_name + " | " + str(self.hub.address)


class Brand(models.Model):
    name = models.CharField(max_length=20)

    def __str__(self):
        return self.name


class Category(models.Model):
    name = models.CharField(max_length=20)

    def __str__(self):
        return self.name


class Product(models.Model):
    name = models.CharField(max_length=80)
    brand = models.ForeignKey(Brand, on_delete=models.CASCADE)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    warranty = models.IntegerField()
    description = models.CharField(max_length=1000)
    price = models.IntegerField()

    def __str__(self):
        return self.name


class Deliveryman(models.Model):
    current_hub = models.ForeignKey(Hub, on_delete=models.CASCADE, null=True)
    name = models.CharField(max_length=30)
    address = models.CharField(max_length=100)
    designation = models.CharField(max_length=100)
    NID = models.CharField(max_length=20)
    phone = models.CharField(max_length=100)
    vehicle_no = models.CharField(max_length=20)

    def __str__(self):
        return self.name + " | " + self.designation + " | " + str(self.current_hub)


class Order_Status(models.Model):
    status = models.CharField(max_length=15)

    def __str__(self):
        return self.status


class Transaction(models.Model):
    type = models.CharField(max_length=20)
    amount = models.IntegerField()

    def __str__(self):
        return self.type + " | " + str(self.amount)


class Order_Set(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE)
    date = models.DateField()
    transaction = models.OneToOneField(Transaction, on_delete=models.CASCADE)

    def __str__(self):
        return str(self.customer.name) + " | " + str(self.date) + " | " + str(self.customer.delivery_address_hub.address)


class Order(models.Model):
    seller = models.ForeignKey(Seller, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    status = models.ForeignKey(Order_Status, on_delete=models.CASCADE)
    deliveryman = models.ForeignKey(Deliveryman, on_delete=models.CASCADE)
    OTP = models.CharField(max_length=6)
    quantity = models.IntegerField()
    order_set = models.ForeignKey(Order_Set, on_delete=models.CASCADE)

    def __str__(self):
        return str(self.seller) + " | " + str(self.product) + " | " + str(self.quantity) + " | " + str(self.status)


class Return(models.Model):
    order = models.OneToOneField(Order, on_delete=models.CASCADE)
    status = models.ForeignKey(Order_Status, on_delete=models.CASCADE)

    def __str__(self):
        return str(self.order) + " | " + str(self.status)


class Inventory(models.Model):
    seller = models.ForeignKey(Seller, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.IntegerField()
    inventory_image = models.ImageField(null=True, blank=True)

    def __str__(self):
        return str(self.seller) + " | " + str(self.quantity)


class Bid(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE)
    bid_amount = models.IntegerField()

    def __str__(self):
        return str(self.customer) + " | " + str(self.bid_amount)


class Auction(models.Model):
    auction_name = models.CharField(max_length=100, default='')
    seller = models.ForeignKey(Seller, on_delete=models.CASCADE)
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    base_price = models.IntegerField()
    bid = models.OneToOneField(Bid, null=True, on_delete=models.CASCADE)
    def __str__(self):
        return str(self.seller) + " | " + str(self.base_price)



class PackageItem(models.Model):
    inventory = models.ForeignKey(Inventory, on_delete=models.CASCADE, null=True)
    auction = models.ForeignKey(Auction, on_delete=models.CASCADE, null=True)
    quantity = models.IntegerField()
    order = models.ForeignKey(Order, on_delete=models.CASCADE, null=True)

    def __str__(self):
        return str(self.inventory) + " | " + str(self.quantity)
