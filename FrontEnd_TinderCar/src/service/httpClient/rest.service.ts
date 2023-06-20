import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class RestService {
  //el http en naranja se llama alias
  constructor(private http: HttpClient) {}

  public getDatos(): Observable<any> {
    return this.http.get('http://localhost:3000/elegirCochera');
  }
}
