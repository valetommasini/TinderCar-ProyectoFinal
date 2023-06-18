import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  constructor() {}
  public login(obj: any): boolean {
    return obj.usuario === 'admin@email.com' && obj.contrasenia === 'admin1234';
  }
}
