from django.contrib import admin
from .models import Adm, Usuario, Cochera, TiempoAlquiler, Servicio
# from rest_framework.authtoken.admin import TokenAdmin


# Register your models here.
admin.site.register(Adm)
admin.site.register(Usuario)
admin.site.register(Cochera)
admin.site.register(TiempoAlquiler)
admin.site.register(Servicio)
# admin.site.register(Alquiler)
# TokenAdmin.raw_id_fields = ['user']
