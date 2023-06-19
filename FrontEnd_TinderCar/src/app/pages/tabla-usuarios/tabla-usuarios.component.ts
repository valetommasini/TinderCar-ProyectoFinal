import { Component, OnInit } from '@angular/core';
import { NuevoUsuario } from 'src/app/models/nuevo-usuario';
import { RegistroService } from 'src/app/services/registro.service';
import { TokenService } from 'src/app/services/token.service';

@Component({
  selector: 'app-tabla-usuarios',
  templateUrl: './tabla-usuarios.component.html',
  styleUrls: ['./tabla-usuarios.component.css'],
})
export class TablaUsuariosComponent implements OnInit {
  public usuarios: NuevoUsuario[] = [];
  isLogged = false;
  email = '';

  constructor(
    private usuarioSv: RegistroService,
    private tokenSv: TokenService
  ) {}

  ngOnInit() {
    this.getUsuarios();
    this.validacionLogin();
  }
  getUsuarios(): void {
    this.usuarioSv.getUsusarios().subscribe({
      next: (rta: any) => {
        this.usuarios = rta.usuarios;
      },
      error: (err) => {
        console.log(err);
      },
    });
  }
  public validacionLogin(): void {
    if (this.tokenSv.getToken()) {
      this.isLogged = true;
      this.email = this.tokenSv.getEmail();
    } else {
      this.isLogged = false;
      this.email = '';
    }
  }
}
