import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DetalleFacturacionComponent } from './detalle-facturacion.component';

describe('DetalleFacturacionComponent', () => {
  let component: DetalleFacturacionComponent;
  let fixture: ComponentFixture<DetalleFacturacionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DetalleFacturacionComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DetalleFacturacionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
