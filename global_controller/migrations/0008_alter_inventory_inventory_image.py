# Generated by Django 4.0.6 on 2022-08-18 02:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('global_controller', '0007_inventory_inventory_image'),
    ]

    operations = [
        migrations.AlterField(
            model_name='inventory',
            name='inventory_image',
            field=models.ImageField(blank=True, null=True, upload_to='images'),
        ),
    ]
