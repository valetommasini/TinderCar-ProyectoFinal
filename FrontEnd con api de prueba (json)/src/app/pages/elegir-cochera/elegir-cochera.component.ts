import { Component } from '@angular/core';
import { IndexService } from 'src/app/services/index.service';

@Component({
  selector: 'app-elegir-cochera',
  templateUrl: './elegir-cochera.component.html',
  styleUrls: ['./elegir-cochera.component.css'],
})
export class ElegirCocheraComponent {
  public elegirCochera: {
    img: string;
    nombre: string;
    descripcion: string;
  }[] = [];

  public elegirCantidad: {
    autosCantidad: string;
    precio: number;
  }[] = [];

  public elegirServicio: {
    lavado: string;
    precio: number;
  }[] = [];

  public elegirTiempo: {
    tiempo: string;
    precio: string;
  } [] = []

  // public carrito: any[] = []; //array para almacenar las cocheras
  constructor(private indexSv: IndexService) {}

  ngOnInit(): void {
    this.getData();
  }

  getData(): void {
    this.indexSv.getAllData().subscribe({
      next: (data) => {
        this.elegirCochera = data[3].cocheras;
        this.elegirCantidad = data[3].cantidad;
        this.elegirServicio = data[3].servicios;
        this.elegirTiempo = data[3].tiempoPrecio;
      },
      error: (err) => {
        console.log(err);
      },
    });
  }
  // obtengo el índice de cada tarjeta y modal
  getIndex(data: any): number {
    return this.elegirCochera.indexOf(data);
  }

  // agregarCochera(cochera: any): void {
  //   this.carrito.push(cochera);
  //   console.log(cochera);
  // }

  cerrarModal(): void {
    // Remover el elemento del DOM
    const modalBackdrop = document.querySelector('.modal-backdrop');
    if (modalBackdrop) {
      modalBackdrop.remove();
    }

    // Restaurar el comportamiento del body
    document.body.classList.remove('modal-open');
    document.body.style.overflow = 'auto'; //restaura el overflow hidden
    document.body.style.paddingRight = ''; //restaura el padding
  }
}
