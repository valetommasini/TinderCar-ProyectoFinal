export class ItemCocheraData {
  id_cochera: number;
  nombre_cochera: string;
  img_cochera: string;
  precio: number;
  precio_servicio: number;

  constructor(
    id_cochera: number,
    nombre_cochera: string,
    img_cochera: string,
    precio: number,
    precio_servicio: number
  ) {
    this.id_cochera = id_cochera;
    this.nombre_cochera = nombre_cochera;
    this.img_cochera = img_cochera;
    this.precio = precio;
    this.precio_servicio = precio_servicio;
  }
}
