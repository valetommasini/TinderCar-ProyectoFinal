from . import views
from django.urls import path
from .views import CocheraView, AlquilarCocheraView, RegisterView, LoginView, CustomTokenView
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView


urlpatterns = [
    path("cocheras/", CocheraView.as_view(), name="cocheras"),
    path("cocheras/<int:id>", CocheraView.as_view(), name="cochera"),
    path("cocheras/<int:id>/tiempo-alquiler/", CocheraView.as_view(), name="tiempo_alquiler"),
    path("cocheras/<int:id>/servicios/", CocheraView.as_view(), name="servicios"),
    # path('create-order', views.create_order),
    path('alquilar/', AlquilarCocheraView.as_view(), name="alquilar"),
    path('signin/', RegisterView.as_view(), name="signin"),
    path('signin/<int:id>', RegisterView.as_view(), name="signinId"),
    path('login/', LoginView.as_view(), name="login"),
    path('auth/', CustomTokenView.as_view()),
    path('token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    # path('profile/', ProfileView.as_view()),
    # path('failure', views.create_order),
    # path('pending', views.create_order),
    ]