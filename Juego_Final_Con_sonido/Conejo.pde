class Conejo {
  float vel, x, y,tamanio,alto,vel2,limiteX,limiteY,direccion,direcciony,hp;
  PImage Image;
  boolean vivo;
  int respawn;

  Conejo(float x_, float y_, String conejoImage,float hp_,float velocidad) {
    x = x_;
    y = y_;
    hp = hp_;
    Image = loadImage( conejoImage );
    tamanio = Image.width;
    alto = Image.height;
    vel = random(1, 2)+velocidad;
    vel2 = random(1, 3)+velocidad;
    vivo = true;
    limiteX = 750;
    limiteY = 550;
    direccion = 1;
    direcciony = 1;
  }

  void mover() { 
    x=x + vel*direccion;
    y = y +vel2*direcciony;
    if (x>limiteX) {
      direccion = -1;
    }
    if (y>limiteY) {
      direcciony = -1;
    }
    if (x<25) {
      direccion = 1;
    }
    if (y<110) {
      direcciony = 1;
    }

  }

  void dibujar() {
    if (vivo) {
      pushStyle();
      imageMode( CENTER );
      image( Image, x, y,tamanio,alto);
      popStyle();
    }
  }

  void morir() {
    if (hp == 0) {
      vivo = false;
    }
  }
  
  void restar(){
  hp--;
  }

  void respawn() {
    if (hp == 0) {
      respawn = round(random(1,4));
      hp = 1;
      vivo = true;
      if(respawn ==1){
      x=-10;
      y =random(0, 600);
      }
      if(respawn ==2){
      x=820;
      y =random(0, 600);
      }
      if(respawn == 3){
      x = random(0,800);
      y =-10;
      }
      if(respawn == 4){
      x = random(0,800);
      y =620;
      }
      vel = random(1, 3);
    }
  }
 

  boolean tocoUnaFlor(flor lasFlores) {
    boolean resultado = false;

    if ( (vivo)&&
      lasFlores.vivo &&
      x>lasFlores.x-lasFlores.tamanio/2 && 
      x<lasFlores.x+lasFlores.tamanio/2 &&
      y>lasFlores.y-lasFlores.alto/2 &&
      y<lasFlores.y+lasFlores.alto/2 ) {

      resultado = true;
    }
    return resultado;
  }
}