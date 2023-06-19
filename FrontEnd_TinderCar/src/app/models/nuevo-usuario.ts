export class NuevoUsuario {
  id_usuario?: number;
  nombre_usuario: string;
  apellido_usuario: string;
  correo_usuario: string;
  contrasenia_usuario: string;
  telefono_usuario: number;
  aceptar_terminos: boolean;
  rol: string;

  constructor(
    nombre_cochera: string,
    apellido_usuario: string,
    correo_usuario: string,
    contrasenia_usuario: string,
    telefono_usuario: number,
    aceptar_terminos: boolean,
    rol: string
  ) {
    this.nombre_usuario = nombre_cochera;
    this.apellido_usuario = apellido_usuario;
    this.correo_usuario = correo_usuario;
    this.contrasenia_usuario = contrasenia_usuario;
    this.telefono_usuario = telefono_usuario;
    this.aceptar_terminos = aceptar_terminos;
    this.rol = rol;
  }
}
