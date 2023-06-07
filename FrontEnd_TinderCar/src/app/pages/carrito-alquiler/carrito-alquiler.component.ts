import { Component, OnInit } from '@angular/core';
import { Cochera } from 'src/app/models/cochera';
import { CocheraService } from 'src/app/services/cochera.service';

@Component({
  selector: 'app-carrito-alquiler',
  templateUrl: './carrito-alquiler.component.html',
  styleUrls: ['./carrito-alquiler.component.css'],
})
export class CarritoAlquilerComponent implements OnInit {
  cocheraSeleccionada: Cochera | null = null;
  precioTotal: number = 0;

  constructor(private cocheraSv: CocheraService) {}

  ngOnInit(): void {
    this.cocheraSeleccionada = this.cocheraSv.cocheraSeleccionada;
    this.precioTotal = this.cocheraSv.getPrecioTotal();
  }
}
