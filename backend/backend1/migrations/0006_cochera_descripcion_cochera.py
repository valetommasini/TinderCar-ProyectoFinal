# Generated by Django 4.2.1 on 2023-05-25 08:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('backend1', '0005_alter_cochera_capacidad_cochera'),
    ]

    operations = [
        migrations.AddField(
            model_name='cochera',
            name='descripcion_cochera',
            field=models.CharField(default='', max_length=255),
        ),
    ]
