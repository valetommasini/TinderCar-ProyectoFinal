import { Component, OnInit } from '@angular/core';
//import {FormControl, FormBuilder, FormGroup, Validators} from '@angular/forms'
import { FormBuilder, FormControl, FormGroup} from '@angular/forms'
import { Validators} from '@angular/forms'

@Component({
  selector: 'app-registrate-unico',
  templateUrl: './registrate-unico.component.html',
  styleUrls: ['./registrate-unico.component.css']
})

export class RegistrateUnicoComponent  {
  
  get firstName(){
    return this.form.get('firstName');
  }

  get lastname(){
    return this.form.get('lastname');
  }

  get email(){
    return this.form.get('email');
  }

  get phone(){
    return this.form.get('phone');
  }

  get password(){
    return this.form.get('password');
  }

  get password2(){
    return this.form.get('password2');
  }


  form = new FormGroup({
    'firstName':new FormControl('',[Validators.required,Validators.minLength(4),Validators.maxLength(16)]),
    'lastname':new FormControl('',[Validators.required,Validators.minLength(4),Validators.maxLength(16)]),
    'email':new FormControl('',[Validators.required, Validators.email]),
    'phone':new FormControl('',[Validators.required,Validators.minLength(10),Validators.maxLength(14)]),
    'password':new FormControl('',[Validators.required,Validators.minLength(8),Validators.maxLength(15)]),
    'password2':new FormControl('',[Validators.required])

  });
}

