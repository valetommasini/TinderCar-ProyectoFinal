import { Component } from '@angular/core';
import { Cochera } from 'src/app/models/cochera';
import { CocheraService } from 'src/app/services/cochera.service';
import { MPagoService } from 'src/app/services/mpago.service';

@Component({
  selector: 'app-elegir-cochera',
  templateUrl: './elegir-cochera.component.html',
  styleUrls: ['./elegir-cochera.component.css'],
})
export class ElegirCocheraComponent {
  public tiempoElegido: any; // Variable para almacenar el tiempo seleccionado
  public servicioElegido: number = 0; // Variable para almacenar el tiempo seleccionado
  public precioTotal: number = 0;

  public cocheras: Cochera[] = [];
  public cocheraSeleccionada: Cochera | null = null;
  public tiemposPrecios: Cochera[] = [];
  public serviciosPrecios: Cochera[] = [];

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
    this.cocheraSv.getTiemposAlquiler(1).subscribe({
      next: (rta) => {
        const data = rta.cochera.tiempo_alquiler;
        for (let i = 0; i < data.length; i++) {
          switch (data[i].tiempo) {
            case '1d':
              const dia = (data[i].tiempo = '1 día');
              break;
            case '15d':
              const dias = (data[i].tiempo = '15 días');
              break;
            case '1m':
              const mes = (data[i].tiempo = '1 mes');
              break;
            case '6m':
              const meses = (data[i].tiempo = '6 meses');
              break;
            case '1a':
              const año = (data[i].tiempo = '1 año');
              break;
            default:
              break;
          }
        }
        this.tiemposPrecios = data;
      },
      error: (err) => {
        console.log(err);
      },
    });
    this.cocheraSv.getServicios(1).subscribe({
      next: (rta) => {
        const data = rta.cochera.servicios;
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

  costoTiempo(tiempo: any): number {
    this.tiempoElegido = tiempo.precio;
    console.log('Costo del tiempo:', this.tiempoElegido);
    this.tiempoElegido = tiempo;
    // console.log('Tiempo elegido:', this.tiempoElegido);
    return tiempo.precio;
  }

  costoServicio(servicio: any): number {
    const selectedValue = servicio?.target?.value;
    if (selectedValue) {
      const selectedService = this.serviciosPrecios.find(
        (servicio) => servicio.servicio === selectedValue
      );
      if (selectedService) {
        this.servicioElegido = selectedService.precio;
        console.log('Costo del servicio:', this.servicioElegido);
        return selectedService.precio;
      }
    }
    return 0; // Valor predeterminado en caso de que no se encuentre el servicio
  }

  agregar(
    cocheraId: number,
    tiempoAlquilerId: number,
    servicios: number
  ): void {
    const cocheraSeleccionada = this.cocheras.find(
      (cochera) => cochera.id_cochera === cocheraId
    );

    const alquilerSeleccionado = this.cocheras.find(
      (alquiler) => alquiler.precio === tiempoAlquilerId
    );

    const servicioSeleccionado = this.cocheras.find(
      (servicio) => servicio.precio_servicio === servicios
    );

    if (cocheraSeleccionada && alquilerSeleccionado && servicioSeleccionado) {
      // MUESTRA EL OBJETO COMPLETO
      this.cocheraSv.cocheraSeleccionada = cocheraSeleccionada;
      this.cocheraSeleccionada = cocheraSeleccionada;
      console.log(cocheraSeleccionada);

      const cocheraElegida = (this.mPagoSv.cocheraId = cocheraId);
      console.log('Cochera', cocheraElegida);

      const alqulerElegido = (this.mPagoSv.tiempoAlquilerId =
        alquilerSeleccionado.id_cochera);
      console.log('Alquiler elegido', alqulerElegido);

      const servicioElegido = (this.mPagoSv.servicios = [
        servicioSeleccionado.precio_servicio,
      ]);
      console.log('Servicio elegido', servicioElegido);

      this.suma();
    }
  }

  suma(): void {
    if (this.tiempoElegido && this.servicioElegido) {
      const total = this.tiempoElegido.precio + this.servicioElegido;
      this.cocheraSv.setPrecioTotal(total);
      console.log('El total es:', total);
    }
  }
}

// agregar(
//   cocheraId: number,
//   precio_alquiler: number,
//   servicio_precio: number
// ): void {
//   const cocheraSeleccionada = this.cocheras.find(
//     (cochera) => cochera.id_cochera === cocheraId
//   );

//   const alquilerSeleccionado = this.cocheras.find(
//     (alquiler) => alquiler.precio === precio_alquiler
//   );

//   const servicioSeleccionado = this.cocheras.find(
//     (servicio) => servicio.precio_servicio === servicio_precio
//   );
//   if (cocheraSeleccionada) {
//     this.cocheraSv.cocheraSeleccionada = cocheraSeleccionada;
//     this.cocheraSeleccionada = cocheraSeleccionada;
//     console.log(cocheraSeleccionada);

//     // -------------------------------------
//     this.mPagoSv.cocheraId = cocheraId;
//     this.mPagoSv.tiempoAlquilerId = this.tiempoElegido?.id;
//     this.mPagoSv.servicios = [this.servicioElegido];
//     this.suma();
//   }
// }
