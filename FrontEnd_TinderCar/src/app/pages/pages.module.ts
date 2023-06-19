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
import { MPagoService } from '../services/mpago.service';
import { DashboardComponent } from './dashboard/dashboard.component';
import { CreateCocheraComponent } from './dashboard/CRUD/create-cochera.component';
import { EditCocheraComponent } from './dashboard/CRUD/edit-cochera.component';
import { TablaUsuariosComponent } from './tabla-usuarios/tabla-usuarios.component';
import { NgxTypedJsModule } from 'ngx-typed-js';

@NgModule({
  declarations: [
    HomeComponent,
    IndexComponent,
    LoginComponent,
    RegistrateUnicoComponent,
    ElegirCocheraComponent,
    CarritoAlquilerComponent,
    DetalleFacturacionComponent,
    DashboardComponent,
    CreateCocheraComponent,
    EditCocheraComponent,
    TablaUsuariosComponent,
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    RouterModule,
    NgxTypedJsModule,
  ],
  exports: [
    HomeComponent,
    IndexComponent,
    LoginComponent,
    RegistrateUnicoComponent,
    ElegirCocheraComponent,
    CarritoAlquilerComponent,
    DetalleFacturacionComponent,
    DashboardComponent,
  ],
  providers: [MPagoService],
  bootstrap: [
    HomeComponent,
    IndexComponent,
    LoginComponent,
    RegistrateUnicoComponent,
    ElegirCocheraComponent,
    CarritoAlquilerComponent,
    DetalleFacturacionComponent,
    DashboardComponent,
    CreateCocheraComponent,
    EditCocheraComponent,
    TablaUsuariosComponent,
  ],
})
export class PagesModule {}
