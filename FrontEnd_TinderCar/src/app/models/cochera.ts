export class Cochera {
  id_cochera?: number;
  nombre_cochera: string;
  img_cochera: string;
  descripcion_cochera: string;
  tiempo: string;
  precio: number;
  servicio: string;
  precio_servicio: number;

  constructor(
    // id_cochera: number,
    nombre_cochera: string,
    img_cochera: string,
    descripcion_cochera: string,
    tiempo: string,
    precio: number,
    servicio: string,
    precio_servicio: number
  ) {
    // this.id_cochera = id_cochera;
    this.nombre_cochera = nombre_cochera;
    this.img_cochera = img_cochera;
    this.descripcion_cochera = descripcion_cochera;
    this.tiempo = tiempo;
    this.precio = precio;
    this.servicio = servicio;
    this.precio_servicio = precio_servicio;
  }
}
