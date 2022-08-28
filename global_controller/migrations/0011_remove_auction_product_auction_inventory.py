# Generated by Django 4.0.6 on 2022-08-18 07:50

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('global_controller', '0010_customer_mail'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='auction',
            name='product',
        ),
        migrations.AddField(
            model_name='auction',
            name='inventory',
            field=models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, to='global_controller.inventory'),
        ),
    ]