import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { IndexComponent } from './pages/index/index.component';
import { HomeComponent } from './pages/home/home.component';
import { LoginComponent } from './pages/login/login.component';
import { RegistrateUnicoComponent } from './pages/registrate-unico/registrate-unico.component';
import { ElegirCocheraComponent } from './pages/elegir-cochera/elegir-cochera.component';
import { CarritoAlquilerComponent } from './pages/carrito-alquiler/carrito-alquiler.component';
import { DetalleFacturacionComponent } from './pages/detalle-facturacion/detalle-facturacion.component';

const routes: Routes = [
  { path: 'index', component: IndexComponent },
  { path: 'login', component: LoginComponent },
  { path: 'singIn', component: RegistrateUnicoComponent },
  { path: 'home', component: HomeComponent },
  { path: 'elegir', component: ElegirCocheraComponent },
  { path: 'carrito', component: CarritoAlquilerComponent },
  { path: 'detalle-facturacion', component: DetalleFacturacionComponent },
  { path: '', redirectTo: 'index', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
