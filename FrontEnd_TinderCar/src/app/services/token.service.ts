import { Injectable } from '@angular/core';
const AUTH_TOKEN_KEY = 'AuthToken'; //token
const EMAIL_KEY = 'AuthEmail'; // email
const AUTHORITIES_KEY = 'AuthAuthorities'; //rol
@Injectable({
  providedIn: 'root',
})
export class TokenService {
  roles: string = '';
  constructor() {}
  // para setear un token
  public setToken(token: string): void {
    window.sessionStorage.removeItem(AUTH_TOKEN_KEY);
    window.sessionStorage.setItem(AUTH_TOKEN_KEY, token);
  }

  public getToken(): string {
    // Al agregar ! después de getItem(AUTH_TOKEN_KEY), le estás diciendo a TypeScript que confías en que
    // el valor de retorno no será null. Sin embargo, debes estar seguro de que en tu aplicación,
    // sessionStorage.getItem(AUTH_TOKEN_KEY) siempre devolverá un valor de tipo string y no null.
    return sessionStorage.getItem(AUTH_TOKEN_KEY)!;
  }

  // ======================================= seteo de usuario por email
  public setEmail(AuthEmail: string): void {
    window.sessionStorage.removeItem(EMAIL_KEY);
    window.sessionStorage.setItem(EMAIL_KEY, JSON.stringify(AuthEmail));
  }

  public getEmail(): string {
    return sessionStorage.getItem(EMAIL_KEY)!;
  }
  // ==========================================

  // ==========================================
  public setAuthorities(authorities: string): void {
    window.sessionStorage.removeItem(AUTHORITIES_KEY);
    window.sessionStorage.setItem(AUTHORITIES_KEY, JSON.stringify(authorities));
  }

  public getAuthorities(): string {
    this.roles = '';
    if (sessionStorage.getItem(AUTHORITIES_KEY)) {
      const authorities = JSON.parse(sessionStorage.getItem(AUTHORITIES_KEY)!);
      this.roles = authorities.join(',');
      console.log(this.roles);
    }
    return this.roles;
  }

  public logOut(): void {
    window.sessionStorage.clear();
  }
}
