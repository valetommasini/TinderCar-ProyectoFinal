import { Component, OnInit } from '@angular/core';
import { Cochera } from 'src/app/models/cochera';
import { ItemCocheraData } from 'src/app/models/item-cochera-data';
import { CocheraService } from 'src/app/services/cochera.service';
import { MPagoService } from 'src/app/services/mpago.service';

@Component({
  selector: 'app-detalle-facturacion',
  templateUrl: './detalle-facturacion.component.html',
  styleUrls: ['./detalle-facturacion.component.css'],
})
export class DetalleFacturacionComponent implements OnInit {
  listaCocheras: ItemCocheraData[] | undefined;

  constructor(
    private cocheraSv: CocheraService,
    private mpagoSv: MPagoService
  ) {}

  ngOnInit(): void {
    //hago referencia a la clave "carrito" pasada en el setItem de elegirCochera
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

  vaciarCarrito(): void {
    if (window.confirm('¿Cancelar la compra y volver al inicio?')) {
      localStorage.clear();
      this.listaCocheras = [];
      // const textElement = document.getElementById('alquiler');
      // if (textElement) {
      //   textElement.textContent = 'Volver';
      // }
    }
  }
  // ---------------------------------------------------------
  pagar(): void {
    const items = localStorage.getItem('carrito');
    if (items) {
      const carritoItems: ItemCocheraData[] = JSON.parse(items);
      console.log(carritoItems);

      if (carritoItems.length > 0) {
        const cocheraId = carritoItems[0].id_cochera;
        let tiempoAlquilerId = carritoItems[0].precio;
        const servicios = carritoItems[0].precio_servicio;
        console.log(cocheraId, tiempoAlquilerId, servicios); // yo aca estoy obteniendo los valores

        // aca yo tengo que pasar las posiciones
        this.mpagoSv
          .realizarPago(
            cocheraId,
            1, //asi pasa el id de tiempo pasando variables no funciona mercadopago si seteamos en duro si
            [1] //accede al array de servicio pasando variables no funciona mercadopago si seteamos en duro si
            // [servicios]
          )
          .subscribe({
            next: (rta) => {
              const urlPago = rta.payment_url;
              window.location.href = urlPago;
              console.log('init_point', urlPago);
            },
            error: (err) => {
              console.log(err.message);
            },
          });
      }
    }

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
}
