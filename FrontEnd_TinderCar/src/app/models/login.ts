export class Login {
  correo_usuario: string;
  contrasenia_usuario: string;

  constructor(correo_usuario: string, contrasenia_usuario: string) {
    this.correo_usuario = correo_usuario;
    this.contrasenia_usuario = contrasenia_usuario;
  }
}
