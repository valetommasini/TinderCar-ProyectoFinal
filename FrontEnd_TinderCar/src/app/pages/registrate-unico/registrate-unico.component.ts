import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { RegisterService } from '../../service/register.service';
import { UserRegister } from '../models/user-register.models';

@Component({
  selector: 'app-registrate-unico',
  templateUrl: './registrate-unico.component.html',
  styleUrls: ['./registrate-unico.component.css']
})
export class RegistrateUnicoComponent implements OnInit {  

  FormGroup!: FormGroup;
  isSuccess: boolean = false;

  constructor(private registerService: RegisterService, private formBuilder: FormBuilder) {

  }

  ngOnInit(): void {
    this.validationForm();
  }

  private validationForm(): void {
    this.FormGroup = this.formBuilder.group({
      firstName: ['', [Validators.required, Validators.minLength(3), Validators.maxLength(50)]],
      lastName: ['', [Validators.required, Validators.minLength(3), Validators.maxLength(50)]],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6), Validators.maxLength(50)]],
      repeatPassword: ['', [Validators.required, Validators.minLength(6), Validators.maxLength(50)]]
    });
  }

  public sendUserForm(): void {
    if (this.FormGroup.invalid) 
      return;
  
    const userRegister: UserRegister = this.FormGroup.value;
    this.registerService.userRegister(userRegister).subscribe({
      next: (response) => {
        this.isSuccess = true;
        console.log('Registro exitoso', response);
      },
      error: (error) => {
        console.log('Registro fallido', error);
      } 
    });
  }
}