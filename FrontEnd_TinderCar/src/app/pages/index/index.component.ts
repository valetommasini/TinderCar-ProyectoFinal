import { Component, OnInit } from '@angular/core';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { IndexService } from 'src/app/services/index.service';

@Component({
  selector: 'app-index',
  templateUrl: './index.component.html',
  styleUrls: ['./index.component.css'],
})
export class IndexComponent implements OnInit {
  public mapa: SafeResourceUrl = '';
  public cardsData: {
    id: number;
    imgCard: string;
    tituloCard: string;
    descripcionCard: string;
  }[] = [];

  constructor(private indexSv: IndexService, private sanitizer: DomSanitizer) {}

  ngOnInit(): void {
    this.getData();
  }

  getData(): void {
    this.indexSv.getAllData().subscribe({
      next: (data) => {
        const urlMapa = data[0].ubicacion;
        this.mapa = this.sanitizer.bypassSecurityTrustResourceUrl(urlMapa);
        this.cardsData = data[1].cardsData;
      },
      error: (err) => {
        console.log(err);
      },
    });
  }
}
