from . import views
from django.urls import path
from .views import CocheraView, AlquilarCocheraView


urlpatterns = [
    # name="cocheras" ENDPOINT
    path("cocheras/", CocheraView.as_view(), name="cocheras"),
    path("cocheras/<int:id>", CocheraView.as_view(), name="cochera"),
    path("cocheras/<int:id>/tiempo-alquiler/", CocheraView.as_view(), name="tiempo_alquiler"),
    path("cocheras/<int:id>/servicios/", CocheraView.as_view(), name="servicios"),
    # path('create-order', views.create_order),
    path('alquilar/', AlquilarCocheraView.as_view(), name="alquilar"),
    # path('failure', views.create_order),
    # path('pending', views.create_order),
    ]