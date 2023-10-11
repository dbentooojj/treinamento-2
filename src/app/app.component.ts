import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
})
export class AppComponent {
  title = 'treinamento-app';
  contador = 0;

  incrementarContador() {
    this.contador++;
  }
}
