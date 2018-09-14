class aspiradora {
  float x,y;
  PImage mira;

  aspiradora(float x_, float y_) {
    x = x_;
    y = y_;
    mira = loadImage( "mira.png" );
  }

  void dibujar() {
    pushStyle();
    imageMode( CENTER );
    image( mira, x, y);
    popStyle();
  }

  boolean capturoAlConejo(Conejo cone) {
    boolean resultado = false;
    if (cone.vivo &&
      x>cone.x-cone.tamanio/2 && 
      x<cone.x+cone.tamanio/2 &&
      y>cone.y-cone.alto/2 &&
      y<cone.y+cone.alto/2) {
      resultado = true;
    }
    return resultado;
  }
}