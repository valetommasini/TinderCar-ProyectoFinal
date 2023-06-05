from django.db import models

# Create your models here.
class Adm(models.Model):
    id_adm = models.IntegerField(primary_key=True)
    nom_adm = models.CharField(max_length=50)
    apell_adm = models.CharField(max_length=50)
    rol_adm = models.CharField(max_length=50)


class Cochera(models.Model):
    id = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100, blank=False)
    direccion = models.TextField(max_length=1000, blank=False)
    cantidad = models.IntegerField(blank=False, default=0)
    descripcion = models.TextField(max_length=500, blank=False)
    class Meta:
        db_table="Cochera"
        verbose_name="Cocheras de dueños"
        verbose_name_plural="Cocheras"
    def __unicode__(self):
        return self.nombre
    def __str__(self):
        return self.nombre
    
class Usuario(models.Model):
    id = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100, blank=False)
    apellido = models.TextField(max_length=1000, blank=False)
    contraseña = models.IntegerField(blank=False, default=0)
    email = models.TextField(max_length=500, blank=False)
    class Meta:
        db_table = "Usuario"
        verbose_name="Usuarios de la applicacion"
        verbose_name_plural="Usuarios"
    def __unicode__(self):
        return self.nombre
    def __str__(self):
        return self.nombre
class Precio(models.Model):
   