from django.db import models

# Create your models here.
class Adm(models.Model):
    id_adm = models.IntegerField(primary_key=True)
    nom_adm = models.CharField(max_length=50)
    apell_adm = models.CharField(max_length=50)
    rol_adm = models.CharField(max_length=50)