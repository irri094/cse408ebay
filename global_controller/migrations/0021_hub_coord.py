# Generated by Django 4.0.6 on 2022-08-28 20:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('global_controller', '0020_customer_coord'),
    ]

    operations = [
        migrations.AddField(
            model_name='hub',
            name='coord',
            field=models.CharField(default='', max_length=50, null=True),
        ),
    ]