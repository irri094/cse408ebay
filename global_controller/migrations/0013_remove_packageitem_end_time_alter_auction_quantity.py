# Generated by Django 4.0.6 on 2022-08-22 10:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('global_controller', '0012_auction_is_package_packageitem'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='packageitem',
            name='end_time',
        ),
        migrations.AlterField(
            model_name='auction',
            name='quantity',
            field=models.IntegerField(null=True),
        ),
    ]
