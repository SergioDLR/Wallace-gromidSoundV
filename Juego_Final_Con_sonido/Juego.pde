class Juego {
  String estado;
  PImage inicio, fin, nivel3, ganar;
  niveles  miNiveles;

  Juego() {
    noCursor();
    estado = "presentacion";
    inicio = loadImage("inicio.jpg");
    fin = loadImage("fin.jpg");
    ganar = loadImage("ganar.jpg");
    miNiveles = new niveles();
  }

  void jugar() {
    player.play();
    println(estado);
    if (estado.equals( "presentacion" ) ) {
      pushStyle();
      imageMode( CORNER );
      image( inicio, 0, 0, width, height );
      popStyle();
    } else if ( estado.equals( "presentacion2" ) ) { 
      miNiveles.cargarNivel("conejo2.png", "flor.png", "nivel1.png", "jugarNivel1",1,"fondo.jpg",1);
    } else if ( estado.equals( "jugarNivel1" ) ) {
      miNiveles.nivel("ganarNivel1",8);
    } else if ( estado.equals( "ganarNivel1") ) {
      miNiveles.cargarNivel("conejo3.png", "flor3.png", "nivel2.png", "jugarNivel2",1,"fondo3.jpg",2);
    } else if ( estado.equals( "jugarNivel2" ) ) {
      miNiveles.nivel("ganarNivel2",6);
    } else if ( estado.equals( "ganarNivel2") ) {
      miNiveles.cargarNivel("conejo4.png", "flor4.png", "nivel3.png", "jugarNivel3",5,"fondo4.jpg",3);
    } else if ( estado.equals( "jugarNivel3")) {
      miNiveles.nivel("ganar",4);
    } else if ( estado.equals( "perder")) {
      background(fin);
    } else if ( estado.equals( "ganar")) {
      background(ganar);
    }
  }

  void movimiento() {
    miNiveles.movimiento();
  }

  void perder() {
    estado = "perder";
  }
  void ganar(String siguienteEstado) {
    estado = siguienteEstado;
  }


  void teclado() {
    if (estado.equals ("presentacion")) {
        if ( key == ' ' ) {
          estado = "presentacion2";
        } else if ( key == '2' ) {
          estado = "ganarNivel1";
        } else if ( key == '3' ) {
          estado = "ganarNivel2";
        }
      }
    
    if(estado.equals("ganar") || estado.equals("perder")){
    if( key == 'r'){
      estado ="presentacion";
    }
    }
  }
}