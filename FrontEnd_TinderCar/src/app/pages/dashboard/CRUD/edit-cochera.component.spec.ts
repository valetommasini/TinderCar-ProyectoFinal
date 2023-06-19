import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditCocheraComponent } from './edit-cochera.component';

describe('EditCocheraComponent', () => {
  let component: EditCocheraComponent;
  let fixture: ComponentFixture<EditCocheraComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditCocheraComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EditCocheraComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
