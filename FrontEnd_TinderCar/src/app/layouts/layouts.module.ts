import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HeaderComponent } from './shared/header/header.component';
import { FooterComponent } from './shared/footer/footer.component';
import { RouterModule } from '@angular/router';
import { NavComponent } from './shared/nav/nav.component';

@NgModule({
  declarations: [HeaderComponent, FooterComponent, NavComponent],
  imports: [CommonModule, RouterModule],
  exports: [HeaderComponent, FooterComponent, NavComponent],
})
export class LayoutsModule {}
