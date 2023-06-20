import { Component } from '@angular/core';
import { NavigationEnd, Router } from '@angular/router';

@Component({
  selector: 'app-nav',
  templateUrl: './nav.component.html',
  styleUrls: ['./nav.component.css'],
})
export class NavComponent {
  //inicializo la varaible en falso para ocultar los links
  isLogged: boolean = false;

  constructor(private router: Router) {}

  ngOnInit(): void {
    this.onLoggout();
  }

  /*
  me subscribo a los eventos de router. 
  con instanceof compruebo si el objeto event es una instancia de la clase NavigationEnd ademas de esto, 
  hago una operacion logica con && event.url === "/home". entonces con esto digo,

  SI 
    event instanceof NavigationEnd Y event.url === "/home" entonces
      cambia el valor de la variable isLogged a true
      this.isLogged = true;

  si esto valida a verdadero al simular ingresar, aparacen o desaparecen los links de nav 
  (ej. aparece cerrar sesion y desaparece sobre nosotros).
  */
  public onLoggout() {
    this.router.events.subscribe((event) => {
      if (event instanceof NavigationEnd && event.url === '/home') {
        this.isLogged = true;
      }
    });
  }
}
