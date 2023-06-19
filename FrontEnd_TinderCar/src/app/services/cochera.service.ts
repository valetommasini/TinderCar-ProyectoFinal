import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/enviroment/enviroment';
import { Cochera } from '../models/cochera';

@Injectable({
  providedIn: 'root',
})
export class CocheraService {
  URL = `${environment.apiUrl}`;

  cocheraSeleccionada: Cochera | null = null;
  precioTotal: number = 0;

  cochera_Id: number = 0;
  tiempo_alquiler: number = 0;
  servicio_precio: number = 0;

  constructor(private http: HttpClient) {}

  setCocheraSeleccionada(cochera: Cochera): void {
    this.cocheraSeleccionada = cochera;
  }

  getCocheraSeleccionada(): Cochera | null {
    return this.cocheraSeleccionada;
  }

  setPrecioTotal(precio: number): void {
    this.precioTotal = precio;
  }

  getPrecioTotal(): number {
    return this.precioTotal;
  }

  //READ
  public getCocheras(): Observable<Cochera[]> {
    return this.http.get<Cochera[]>(`${this.URL}api/cocheras/`);
  }

  public getTiemposAlquiler(cocheraId: number): Observable<any> {
    return this.http.get<any>(
      `${this.URL}api/cocheras/${cocheraId}/tiempo-alquiler/`
    );
  }

  public getServicios(cocheraId: number): Observable<any> {
    return this.http.get<any>(
      `${this.URL}api/cocheras/${cocheraId}/servicios/`
    );
  }
}
