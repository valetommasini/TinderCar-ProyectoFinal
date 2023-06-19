import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
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

  public formRegister: FormGroup = new FormGroup({});

  constructor(
    private registroSv: RegistroService,
    private router: Router,
    private formBuilder: FormBuilder
  ) {
    this.formRegister = this.formBuilder.group({
      nombre: ['', [Validators.required, Validators.pattern(/^[A-Za-z]+$/)]],
      apellido: ['', [Validators.required, Validators.pattern(/^[A-Za-z]+$/)]],
      email: ['', [Validators.required, Validators.email]],
      telefono: ['', [Validators.required, Validators.pattern(/^\d{10}$/)]],
      password: ['', [Validators.required, Validators.minLength(5)]],
      confirmPassword: ['', [Validators.required, Validators.minLength(5)]],
      rol: ['', [Validators.required]],
      terms: ['', [Validators.required, Validators.requiredTrue]],
    });
  }

  get Nombre() {
    return this.formRegister.get('nombre');
  }

  get Apellido() {
    return this.formRegister.get('apellido');
  }

  get Mail() {
    return this.formRegister.get('email');
  }

  get Tel() {
    return this.formRegister.get('telefono');
  }

  get Pass() {
    return this.formRegister.get('password');
  }

  get ConfPass() {
    return this.formRegister.get('confirmPassword');
  }

  get Rol() {
    return this.formRegister.get('rol');
  }

  get Terms() {
    return this.formRegister.get('terms');
  }

  ngOnInit(): void {}

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
