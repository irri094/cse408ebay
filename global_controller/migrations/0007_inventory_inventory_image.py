# Generated by Django 4.0.6 on 2022-08-15 09:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('global_controller', '0006_seller_coord'),
    ]

    operations = [
        migrations.AddField(
            model_name='inventory',
            name='inventory_image',
            field=models.ImageField(blank=True, null=True, upload_to=''),
        ),
    ]