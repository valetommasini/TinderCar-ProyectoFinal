import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/enviroment/enviroment';
import { HttpClient } from '@angular/common/http';
import { Login } from '../models/login';
import { Jwt } from '../models/jwt';
@Injectable({
  providedIn: 'root',
})
export class AuthService {
  URL = `${environment.apiUrl}`;

  constructor(private http: HttpClient) {}

  public login(login: Login): Observable<any> {
    return this.http.post<Jwt>(`${this.URL}api/login/`, login);
  }
}
