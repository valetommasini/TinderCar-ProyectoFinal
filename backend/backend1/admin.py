from django.contrib import admin
from .models import Adm, Usuario, Cochera, TiempoAlquiler, Servicio

# Register your models here.
admin.site.register(Adm)
admin.site.register(Usuario)
admin.site.register(Cochera)
admin.site.register(TiempoAlquiler)
admin.site.register(Servicio)
# admin.site.register(Alquiler)
