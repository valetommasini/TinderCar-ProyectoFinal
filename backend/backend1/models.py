# Create your models here.
# SUPER USUARIO
class Adm(models.Model):
    id_adm = models.IntegerField(primary_key=True)
    nom_adm = models.CharField(max_length=50)
    apell_adm = models.CharField(max_length=50)
    rol_adm = models.CharField(max_length=50)

# USUARIOS DE LECTURA
class Usuario(models.Model):
    id_usuario = models.AutoField(primary_key=True, null=False)
    nombre_usuario = models.CharField(max_length=50, null=False, default='')
    apellido_usuario = models.CharField(max_length=50, null=False, default='')
    correo_usuario = models.EmailField(null=False, default='')
    telefono_usuario = models.IntegerField(null=False, default=0)
    contrasenia_usuario = models.CharField(max_length=9, null=False)
    aceptar_terminos = models.BooleanField(default=False)
    rol = models.CharField(max_length=13, default='')

class Cochera(models.Model):
    # -------- atributos --------
    id_cochera = models.AutoField(primary_key=True, null=False)
    nombre_cochera = models.CharField(max_length=225, null=False)
    img_cochera = models.CharField(max_length=255, null=False, default="")
    descripcion_cochera = models.CharField(max_length=255, null=False, default="")
    
class TiempoAlquiler(models.Model):
    cochera = models.ForeignKey(Cochera, on_delete=models.CASCADE, related_name='tiempos_alquiler')
    tiempo = models.CharField(max_length=10, choices=[('1 dia', '1d'), ('15 dias', '15d'), ('1 mes', '1m'), ('6 meses', '6m'), ('1 año', '1a')])
    precio = models.IntegerField()

class Servicio(models.Model):
    cochera = models.ForeignKey(Cochera, on_delete=models.CASCADE)
    servicio = models.CharField(max_length=10, choices=[('servicio1', 'lavado de carroceria'), ('servicio2', 'lavado de carroceria y tapizado'), ('servicio3', 'lavado completo mas tratamiento ceramico')])
    precio = models.IntegerField()

