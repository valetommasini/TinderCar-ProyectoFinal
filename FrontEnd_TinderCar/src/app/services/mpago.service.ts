import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/enviroment/enviroment';

@Injectable({
  providedIn: 'root',
})
export class MPagoService {
  private URL = `${environment.apiUrl}`;

  public cocheraId: number = 0;
  public tiempoAlquilerId: number = 0;
  public servicios: number[] = [];

  constructor(private http: HttpClient) {}
  realizarPago(
    cocheraId: number,
    tiempoAlquilerId: number,
    servicios: number[]
  ): Observable<any> {
    const url = `${this.URL}api/alquilar/`;
    const body = {
      cochera_id: cocheraId,
      tiempo_alquiler_id: tiempoAlquilerId,
      servicio: servicios,
    };
    return this.http.post<any>(url, body);
  }
}
