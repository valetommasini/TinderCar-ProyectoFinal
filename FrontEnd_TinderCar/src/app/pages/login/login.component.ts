import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

// para validar con formularios reactivos
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { Login } from 'src/app/models/login';
import { TokenService } from 'src/app/services/token.service';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent implements OnInit {
  isLogged = false;
  isLoginFail = false;
  loginUsuario: Login | undefined;
  correo_usuario: string = '';
  contrasenia_usuario: string = '';
  roles: string = '';
  errMsj: string = '';

  //validacion
  public formLogin: FormGroup = new FormGroup({});
  constructor(
    private formBuilder: FormBuilder,
    private tokenSv: TokenService,
    private authSv: AuthService
  ) {
    this.formLogin = this.formBuilder.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(5)]],
    });
  }

  ngOnInit(): void {
    if (this.tokenSv.getToken()) {
      this.isLogged = true;
      this.isLoginFail = false;
      this.roles = this.tokenSv.getAuthorities();
    }
  }

  get Mail() {
    return this.formLogin.get('email');
  }

  get Pass() {
    return this.formLogin.get('password');
  }

  onLogin(): void {
    this.loginUsuario = new Login(
      this.correo_usuario,
      this.contrasenia_usuario
    );
    this.authSv.login(this.loginUsuario).subscribe({
      next: (data) => {
        this.isLogged = true;
        this.tokenSv.setToken(data.access_token);
        this.tokenSv.setEmail(data.email);
        this.tokenSv.setAuthorities(data.rol || undefined);
        // this.roles = data.roles;
        window.location.reload();
        // this.router.navigate(['/dashboard']);
        console.log(data.access_token);
      },
      error: (err) => {
        this.isLogged = false;
        this.isLoginFail = true;
        this.errMsj = err.error.message;
      },
    });
  }
}
// credenciales usuario normal
// email: gab@email.com
// password: 1234

// credenciales usuario administrador
// email: admin@email.com
// password: admin1234
