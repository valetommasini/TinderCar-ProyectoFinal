# Generated by Django 4.2.1 on 2023-05-25 01:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('backend1', '0002_usuario'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cochera',
            fields=[
                ('id_cochera', models.AutoField(primary_key=True, serialize=False)),
                ('nombre_cochera', models.CharField(max_length=225)),
                ('ubicacion_cochera', models.CharField(max_length=255)),
                ('capacidad_cochera', models.IntegerField(max_length=4)),
            ],
        ),
    ]