export class Alquiler {
  // id_cochera?: number;
  tiempo: string;
  precio: number;
  servicio: string;
  precio_servicio: number;

  constructor(
    // id_cochera: number,
    tiempo: string,
    precio: number,
    servicios: string,
    precio_servicio: number
  ) {
    // this.id_cochera = id_cochera;
    this.tiempo = tiempo;
    this.precio = precio;
    this.servicio = servicios;
    this.precio_servicio = precio_servicio;
  }
}
