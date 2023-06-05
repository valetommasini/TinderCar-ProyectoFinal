import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { RegisterService } from '../../services/register.service';
import { UserRegister } from '../models/user.register-models';

@Component({
  selector: 'app-registrate-unico',
  templateUrl: './registrate-unico.component.html',
  styleUrls: ['./registrate-unico.component.css'],
})
export class RegistrateUnicoComponent implements OnInit {
  // no puede llamarse exactamente igual, cambie la f a minuscula
  formGroup!: FormGroup;
  isSuccess: boolean = false;

  constructor(
    private registerService: RegisterService,
    private formBuilder: FormBuilder
  ) {}

  ngOnInit(): void {
    this.validationForm();
  }

  private validationForm(): void {
    this.formGroup = this.formBuilder.group({
      //faltaba la clave register que despues se llama en el html
      register: this.formBuilder.group({
        firstName: [
          '',
          [
            Validators.required,
            Validators.minLength(3),
            Validators.maxLength(50),
          ],
        ],
        lastName: [
          '',
          [
            Validators.required,
            Validators.minLength(3),
            Validators.maxLength(50),
          ],
        ],
        email: ['', [Validators.required, Validators.email]],
        password: [
          '',
          [
            Validators.required,
            Validators.minLength(6),
            Validators.maxLength(50),
          ],
        ],
        //faltaba phone
        phone: ['', [Validators.required]],
        repeatPassword: [
          '',
          [
            Validators.required,
            Validators.minLength(6),
            Validators.maxLength(50),
          ],
        ],
        //faltaba terms
        terms: ['', [Validators.required]],
      }),
    });
  }

  public sendUserForm(): void {
    if (this.formGroup.invalid) return;
    const userRegister: UserRegister = this.formGroup.value;
    this.registerService.userRegister(userRegister).subscribe({
      next: (response) => {
        this.isSuccess = true;
        console.log('Registro exitoso', response);
      },
      error: (error) => {
        console.log('Registro fallido', error);
      },
    });
  }
}
