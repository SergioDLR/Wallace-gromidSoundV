class niveles {
  float alpha;
  PImage imageTransicion;
  int contador, contadorDeVictoria, cant = 5;
  PImage background;

  flor miFlor[][];
  Hud miHud;
  Conejo miConejo; 
  aspiradora miAspiradora;

  niveles() {
    miHud = new Hud();
    miFlor = new flor[cant][cant];
    miConejo = new Conejo(-10, -10, "conejo2.png", 1, 1);
    miAspiradora = new aspiradora(mouseX, mouseY);
    alpha =255;
    background = loadImage("fondo.jpg");
  }

  void cargarNivel(String conejoImage, String florImage, String nivelImage, String SiguienteEstado, int hp, String bg, int velocidad) {
    background = loadImage(bg);
    miHud.reset();
    contador =0;
    contadorDeVictoria =0;
    background(background);
    pushStyle();
    imageTransicion = loadImage(nivelImage);
    fill(0, alpha);
    rect(-10, -10, 900, 700);
    println(alpha);
    alpha = alpha -5;
    tint(255, alpha);
    image(imageTransicion, 0, 0);
    popStyle();
    miConejo = new Conejo(-10, -10, conejoImage, hp, velocidad);
    for ( int i=0; i<cant; i++ ) {
      for ( int e=0; e<cant; e++ ) {
        miFlor[i][e] = new flor (i*200+100, e*100+150, florImage);
      }
    }
    if (alpha< 0) {
      miJuego.estado = SiguienteEstado;
    }
  }


  void nivel(String siguienteEstado, int derrota) {
    background(background);
    miAspiradora = new aspiradora(mouseX, mouseY);
    alpha = 255;
    for ( int i=0; i<cant; i++ ) {
      for ( int e=0; e<cant; e++ ) {
        miFlor[i][e].dibujar();
        if (miConejo.tocoUnaFlor(miFlor[i][e])) {
          miFlor[i][e].morir();
          miHud.aumentar();
          contador++;
        }
      }
    }
    miHud.dibujar();
    miHud.estado();
    miConejo.mover();
    miConejo.dibujar();
    miAspiradora.dibujar();
    miHud.contador = derrota;
    if (contador == derrota ) {
      miJuego.perder();
    }
    if (contadorDeVictoria == 5) {
      miJuego.ganar(siguienteEstado);
    }
  }

  void movimiento() {
    disparo.trigger();
    if (miAspiradora.capturoAlConejo(miConejo)) {
      miConejo.restar();
      conejo.trigger();
      miHud.sumarProgreso();
      miConejo.respawn();
      contadorDeVictoria++;
      if (miJuego.estado == "jugarNivel3") {
        miConejo.tamanio =miConejo.tamanio-10;
        miConejo.alto =miConejo.alto-10;
      }
    }
  }
}