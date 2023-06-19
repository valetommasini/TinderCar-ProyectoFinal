import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LayoutsModule } from './layouts/layouts.module';
import { PagesModule } from './pages/pages.module';
import { HttpClientModule } from '@angular/common/http';
// para validar con formularios reactivos
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ErrorTailorModule } from '@ngneat/error-tailor';
import { config } from 'rxjs';

@NgModule({
  declarations: [AppComponent],
  imports: [
    BrowserModule,
    AppRoutingModule,
    LayoutsModule,
    PagesModule,
    HttpClientModule,
    ReactiveFormsModule,
    //ErrorTailorModule.forRoot(config: {
    /*bootstrapApplication(AppComponent, {
        providers: [
          provideErrorTailorConfig({
      errors: {
        usevalue:{
          required: 'this filed is required',
          minlength: ({requiredLength, actualLength}) =>
          `Expect ${requiredLength} but got ${actualLength}`,
          invalidAddress: error => `Address isn't valid`
        }
      }
    })*/
],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
