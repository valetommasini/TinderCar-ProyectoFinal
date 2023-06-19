import { Component } from '@angular/core';
import { Login } from 'src/app/models/login';
import { TokenService } from 'src/app/services/token.service';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-nav',
  templateUrl: './nav.component.html',
  styleUrls: ['./nav.component.css'],
})
export class NavComponent {
  //inicializo la varaible en falso para ocultar los links
  isLogged: boolean = false;
  isAdmin: boolean = false;
  loginUsuario: Login | undefined;
  rol: string = '';
  email: string = '';

  constructor(private tokenSv: TokenService) {}

  ngOnInit(): void {
    const authAuthorities = sessionStorage.getItem('AuthAuthorities');

    if (this.tokenSv.getToken()) {
      this.isLogged = true;
      this.rol = JSON.parse(authAuthorities!);
      if (this.rol === 'Administrador') {
        this.isAdmin = true;
      }
    } else {
      this.isLogged = false;
    }
  }

  public onLogout() {
    this.tokenSv.logOut();
    window.location.reload();
  }
}
