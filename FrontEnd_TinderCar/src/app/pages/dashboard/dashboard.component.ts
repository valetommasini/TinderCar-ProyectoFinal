import { Component, OnInit } from '@angular/core';
import { Cochera } from 'src/app/models/cochera';
import { CocheraService } from 'src/app/services/cochera.service';
import { TokenService } from 'src/app/services/token.service';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css'],
})
export class DashboardComponent implements OnInit {
  public cocheras: Cochera[] = [];

  isLogged = false;
  email = '';

  constructor(
    private cocheraSv: CocheraService,
    private tokenSv: TokenService
  ) {}

  ngOnInit(): void {
    this.getAllCocheras();
    this.validacionLogin();
  }

  /*
  ==========================================
                  METODOS GET 
  ==========================================
  */
  getAllCocheras(): void {
    this.cocheraSv.getCocheras().subscribe({
      next: (rta: any) => {
        this.cocheras = rta.cocheras;
      },
      error: (err) => {
        console.log(err);
      },
    });
  }

  /*
  ==========================================
                METODOS DELETE 
  ==========================================
  */

  deleteCochera(id: number): void {
    this.cocheraSv.delCochera(id).subscribe({
      next: (data) => {
        alert('Cochera eliminada');
        this.getAllCocheras();
      },
      error: (err) => {
        console.error(err.error.mensaje);
      },
    });
  }

  public validacionLogin(): void {
    if (this.tokenSv.getToken()) {
      this.isLogged = true;
      this.email = this.tokenSv.getEmail();
    } else {
      this.isLogged = false;
      this.email = '';
    }
  }
}
