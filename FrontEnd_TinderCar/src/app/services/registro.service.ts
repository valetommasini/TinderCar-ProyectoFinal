import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/enviroment/enviroment';
import { NuevoUsuario } from '../models/nuevo-usuario';

@Injectable({
  providedIn: 'root',
})
export class RegistroService {
  URL = `${environment.apiUrl}`;
  constructor(private http: HttpClient) {}

  public getUsusarios(): Observable<NuevoUsuario[]> {
    return this.http.get<NuevoUsuario[]>(`${this.URL}api/signin/`);
  }

  public postUsusario(usuario: NuevoUsuario): Observable<any> {
    return this.http.post<any>(`${this.URL}api/signin/`, usuario);
  }
}
