import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/enviroment/enviroment';

@Injectable({
  providedIn: 'root',
})
export class IndexService {
  URL = `${environment.apiJson}`;
  constructor(private http: HttpClient) {}

  public getAllData(): Observable<any> {
    return this.http.get<any>(`${this.URL}`);
  }
}
