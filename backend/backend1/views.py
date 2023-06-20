from django.http import JsonResponse
from django.views import View
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
import json
from .models import Cochera, Servicio, TiempoAlquiler, Usuario
import mercadopago 
from django.http import JsonResponse
from django.views import View
from .models import Cochera
from django.contrib.auth.views import LoginView

from django.contrib.auth import authenticate, login
#superusuario
from django.contrib.auth.models import User




#JWT 
from rest_framework.views import APIView
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from rest_framework.authentication import TokenAuthentication

from django.contrib.auth import get_user_model

# -------------------------------------------------------------------------------------

#CONFIG PARA BLOQUEAR ACCESO SI NO SE AUTENTICO
class CustomTokenView(TokenObtainPairView):
    # permission_classes = [AllowAny] para que no requiera autenticacion
    permission_classes = [IsAuthenticated]

    def post(self, request, *args, **kwargs):
        response = super().post(request, *args, **kwargs)
        # Agregar cualquier personalización adicional a la respuesta aquí
        return response
    
class RegisterView(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def get(self, request, id=0):
            usuarios = Usuario.objects.all()
            data = {"message": "Success", "usuarios": []}
            for usuario in usuarios:
                usuario_data = {
                    "id_usuario": usuario.id_usuario,
                    "nombre_usuario": usuario.nombre_usuario,
                    "apellido_usuario": usuario.apellido_usuario,
                    "correo_usuario": usuario.correo_usuario,
                    "telefono_usuario": usuario.telefono_usuario,
                    "contrasenia_usuario": usuario.contrasenia_usuario,
                    "aceptar_terminos": usuario.aceptar_terminos,
                    "rol": usuario.rol,
                }
                data["usuarios"].append(usuario_data)
            return JsonResponse(data)

    def post(self, request):
        jd = json.loads(request.body)
        # print(jd)
        nombre_usuario=jd["nombre_usuario"]
        apellido_usuario=jd["apellido_usuario"]
        correo_usuario=jd["correo_usuario"]
        telefono_usuario=jd["telefono_usuario"]
        contrasenia_usuario=jd["contrasenia_usuario"]
        aceptar_terminos=jd["aceptar_terminos"]
        rol=jd["rol"]
        
        try:
        #si se selecciona el rol de Administrador
            if rol == "Administrador":
        #creo un super usuario
        #username deberia hacer referencia a correo_usuario. 
                user = User.objects.create_superuser(username=nombre_usuario, password=contrasenia_usuario, email=correo_usuario)
                message = "Superusuario creado"

        #si se selecciona el rol de Usuario
            elif rol == "Usuario":
        #creo un usuario de lectura
                user = User.objects.create_user(username=nombre_usuario, password=contrasenia_usuario, email=correo_usuario)
                message = "Usuario creado"
            
            else:
            #si no se selecciona un rol
                data = {"message":"Rol no valido"}
                return JsonResponse(data)
            
            usuario = Usuario.objects.create(nombre_usuario=nombre_usuario, apellido_usuario=apellido_usuario, correo_usuario=correo_usuario, telefono_usuario=telefono_usuario, contrasenia_usuario=contrasenia_usuario, aceptar_terminos=aceptar_terminos, rol=rol)

            data = {"message": message, "username": user.username}
        except Exception as e:
            data = {"message":"Error al crear el usuario", "error": str(e)}
        return JsonResponse(data)

    def delete(self, request, id):
        usuarios = list(Usuario.objects.filter(id_usuario=id).values())
        if len(usuarios)>0:
            Usuario.objects.filter(id_usuario=id).delete()
            data = {"message":"Usuario eliminado"}
        else:
            data = {"message":"Not Found..."}
        return JsonResponse(data)

class LoginView(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def authenticate(self, request, email=None, password=None, **kwargs):
        UserModel = get_user_model()
        try:
            user = UserModel.objects.get(email=email)
            if user.check_password(password):
                return user
        except UserModel.DoesNotExist:
            return None
    
    def post(self, request):
        jd = json.loads(request.body)
        email = jd["correo_usuario"]
        password = jd["contrasenia_usuario"]


        
        user = self.authenticate(request, email=email, password=password)
        print(user)
        
        if user is not None:
            login(request, user)
            refresh = RefreshToken.for_user(user)
            access_token = str(refresh.access_token)
            email = str(email)

            if user.is_superuser:
                rol = "Administrador"
            else:
                rol = "Usuario"
            
            data = {"message": "Inicio de sesión exitoso", "access_token": access_token, "email": email, "rol": rol}
        else:
            data = {"message": "Credenciales inválidas", "rol": ""}
        
        return JsonResponse(data)
    


# class CocheraView(APIView):
class CocheraView(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    # authentication_classes = [TokenAuthentication]
    # permission_classes = [IsAuthenticated]

    def get(self, request, id=0):
        if id > 0:
            try:
                cochera = Cochera.objects.get(id_cochera=id)
                cochera_data = {
                    "id_cochera": cochera.id_cochera,
                    "nombre_cochera": cochera.nombre_cochera,
                    "img_cochera": cochera.img_cochera,
                    "descripcion_cochera": cochera.descripcion_cochera,
                    "tiempo_alquiler": [],
                    "servicios": [],
                }
                tiempo_alquiler = TiempoAlquiler.objects.filter(cochera=cochera)
                servicios = Servicio.objects.filter(cochera=cochera)
                for tiempo in tiempo_alquiler:
                    cochera_data["tiempo_alquiler"].append({
                        "tiempo": tiempo.tiempo,
                        "precio": tiempo.precio
                    })
                
                for servicio in servicios:
                    cochera_data["servicios"].append({
                        "servicio": servicio.servicio,
                        "precio": servicio.precio
                    })
                data = {"message": "Success", "cochera": cochera_data}
                return JsonResponse(data)
            except Cochera.DoesNotExist:
                data = {"message": "Cochera not found"}
                return JsonResponse(data, status=404)
        else:
            cocheras = Cochera.objects.all()
            data = {"message": "Success", "cocheras": []}
            for cochera in cocheras:
                cochera_data = {
                    "id_cochera": cochera.id_cochera,
                    "nombre_cochera": cochera.nombre_cochera,
                    "img_cochera": cochera.img_cochera,
                    "descripcion_cochera": cochera.descripcion_cochera,
                    "tiempo_alquiler": [],
                    "servicios": [],
                }
                tiempo_alquiler = TiempoAlquiler.objects.filter(cochera=cochera)
                servicios = Servicio.objects.filter(cochera=cochera)
                for tiempo in tiempo_alquiler:
                    cochera_data["tiempo_alquiler"].append({
                        "tiempo": tiempo.tiempo,
                        "precio": tiempo.precio
                    })
                for servicio in servicios:
                    cochera_data["servicios"].append({
                        "servicio": servicio.servicio,
                        "precio": servicio.precio
                    })
                data["cocheras"].append(cochera_data)
            return JsonResponse(data)

    def post(self, request):
        jd = json.loads(request.body)
        # print(jd)
        Cochera.objects.create(nombre_cochera=jd["nombre_cochera"], img_cochera=jd["img_cochera"], descripcion_cochera=jd["descripcion_cochera"])
        data = {"message":"Cochera creada"}
        return JsonResponse(data)

    def patch(self, request, id):
        jd=json.loads(request.body)
        cocheras = list(Cochera.objects.filter(id_cochera=id).values())
        if len(cocheras)>0:
            cochera = Cochera.objects.get(id_cochera=id)
            cochera.nombre_cochera=jd["nombre_cochera"]
            cochera.img_cochera=jd["img_cochera"]
            cochera.descripcion_cochera=jd["descripcion_cochera"]
            cochera.save()
            data = {"message":"Cochera modificada"}
        else:
            data = {"message":"Cochera no encontrada"}
        
        return JsonResponse(data)

    def delete(self, request, id):
        cocheras = list(Cochera.objects.filter(id_cochera=id).values())
        if len(cocheras)>0:
            Cochera.objects.filter(id_cochera=id).delete()
            data = {"message":"Cochera eliminada"}
        else:
            data = {"message":"Not Found..."}
        return JsonResponse(data)


class AlquilarCocheraView(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)  
    
    def post(self, request):
        jd = json.loads(request.body)

        # Obtener los datos de la cochera seleccionada desde el cuerpo de la solicitud JSON
        cochera_id = jd.get("cochera_id")
        tiempo_alquiler_id = jd.get("tiempo_alquiler_id")
        servicio = jd.get("servicio", [])


        try:
            # Obtengo la cochera seleccionada desde la base de datos
            cochera = Cochera.objects.get(id_cochera=cochera_id)
            # Obtengo el tiempo de alquiler seleccionado desde la base de datos
            tiempo_alquiler = TiempoAlquiler.objects.get(id=tiempo_alquiler_id)

            # Obtengo los servicios seleccionados desde la base de datos
            servicio_seleccionado = Servicio.objects.filter(id__in=servicio)

            # generar el enlace de pago utilizando el SDK de Mercado Pago
            ACCESS_TOKEN = "TEST-865520782224511-052712-77c0791960cbab0081032c9906fc5539-1384417080"
            sdk = mercadopago.SDK(ACCESS_TOKEN)

            preference_data = {
                "items": [
                    {
                        "title": cochera.nombre_cochera,
                        "quantity": 1,
                        "unit_price": tiempo_alquiler.precio + sum(servicio.precio for servicio in servicio_seleccionado),  
                        "currency_id": "ARS",
                    }
                ],
                "notification_url": "",
                "back_urls": {
                    "success": "http://localhost:4200/",
                    "failure": "",
                    "pending": "",
                },
                "auto_return": "all",
            }
            result = sdk.preference().create(preference_data)
            payment_url = result["response"]["init_point"]
            data = {"payment_url": payment_url}
            return JsonResponse(data)
        except Cochera.DoesNotExist:
            data = {"message": "Cochera not found"}
            return JsonResponse(data, status=404)



# tarjeta: 5031 7557 3453 0604
# fecha: 11/25
# cod: 123

