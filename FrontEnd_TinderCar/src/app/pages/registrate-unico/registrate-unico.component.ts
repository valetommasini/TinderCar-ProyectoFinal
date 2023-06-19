import { Component, OnInit } from '@angular/core';
import { FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { NuevoUsuario } from 'src/app/models/nuevo-usuario';
import { RegistroService } from 'src/app/services/registro.service';

@Component({
  selector: 'app-registrate-unico',
  templateUrl: './registrate-unico.component.html',
  styleUrls: ['./registrate-unico.component.css'],
})
export class RegistrateUnicoComponent implements OnInit {
  public nombre_usuario = '';
  public apellido_usuario = '';
  public correo_usuario = '';
  public contrasenia_usuario = '';
  public telefono_usuario = null;
  public aceptar_terminos = false;
  public rol = '';

  public formLogin: FormGroup = new FormGroup({});
  public expReg = /^[a-zA-Z0-9]{5,5}$/;

  formBuilder: any;

  constructor(private registroSv: RegistroService, private router: Router) {
    // this.validation();
  }
  ngOnInit(): void {}

  // validation(): void {
  //   this.formLogin = this.formBuilder.group({
  //     nombre_usuario: ['', [Validators.required]],
  //     apellido: ['', [Validators.required]],
  //     email: ['', [Validators.required, Validators.pattern(this.expReg)]],
  //     tel: ['', [Validators.required]],
  //     contrasenia: ['', [Validators.required, Validators.minLength(5)]],
  //     role: ['', [Validators.required]],
  //     terms: ['', [Validators.required]],
  //   });
  // }

  createUsuario() {
    const nuevoUsuario = new NuevoUsuario(
      this.nombre_usuario,
      this.apellido_usuario,
      this.correo_usuario,
      this.contrasenia_usuario,
      this.telefono_usuario ?? 0,
      this.aceptar_terminos,
      this.rol
    );

    this.registroSv.postUsusario(nuevoUsuario).subscribe({
      next: (data) => {
        alert('Usuario creado');
        this.router.navigate(['/login']);
      },
      error: (err) => {
        console.error(err.error.mensaje);
      },
    });

    console.log(nuevoUsuario);
  }
}
