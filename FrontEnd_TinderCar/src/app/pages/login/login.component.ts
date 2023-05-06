import { Component } from '@angular/core';
import { Router } from '@angular/router';

// para validar con formularios reactivos
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent {
  public formLogin: FormGroup = new FormGroup({});

  //valores para los campos del login
  public user = 'admin@email.com';
  public pass = 'admin1234';
  constructor(private formBuilder: FormBuilder, private router: Router) {
    this.validation();
  }

  // private createValidacion(): FormGroup {
  //   return this.formBuilder.group({
  //     usuario: ['', [Validators.required]],
  //     contrasenia: ['', [Validators.required]],
  //   });
  // }

  private validation(): void {
    this.formLogin = this.formBuilder.group({
      //validaciones de usuario y contraseña
      usuario: ['', [Validators.required, Validators.pattern(this.user)]],
      contrasenia: ['', [Validators.required, Validators.pattern(this.pass)]],
    });
  }

  public enviarForm() {
    // console.log(this.formLogin);
    if (this.formLogin.invalid) {
      Object.values(this.formLogin.controls).forEach((control) => {
        control.markAllAsTouched();
      });
      return;
    }

    this.router.navigate(['/home']); //para redirigir al home
    alert('Formulario enviado');
    console.log(this.formLogin.value);
  }

  public get f(): any {
    return this.formLogin.controls;
  }
}
