export class Jwt {
  access_token: string;
  type: string;
  correo_usuario: string;
  authorities: string;

  constructor(
    token: string,
    type: string,
    correo_usuario: string,
    authorities: string
  ) {
    this.access_token = token;
    this.type = type;
    this.correo_usuario = correo_usuario;
    this.authorities = authorities;
  }
}
