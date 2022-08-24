# Generated by Django 4.0.6 on 2022-08-23 20:39

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('global_controller', '0013_remove_packageitem_end_time_alter_auction_quantity'),
    ]

    operations = [
        migrations.AlterField(
            model_name='auction',
            name='inventory',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='global_controller.inventory'),
        ),
        migrations.AlterField(
            model_name='packageitem',
            name='auction',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='global_controller.auction'),
        ),
        migrations.AlterField(
            model_name='packageitem',
            name='inventory',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='global_controller.inventory'),
        ),
    ]
