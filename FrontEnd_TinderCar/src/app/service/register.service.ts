import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { UserRegister } from '../pages/models/user-register.models';

@Injectable({
  providedIn: 'root'
})
export class RegisterService {

  constructor(private httpClient: HttpClient) { 

  }

  public userRegister (user: UserRegister): Observable<UserRegister> {
    return this.httpClient.post<UserRegister>(/*'this.url'*/, user);
  }
}



