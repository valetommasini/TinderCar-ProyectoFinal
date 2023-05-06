import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { IndexComponent } from './pages/index/index.component';
import { HomeComponent } from './pages/home/home.component';
import { LoginComponent } from './pages/login/login.component';
import { RegistrateUnicoComponent } from './pages/registrate-unico/registrate-unico.component';
import { ElegirCocheraComponent } from './pages/elegir-cochera/elegir-cochera.component';

const routes: Routes = [
  { path: 'index', component: IndexComponent },
  { path: 'login', component: LoginComponent },
  { path: 'singIn', component: RegistrateUnicoComponent },
  { path: 'home', component: HomeComponent },
  { path: 'elegir', component: ElegirCocheraComponent },
  { path: '', redirectTo: 'index', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
