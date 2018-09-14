class Hud {
  float x, y;
  float x1, y1;
  PImage  progreso;
  int contador, cantidad;
  int contadorDeProgreso;

  Hud() {
    x = 700;
    y = 50;
    x1 =400;
    y1 =40;
    contador = 0;
    contadorDeProgreso=0;
    progreso = loadImage("nivelHud.png");
  }


  void dibujar() {
    pushStyle();
    textSize(24);
    fill(0);
    text("vidas :"+contador+"/"+cantidad, 650, 60);
    popStyle();
    println(contadorDeProgreso);
    pushStyle();
    imageMode( CENTER );
    image(progreso, x1, y1);
    popStyle();
  }

  void estado() {
    if (contadorDeProgreso == 0) {
      progreso = loadImage("nivelHud.png");
    }
    if (contadorDeProgreso == 1) {
      progreso = loadImage("nivelhud1.png");
    }
    if (contadorDeProgreso == 2) {
      progreso = loadImage("nivelhud2.png");
    }
    if (contadorDeProgreso == 3) {
      progreso = loadImage("nivelhud3.png");
    }
    if (contadorDeProgreso == 4) {
      progreso = loadImage("nivelhud4.png");
    }
    if (contadorDeProgreso == 5) {
      progreso = loadImage("nivelhud5.png");
    }
  }

  void aumentar() {
    cantidad ++;
  }


  void sumarProgreso() {
    contadorDeProgreso = contadorDeProgreso +1;
  }

  void reset() {
    cantidad = 0;
    contadorDeProgreso =0;
  }
}