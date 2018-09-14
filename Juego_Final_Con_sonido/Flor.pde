class flor {
  float x,y,tamanio,alto;
  PImage imagen,flor;
  boolean vivo;

  flor(float x_, float y_, String florImage) {
    x = x_;
    y = y_;
    vivo = true;
    imagen = loadImage( florImage );
    tamanio = imagen.width;
    alto = imagen.height;
  }

  void dibujar() {
    pushStyle();
    if (vivo) {
      imageMode( CENTER );
      image( imagen, x, y );
      popStyle();
    }
  }

  void morir() {
    vivo = false;
    
  }


  void respawn() {
    vivo = true;
  }
}