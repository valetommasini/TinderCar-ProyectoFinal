import { Component, OnInit } from '@angular/core';
import { Cochera } from 'src/app/models/cochera';
import { CocheraService } from 'src/app/services/cochera.service';
import { MPagoService } from 'src/app/services/mpago.service';

@Component({
  selector: 'app-detalle-facturacion',
  templateUrl: './detalle-facturacion.component.html',
  styleUrls: ['./detalle-facturacion.component.css'],
})
export class DetalleFacturacionComponent implements OnInit {
  cocheraSeleccionada: Cochera | null = null;
  precioTotal: number = 0;

  cochera_Id: number = 0;
  tiempo_alquiler: number = 0;
  servicio_precio: number = 0;

  constructor(
    private cocheraSv: CocheraService,
    private mpagoSv: MPagoService
  ) {}

  ngOnInit(): void {
    this.cocheraSeleccionada = this.cocheraSv.getCocheraSeleccionada();
    this.precioTotal = this.cocheraSv.getPrecioTotal();
  }

  // ---------------------------------------------------------

  // pagar(): void {
  //   // Obtener la payment_url desde el backend
  //   this.mpagoSv.realizarPago().subscribe({
  //     next: (rta) => {
  //       const urlPago = rta.payment_url;
  //       window.location.href = urlPago;
  //       console.log('init_point', urlPago);
  //     },
  //     error: (err) => {
  //       console.log(err);
  //     },
  //   });
  // }

  pagar(): void {
    // Obtener los valores de cocheraId, tiempoAlquilerId y servicios según corresponda
    const cocheraId = this.mpagoSv.cocheraId;
    console.log(cocheraId);
    const tiempoAlquilerId = this.mpagoSv.tiempoAlquilerId;
    console.log(tiempoAlquilerId);
    const servicios = this.mpagoSv.servicios;
    console.log(servicios);

    // Realizar el pago y obtener la payment_url desde el backend
    // this.mpagoSv
    //   .realizarPago(cocheraId, tiempoAlquilerId, servicios)
    //   .subscribe({
    //     next: (rta) => {
    //       const urlPago = rta.payment_url;
    //       window.location.href = urlPago;
    //       console.log('init_point', urlPago);
    //     },
    //     error: (err) => {
    //       console.log(err);
    //     },
    //   });
  }

  // pagar(): void {
  //   const cocheraId = this.mpagoSv.cocheraId;
  //   const tiempoAlquilerId = this.mpagoSv.tiempoAlquilerId;
  //   const servicios = this.mpagoSv.servicios;

  //   this.mpagoSv
  //     .realizarPago(cocheraId, tiempoAlquilerId, servicios)
  //     .subscribe({
  //       next: (rta) => {
  //         const urlPago = rta.payment_url;
  //         window.location.href = urlPago;
  //         console.log('init_point', urlPago);
  //       },
  //       error: (err) => {
  //         console.log(err);
  //       },
  //     });
  // }
}
