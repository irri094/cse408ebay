# Generated by Django 4.0.6 on 2022-07-17 14:52

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Auction',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('start_time', models.DateTimeField()),
                ('end_time', models.DateTimeField()),
                ('quantity', models.IntegerField()),
                ('base_price', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Brand',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Customer',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
                ('address', models.CharField(max_length=100)),
                ('NID', models.CharField(max_length=20)),
                ('phone', models.CharField(max_length=100)),
                ('wallet', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Deliveryman',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
                ('address', models.CharField(max_length=100)),
                ('designation', models.CharField(max_length=100)),
                ('NID', models.CharField(max_length=20)),
                ('phone', models.CharField(max_length=100)),
                ('vehicle_no', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Hub',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('address', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('OTP', models.CharField(max_length=6)),
                ('quantity', models.IntegerField()),
                ('deliveryman', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='global_controller.deliveryman')),
            ],
        ),
        migrations.CreateModel(
            name='Order_Status',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.CharField(max_length=15)),
            ],
        ),
        migrations.CreateModel(
            name='Transaction',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('type', models.CharField(max_length=20)),
                ('amount', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='UserType',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('type', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('username', models.CharField(max_length=20, primary_key=True, serialize=False)),
                ('password', models.CharField(max_length=30)),
                ('user_type', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='global_controller.usertype')),
            ],
        ),
        migrations.CreateModel(
            name='Seller',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
                ('address', models.CharField(max_length=100)),
                ('NID', models.CharField(max_length=20)),
                ('phone', models.CharField(max_length=100)),
                ('shop_name', models.CharField(max_length=50)),
                ('bank_name', models.CharField(max_length=30)),
                ('bank_acc', models.CharField(max_length=40)),
                ('wallet', models.IntegerField()),
                ('hub', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='global_controller.hub')),
            ],
        ),
        migrations.CreateModel(
            name='Return',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('order', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='global_controller.order')),
                ('status', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='global_controller.order_status')),
            ],
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=80)),
                ('warranty', models.IntegerField()),
                ('description', models.CharField(max_length=1000)),
                ('price', models.IntegerField()),
                ('brand', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='global_controller.brand')),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='global_controller.category')),
            ],
        ),
        migrations.CreateModel(
            name='Order_Set',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField()),
                ('customer', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='global_controller.customer')),
                ('transaction', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='global_controller.transaction')),
            ],
        ),
        migrations.AddField(
            model_name='order',
            name='order_set',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='global_controller.order_set'),
        ),
        migrations.AddField(
            model_name='order',
            name='product',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='global_controller.product'),
        ),
        migrations.AddField(
            model_name='order',
            name='seller',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='global_controller.seller'),
        ),
        migrations.AddField(
            model_name='order',
            name='status',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='global_controller.order_status'),
        ),
        migrations.CreateModel(
            name='Inventory',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.IntegerField()),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='global_controller.product')),
                ('seller', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='global_controller.seller')),
            ],
        ),
        migrations.CreateModel(
            name='Hubman',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
                ('address', models.CharField(max_length=100)),
                ('designation', models.CharField(max_length=100)),
                ('NID', models.CharField(max_length=20)),
                ('phone', models.CharField(max_length=100)),
                ('hub', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='global_controller.hub')),
            ],
        ),
        migrations.AddField(
            model_name='deliveryman',
            name='current_hub',
            field=models.ManyToManyField(to='global_controller.hub'),
        ),
        migrations.AddField(
            model_name='customer',
            name='delivery_address_hub',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='global_controller.hub'),
        ),
        migrations.CreateModel(
            name='Bid',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('bid_amount', models.IntegerField()),
                ('auction', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='global_controller.auction')),
                ('customer', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='global_controller.customer')),
            ],
        ),
        migrations.CreateModel(
            name='Auction_Order',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('auction', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='global_controller.auction')),
                ('order', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='global_controller.order')),
            ],
        ),
        migrations.AddField(
            model_name='auction',
            name='product',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='global_controller.product'),
        ),
        migrations.AddField(
            model_name='auction',
            name='seller',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='global_controller.seller'),
        ),
    ]
