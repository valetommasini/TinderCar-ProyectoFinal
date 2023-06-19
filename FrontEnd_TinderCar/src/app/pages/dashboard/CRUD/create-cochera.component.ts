import { Component, OnInit } from '@angular/core';
import { CocheraService } from 'src/app/services/cochera.service';
import { Cochera } from 'src/app/models/cochera';
import { Router } from '@angular/router';

@Component({
  selector: 'app-create-cochera',
  templateUrl: './create-cochera.component.html',
  styleUrls: ['./create-cochera.component.css'],
})
export class CreateCocheraComponent implements OnInit {
  public id_cochera = 0;
  public nombre_cochera = '';
  public img_cochera = '';
  public descripcion_cochera = '';
  public tiempo = '';
  public precio = 0;
  public servicio = '';
  public precio_servicio = 0;

  constructor(private cocheraSv: CocheraService, private router: Router) {}

  ngOnInit(): void {}
  onCreateCochera() {
    const nuevaCochera = new Cochera(
      // this.id_cochera,
      this.nombre_cochera,
      this.img_cochera,
      this.descripcion_cochera,
      this.tiempo,
      this.precio,
      this.servicio,
      this.precio_servicio
    );
    this.cocheraSv.postCochera(nuevaCochera).subscribe({
      next: (data) => {
        console.log('Nueva cochera agregada', data);
        this.router.navigate(['/dashboard']);
      },
      error: (err) => {
        console.error(err.error.mensaje);
        this.router.navigate(['/dashboard']);
      },
    });
    console.log(nuevaCochera);
  }
}
