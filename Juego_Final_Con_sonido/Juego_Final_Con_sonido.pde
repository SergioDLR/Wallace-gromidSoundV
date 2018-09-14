

import ddf.minim.*;

Minim minim;
AudioSample disparo;
AudioSample conejo;
AudioPlayer player;
AudioInput input;

Juego miJuego;


void setup() {
  size(800, 600);
  miJuego = new Juego();
  minim = new Minim(this);
  disparo = minim.loadSample("song.mp3");
  conejo = minim.loadSample("sonido.mp3");
  player = minim.loadFile(dataPath("cancion.mp3"));
  input = minim.getLineIn();
}

void draw() {
  miJuego.jugar();
  
}

void mousePressed() {
  miJuego.movimiento();
  
}

void keyPressed() {
  miJuego.teclado();
}


void stop() {
  
  disparo.stop();
  conejo.stop();
  super.stop();

}