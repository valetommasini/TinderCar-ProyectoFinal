import { Component, OnInit } from '@angular/core';
import { Cochera } from 'src/app/models/cochera';
import { ItemCocheraData } from 'src/app/models/item-cochera-data';
import { CocheraService } from 'src/app/services/cochera.service';

@Component({
  selector: 'app-carrito-alquiler',
  templateUrl: './carrito-alquiler.component.html',
  styleUrls: ['./carrito-alquiler.component.css'],
})
export class CarritoAlquilerComponent implements OnInit {
  listaCocheras: ItemCocheraData[] | undefined;

  constructor(private cocheraSv: CocheraService) {}

  ngOnInit(): void {
    let storage = localStorage.getItem('carrito') as string; // as string para transformar en string
    let cocheraElegida = JSON.parse(storage);
    this.listaCocheras = cocheraElegida;
  }

  agregar(item: Cochera) {
    console.log(item);
    let data_item: ItemCocheraData = {
      id_cochera: item.id_cochera ?? 0,
      nombre_cochera: item.nombre_cochera,
      img_cochera: item.img_cochera,
      precio: item.precio,
      precio_servicio: item.precio_servicio,
    };
    let carrito: ItemCocheraData[] = [];
    carrito.push(data_item);

    localStorage.setItem('carrito', JSON.stringify(carrito));
  }

  eliminar(id: string): void {
    const indice = this.listaCocheras!.findIndex(
      (item) => item.nombre_cochera === id
    );
    if (indice !== -1) {
      this.listaCocheras!.splice(indice, 1);
      console.log('Producto eliminado:', id);
    }
  }

  vaciarCarrito(): void {
    if (window.confirm('¿Estás seguro de cancelar la compra?')) {
      localStorage.clear();
      this.listaCocheras = [];
      // const textElement = document.getElementById('alquiler');
      // if (textElement) {
      //   textElement.textContent = 'Volver';
      // }
    }
  }
}
