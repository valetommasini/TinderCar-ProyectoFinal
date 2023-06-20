import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/enviroment/enviroment';
import { Cochera } from '../models/cochera';

@Injectable({
  providedIn: 'root',
})
export class CocheraService {
  // apiUrl: 'http://localhost:8000/',
  URL = `${environment.apiUrl}`;

  constructor(private http: HttpClient) {}

  //READ
  public getCocheras(): Observable<Cochera[]> {
    return this.http.get<Cochera[]>(`${this.URL}api/cocheras/`);
  }

  public getDetailCochera(id: number): Observable<Cochera> {
    return this.http.get<Cochera>(`${this.URL}api/cocheras/${id}`);
  }

  public postCochera(cochera: Cochera): Observable<any> {
    return this.http.post<any>(`${this.URL}api/cocheras/`, cochera);
  }

  public patchCochera(id: number, cochera: Cochera): Observable<any> {
    return this.http.patch<any>(`${this.URL}api/cocheras/${id}`, cochera);
  }

  public delCochera(id: number): Observable<any> {
    return this.http.delete<any>(`${this.URL}api/cocheras/${id}`);
  }

  public getTiemposAlquiler(cocheraId: number): Observable<any> {
    return this.http.get<any>(
      `${this.URL}api/cocheras/${cocheraId}/tiempo-alquiler/`
    );
  }

  public getServicios(cocheraId: number): Observable<any> {
    return this.http.get<any>(`${this.URL}api/cocheras/${cocheraId}/servicio/`);
  }
}
