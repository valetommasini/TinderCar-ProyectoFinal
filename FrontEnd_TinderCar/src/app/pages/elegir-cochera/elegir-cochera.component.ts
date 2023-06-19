import { Component } from '@angular/core';
import { Alquiler } from 'src/app/models/alquiler';
import { Cochera } from 'src/app/models/cochera';
import { ItemCocheraData } from 'src/app/models/item-cochera-data';
import { CocheraService } from 'src/app/services/cochera.service';
import { MPagoService } from 'src/app/services/mpago.service';

@Component({
  selector: 'app-elegir-cochera',
  templateUrl: './elegir-cochera.component.html',
  styleUrls: ['./elegir-cochera.component.css'],
})
export class ElegirCocheraComponent {
  public cocheras: Cochera[] = [];
  public tiemposPrecios: Alquiler[] = [];
  public serviciosPrecios: Alquiler[] = [];

  public tiempoSeleccionado: any;
  public servicioSeleccionado: any;

  urlPago: string | undefined;
  constructor(
    private cocheraSv: CocheraService,
    private mPagoSv: MPagoService
  ) {}

  ngOnInit(): void {
    this.getDataBack();
  }

  getDataBack(): void {
    this.cocheraSv.getCocheras().subscribe({
      next: (rta: any) => {
        this.cocheras = rta.cocheras;
      },
      error: (err) => {
        console.log(err);
      },
    });
  }

  tiempAlqData(item: any): void {
    const cocheraId = item.id_cochera;
    this.cocheraSv.getTiemposAlquiler(cocheraId).subscribe({
      next: (rta) => {
        const data = rta.cochera.tiempo_alquiler;
        const alquileres: Alquiler[] = []; // Crear un arreglo temporal para almacenar las instancias de Alquiler

        for (let i = 0; i < data.length; i++) {
          let tiempo: string;

          switch (data[i].tiempo) {
            case '1d':
              tiempo = '1 día';
              break;
            case '15d':
              tiempo = '15 días';
              break;
            case '1m':
              tiempo = '1 mes';
              break;
            case '6m':
              tiempo = '6 meses';
              break;
            case '1a':
              tiempo = '1 año';
              break;
            default:
              tiempo = data[i].tiempo;
              break;
          }

          const alquiler = new Alquiler(
            // data[i].id_cochera,
            data[i].tiempo,
            data[i].precio,
            data[i].servicio,
            data[i].precio_servicio
          );
          alquiler.tiempo = tiempo;
          alquileres.push(alquiler);
        }

        this.tiemposPrecios = alquileres; // Asignar el arreglo de instancias de Alquiler a this.tiemposPrecios
        console.log(this.tiemposPrecios);
      },
      error: (err) => {
        console.log(err);
      },
    });
  }

  servData(item: any): void {
    const cocheraId = item.id_cochera;
    console.log('ID de la cochera:', cocheraId);
    this.cocheraSv.getServicios(cocheraId).subscribe({
      next: (rta) => {
        const data = rta.cochera.servicios;
        console.log(data);

        for (let i = 0; i < data.length; i++) {
          switch (data[i].servicio) {
            case 'servicio1':
              const sv1 = (data[i].servicio = 'Lavado carroceria');
              break;
            case 'servicio2':
              const sv2 = (data[i].servicio = 'Lavado carroceria y tapizado');
              break;
            case 'servicio3':
              const sv3 = (data[i].servicio =
                'Servicio completo mas tratamiento ceramico');
              break;
            default:
              break;
          }
        }
        this.serviciosPrecios = data;
      },
      error: (err) => {
        console.log(err);
      },
    });
  }

  // obtengo el índice de cada tarjeta y modal
  getIndex(data: any): number {
    return this.cocheras.indexOf(data);
  }

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

  selectTiempo(tiempoAlq: any): void {
    this.tiempoSeleccionado = tiempoAlq;
    const costoTiempo = tiempoAlq.precio;
    console.log('Tiempo elegido: ', costoTiempo);
  }

  selectServicio(): void {
    const servicio = document.getElementById(
      'inputGroupSelect01'
    ) as HTMLSelectElement;
    const opcionSeleccionada = servicio.options[servicio.selectedIndex];
    const precioServicio =
      opcionSeleccionada.querySelector('span')?.textContent;
    this.servicioSeleccionado = Number(precioServicio || 0);
    console.log('Precio del servicio:', this.servicioSeleccionado);
  }

  agregar(item: Cochera) {
    console.log(item);
    let precioTiempo = this.tiempoSeleccionado
      ? this.tiempoSeleccionado.precio
      : item.precio;

    let data_item: ItemCocheraData = {
      id_cochera: item.id_cochera ?? 0,
      nombre_cochera: item.nombre_cochera,
      img_cochera: item.img_cochera,
      precio: precioTiempo,
      precio_servicio: this.servicioSeleccionado,
    };

    if (localStorage.getItem('carrito') === null) {
      //si no hay nada en el localstorage, se crea el item y se almacena en el localstorage
      let carrito: ItemCocheraData[] = [];
      carrito.push(data_item);
      localStorage.setItem('carrito', JSON.stringify(carrito));
    } else {
      //para almacenar mas de 1 cochera
      //si hay un item en el localstorage lo recupero como string
      let storage = localStorage.getItem('carrito') as string;

      //parseo los datos obtenidos en la variable storage
      let carrito = JSON.parse(storage);

      //pusheo los datos a carrito
      carrito.push(data_item);

      //seteo el item, estableciendo una clave "carrito" con  JSON.stringify(carrito)
      localStorage.setItem('carrito', JSON.stringify(carrito));
    }
  }
}
