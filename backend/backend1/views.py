import asyncio
from typing import Any
from django.http import HttpResponse, JsonResponse
from django.shortcuts import redirect, render
from django.views import View
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
import json
from .models import Cochera, Servicio, TiempoAlquiler
import mercadopago 
# Create your views here.
from django.http import JsonResponse
from django.views import View
from .models import Cochera

# class CocheraView(View):
#     @method_decorator(csrf_exempt)
#     def dispatch(self, request, *args, **kwargs):
#         return super().dispatch(request, *args, **kwargs)

#     def get(self, request, id=0):
#         # GET DETAIL
#         if(id>0):
#             cocheras = list(Cochera.objects.filter(id_cochera=id).values())
#             if len(cocheras)>0:
#                 cochera=cocheras[0]
#                 tiempo_alquiler = TiempoAlquiler.objects.filter(cochera=cochera['id_cochera']).values('tiempo', 'precio')
#                 cochera['tiempo_alquiler'] = list(tiempo_alquiler)
#                 servicios = list(Servicio.objects.filter(cochera=cochera['id_cochera']).values('servicio', 'precio'))
#                 cochera['servicios'] = servicios
#                 data = {"message": "Success", "cochera": cochera}
#             else:
#                 data = {"message":"Not Found..."}
#             return JsonResponse(data)    
        
#         else:
#             # GET ALL
#             cocheras = list(Cochera.objects.values())
#             for cochera in cocheras:
#                 tiempo_alquiler = TiempoAlquiler.objects.filter(cochera=cochera['id_cochera']).values('tiempo', 'precio')
#                 cochera['tiempo_alquiler'] = list(tiempo_alquiler)
#                 servicios = list(Servicio.objects.filter(cochera=cochera['id_cochera']).values('servicio', 'precio'))
#                 cochera['servicios'] = servicios
#             if len(cocheras)>0:
#                 data = {"message":"Success", "cocheras":cocheras}
#             else:
#                 data = {"message":"Not Found..."}
#             return JsonResponse(data)

class CocheraView(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request, id=0):
        if id > 0:
            try:
                cochera = Cochera.objects.get(id_cochera=id)
                cochera_data = {
                    "id_cochera": cochera.id_cochera,
                    "nombre_cochera": cochera.nombre_cochera,
                    "img_cochera": cochera.img_cochera,
                    "descripcion_cochera": cochera.descripcion_cochera,
                    "ubicacion_cochera": cochera.ubicacion_cochera,
                    "capacidad_cochera": cochera.capacidad_cochera,
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
                    "ubicacion_cochera": cochera.ubicacion_cochera,
                    "capacidad_cochera": cochera.capacidad_cochera,
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
        Cochera.objects.create(nombre_cochera=jd["nombre_cochera"], img_cochera=jd["img_cochera"], descripcion_cochera=jd["descripcion_cochera"], ubicacion_cochera=jd["ubicacion_cochera"], capacidad_cochera=jd["capacidad_cochera"])
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
            cochera.ubicacion_cochera=jd["ubicacion_cochera"]
            cochera.capacidad_cochera=jd["capacidad_cochera"]
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
            ACCESS_TOKEN = "ACCESS_TOKEN"
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


    

# def create_order(cochera, tiempo_alquiler, servicios):
#     ACCESS_TOKEN = "TEST-865520782224511-052712-77c0791960cbab0081032c9906fc5539-1384417080"
#     sdk = mercadopago.SDK(ACCESS_TOKEN)

#     # Lógica para generar los datos de la preferencia de pago
#     preference_data = {
#         "items" : [
#             {
#                 "title": cochera.nombre_cochera,
#                 "quantity": 1,
#                 "unit_price": tiempo_alquiler.precio + sum(servicio.precio for servicio in servicios),
#                 "currency_id": "ARS",
#             }
#         ],
#         "notification_url": "",
#         "back_urls": {
#             "success": "http://localhost:4200/",
#             "failure": "",
#             "pending": "",
#         },
#         "auto_return": "all",
#     }

#     result = sdk.preference().create(preference_data)

#     # Variable donde guardo la URL de pago
#     payment_url = result["response"]["init_point"]

#     return payment_url

# class AlquilarCocheraView(View):
#     aca deberia ir el metodo de pagar

# class PaymentService:
#     def __init__(self):
#         self.access_token = "TEST-865520782224511-052712-77c0791960cbab0081032c9906fc5539-1384417080"
#         self.sdk = mercadopago.SDK(self.access_token)

#     def create_payment_mercadopago(self, name, price, unit):
#         preference_data = {
#             "items": [
#                 {
#                     "title": name,
#                     "quantity": int(unit),
#                     "currency_id": "ARS",
#                     "unit_price": float(price),
#                 }
#             ],
#             "notification_url": "",
#             "back_urls": {
#                 "success": "http://localhost:4200/",
#                 "failure": "",
#                 "pending": ""
#             },
#             "auto_return": "all"
#         }
#         result = self.sdk.preference().create(preference_data)
#         payment_url = result["response"]["init_point"]
#         return payment_url

# class PaymentController:
#     def __init__(self, payment_service):
#         self.payment_service = payment_service
    
#     def get_mp_link(self, req, res):
#         name = req.query.get('name')
#         price = req.query.get('price')
#         unit = req.query.get('unit')
#         try:
#             checkout = self.payment_service.create_payment_mercadopago(
#                 name,
#                 price,
#                 unit
#             )
#             return res.redirect(checkout)
        
#         except Exception as err:
#             return res.status(500).json({
#                 'error': True,
#                 'msg': 'Hubo un error con Mercado Pago'
#             })


# def create_order(req): 
#     ACCESS_TOKEN = "TEST-865520782224511-052712-77c0791960cbab0081032c9906fc5539-1384417080"
#     sdk = mercadopago.SDK(ACCESS_TOKEN)

#     preference_data = {
#     # Creacion de ítem
#         "items" : [
#             {
#                 "title":"Cochera",
#                 "quantity":1,
#                 "unit_price":1000,
#                 "currency_id":"ARS",}
#             ],
#         "notification_url":"",
#         "back_urls":{
#             "success":"http://localhost:4200/",
#             "failure":"",
#             "pending":""
#             },
#         "auto_return":"all"
#         }

#     result = sdk.preference().create(preference_data)

#     #variale donde guardo la url de pago
#     payment_url = result["response"]["init_point"]
#     print(result)
#     return JsonResponse({"payment_url":payment_url})


# tarjeta: 5031 7557 3453 0604
# fecha: 11/25
# cod: 123