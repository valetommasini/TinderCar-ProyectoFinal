# Generated by Django 4.2.1 on 2023-05-31 20:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('backend1', '0008_alter_tiempoalquiler_cochera'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tiempoalquiler',
            name='tiempo',
            field=models.CharField(choices=[('1 dia', '1d'), ('15 dias', '15d'), ('1 mes', '1m'), ('6 meses', '6m'), ('1 año', '1a')], max_length=10),
        ),
    ]
