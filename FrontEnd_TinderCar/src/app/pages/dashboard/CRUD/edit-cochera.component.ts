import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Cochera } from 'src/app/models/cochera';
import { CocheraService } from 'src/app/services/cochera.service';

@Component({
  selector: 'app-edit-cochera',
  templateUrl: './edit-cochera.component.html',
  styleUrls: ['./edit-cochera.component.css'],
})
export class EditCocheraComponent implements OnInit {
  cochera?: Cochera; // Permitir asignar 'null'

  constructor(
    private cocheraSv: CocheraService,
    private actRoute: ActivatedRoute,
    private route: Router
  ) {}
  ngOnInit(): void {
    const id = this.actRoute.snapshot.params['id'];
    this.cocheraSv.getDetailCochera(id).subscribe({
      next: (rta: any) => {
        this.cochera = rta.cochera;
        console.log(rta);
      },
      error: (err) => {
        console.log('Error', err);
        this.route.navigate(['/dashboard']);
      },

      // next: (rta: any) => {
      //   this.cochera = rta.cochera; // Utiliza rta.cochera en lugar de rta.cocheras
      //   console.log(this.cochera);
      // },
      // error: (err) => {
      //   console.log('Error', err);
      //   this.route.navigate(['/dashboard']);
      // },
    });
  }

  updateCochera(): void {
    const id = this.actRoute.snapshot.params['id'];

    if (this.cochera !== undefined) {
      this.cocheraSv.patchCochera(id, this.cochera).subscribe({
        next: (data) => {
          alert('Cochera actualizada');
          this.route.navigate(['/dashboard']);
        },
        error: (err) => {
          console.log('Error', err);
          this.route.navigate(['/dashboard']);
        },
      });
    } else {
      console.log('La variable cochera es undefined');
    }
  }
}
