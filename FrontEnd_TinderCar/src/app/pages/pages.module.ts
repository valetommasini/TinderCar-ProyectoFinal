import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HomeComponent } from './home/home.component';
import { IndexComponent } from './index/index.component';
import { LoginComponent } from './login/login.component';
import { RegistrateUnicoComponent } from './registrate-unico/registrate-unico.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { ElegirCocheraComponent } from './elegir-cochera/elegir-cochera.component';
import { CarritoAlquilerComponent } from './carrito-alquiler/carrito-alquiler.component';
import { DetalleFacturacionComponent } from './detalle-facturacion/detalle-facturacion.component';

@NgModule({
  declarations: [
    HomeComponent,
    IndexComponent,
    LoginComponent,
    RegistrateUnicoComponent,
    ElegirCocheraComponent,
    CarritoAlquilerComponent,
    DetalleFacturacionComponent,
  ],
  imports: [CommonModule, FormsModule, ReactiveFormsModule, RouterModule],
  exports: [
    HomeComponent,
    IndexComponent,
    LoginComponent,
    RegistrateUnicoComponent,
    ElegirCocheraComponent,
  ],
})
export class PagesModule {}
