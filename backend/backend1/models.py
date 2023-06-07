from django.db import models

# Create your models here.
class Adm(models.Model):
    id_adm = models.IntegerField(primary_key=True)
    nom_adm = models.CharField(max_length=50)
    apell_adm = models.CharField(max_length=50)
    rol_adm = models.CharField(max_length=50)

class Usuario(models.Model):
    id_usuario = models.AutoField(primary_key=True, null=False)
    nombre_usuario = models.CharField(max_length=50, null=False)
    contrasenia_usuario = models.CharField(max_length=9, null=False)

class Cochera(models.Model):
    # -------- atributos --------
    id_cochera = models.AutoField(primary_key=True, null=False)
    nombre_cochera = models.CharField(max_length=225, null=False)
    img_cochera = models.CharField(max_length=255, null=False, default="")
    descripcion_cochera = models.CharField(max_length=255, null=False, default="")
    ubicacion_cochera = models.CharField(max_length=255, null=False)
    capacidad_cochera = models.IntegerField(null=False)
    
class TiempoAlquiler(models.Model):
    cochera = models.ForeignKey(Cochera, on_delete=models.CASCADE, related_name='tiempos_alquiler')
    tiempo = models.CharField(max_length=10, choices=[('1 dia', '1d'), ('15 dias', '15d'), ('1 mes', '1m'), ('6 meses', '6m'), ('1 año', '1a')])
    precio = models.IntegerField()

class Servicio(models.Model):
    cochera = models.ForeignKey(Cochera, on_delete=models.CASCADE)
    servicio = models.CharField(max_length=10, choices=[('servicio1', 'lavado de carroceria'), ('servicio2', 'lavado de carroceria y tapizado'), ('servicio3', 'lavado completo mas tratamiento ceramico')])
    precio = models.IntegerField()


# class Alquiler(models.Model):
#     # -------- atributos --------
#     id_alquiler = models.AutoField(primary_key=True, null=False)
#     usuario = models.ForeignKey(Usuario, null=False, on_delete=models.SET_DEFAULT)
#     cochera = models.ForeignKey(Cochera, null=True, on_delete=models.SET_NULL)
#     inicion_alquiler = models.DateField(null=False)
#     fin_alquiler = models.DateField(null=False)
#     cantidad_autos = models.CharField(max_length=1, choices = CANTIDAD, null=False)
#     servicios = models.CharField(max_length=1, choices=SERVICIOS, null=True)

# class Carrito(models.Model):
#     # -------- atributos --------
#     id_carrito = models.AutoField(primary_key=True, null=False)
#     usuario = models.ForeignKey(Usuario, null=False, on_delete=models.SET_DEFAULT)
#     alquileres = models.ManyToManyField('Cochera')

# class MetodoPago(models.Model):
#     # -------- atributos --------
#     id_metodo = models.AutoField(primary_key=True, null=False)
#     usuario = models.ForeignKey(Usuario, null=False, on_delete=models.SET_DEFAULT)
#     metodo_pago = models.CharField(max_length=1, choices=METODO, null=False)

# class Pagos(models.Model):
#     # -------- atributos --------
#     id_pagos = models.AutoField(primary_key=True, null=False)
#     usuario = models.ForeignKey(Usuario, null=False, on_delete=models.SET_DEFAULT)
#     carrito = models.ForeignKey(Carrito, null=False, on_delete=models.SET_DEFAULT)
    # metodo_pago = models.ManyToManyField('MetodoPago')