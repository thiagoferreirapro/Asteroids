//======================== PROJETO ASTEROIDS =========================

nave jogador;
ArrayList<Bala> balas = new ArrayList<Bala>(); 

/////////////////////////////////////////////////////////////////imagens
PImage name, bg1, bg2, nave, bala, score, enter, alvo, alvo2, alvo3, 
  alvo4, alvo5, alvo6, alvo7, alvo8, alvo9, alvo10, gameover, youwin, 
  yscore, cursor, life, barradevida, time, barratempo, alertacolisao, efeitointro;
//////////////////////////////////////////////////////////////////posição
float x =  420; 
float y =  480; 
float x1 = 400; 
float y1 = 280;
float x2 = 100; 
float y2 = 0;
float x3 = 650; 
float y3 = 33;
float x4 = 450; 
float y4 = 600;
float x5 = 800; 
float y5 = 700;
float x6 = 70;  
float y6 = 500;
float x7 = 0; 
float y7 = 500;
float x8 = 400; 
float y8 = 0;
float x9 = 0; 
float y9 = 500;
float x10 = 800; 
float y10 = 0;
float x11 = 0; 
float y11 = 200;
float x12 = 0; 
float y12 = 260;
float x13 = 250; 
float y13 = 0;
float x14 = 700; 
float y14 = 600;
float x15 = 0; 
float y15 = 550;
float x16 = 800; 
float y16 = 0;
float x17 = 0; 
float y17 = 0;
float x18 = 800; 
float y18 = 0;
float x19 = 200; 
float y19 = 0;
float x20 = 800; 
float y20 = 550;
float x21 = 270; 
float y21 = 0;
float x22 = 0; 
float y22 = 600;
float x23 = 700; 
float y23 = 0;
float x24 = 800; 
float y24 = 300;
float x25 = 0; 
float y25= 550;
float x26 = 0; 
float y26=  30;
float x27 = 800; 
float y27=  400;
float x28 = 300; 
float y28=  550;
/////////////////////////////////////////////////////////////////
float xk =50;       // score
float xz =90;      // text
float xa = 36;    // life
float xd = 118;  // barradevida
float xs = 97;  // rect life
float xx = 70; // rect life
float t = 691;  // rect time
float r = 97;  // rect time
float mov = 0; 
float pi = 0;
float l = 650; // time
float k = 739; // barra de tempo
float xc = 1000; // ellipse de efeito 
float yc = 1000; // ellipse de efeito
float yv = 0; // you win 
float yn = 0; // game over
int pontos;
PFont f;
boolean colidiu = false;
boolean ganhou = false;
boolean perdeu = false;
boolean iniciou = false;
boolean play = false;
import processing.sound.*;
SoundFile tiro, impacto, ambiencia, win, lose, alerta, intro, start;

void setup() {
  size(800, 550);          
  nave =  loadImage    ("nave3.png"); // nave 4 e 3
  bg1 =   loadImage   ("bg.png");
  bg2 =   loadImage   ("bg2.png");
  name =  loadImage    ("asteroids2.0.png");
  bala =  loadImage    ("bala1.png");
  score = loadImage    ("score.png");
  enter = loadImage    ("enter.png");
  alvo =  loadImage    ("alvo.png");
  alvo2 = loadImage    ("alvo2.png");
  alvo3 = loadImage    ("alvo3.png");
  alvo4 = loadImage    ("alvo5.png");
  alvo5 = loadImage    ("alvo3.png");
  alvo6 = loadImage    ("alvo6.png");
  alvo7 = loadImage    ("alvo8.png");
  alvo8 = loadImage    ("alvo4.png");
  alvo9 = loadImage    ("alvo9.png");
  gameover = loadImage ("Gameover.png");
  youwin = loadImage   ("youwin.png");
  yscore = loadImage   ("yourscore.png");
  cursor = loadImage   ("cursor.png");
  life = loadImage     ("life.png");
  barradevida = loadImage("barradevida.png");
  barratempo = loadImage("barradevida.png");
  time = loadImage("time.png");
  alertacolisao = loadImage("alertacolisao.png");
  efeitointro = loadImage("efeitointro.png");
  jogador = new nave(width/2, height/2, 25, 3);
  frameRate(60);
  f = createFont("Square721 Cn BT Roman", 23);
  textFont(f);
  noCursor();

  tiro = new SoundFile(this, "blaster.mp3");
  impacto = new SoundFile(this, "impacto.mp3");
  ambiencia = new SoundFile(this, "ambiencia.mp3");
  win = new SoundFile(this, "win.mp3");
  lose = new SoundFile(this, "lose.mp3");
  alerta = new SoundFile(this, "alerta.mp3");
  intro = new SoundFile(this, "intro.mp3");
  start = new SoundFile(this, "start.mp3");
}
void draw() {
  if (y1 <= 400) {
    if (!iniciou) {
      iniciou = true;
      intro.play();
      intro.amp(1);
    }
  }
  background(bg1);
  imageMode(CENTER);
  image(name, x1, y1);
  image(enter, x, y);
  image(efeitointro, 400, 275, xc, yc);
  xc -= 11;
  yc -= 11;
  if (xc < 0) {
    xc = 0;
    yc = 0;
  }
  for (int i = 0; i< balas.size(); i++) {
    balas.get(i).atualizar();
    balas.get(i).mostrar();
  } 
  jogador.mostrar();
  jogador.atualizar();
  /////////////////////////////////////////// movimentação dos alvos
  if (y1 >= 400) {
    intro.stop();
    cursor(cursor);
    fill(255);
    text("00" + pontos, xz, 35);
    image(time, l, 32);
    image(score, xk, 26);
    image(life, xa, 60);

    fill(#19FF05);
    strokeWeight(0);
    rect(xx, 48, xs, 19);
    image(barradevida, xd, 57);

    fill(#FF1A1A);
    strokeWeight(0);
    rect(t, 20, r, 19.5);
    image (barratempo, k, 29);

    r -= 0.053;
    x2 += 0.5;
    y2 += 1;
    x6 += 1;
    y6 -= 1;
    image(alvo, x2, y2);
    image(alvo4, x6, y6); 
    if (xs <= 72.75) {
      fill(#FAEE05);
      strokeWeight(0);
      rect(xx, 47, xs, 20);
    }
    if (xs <= 50) {
      fill(#F77C07);
      strokeWeight(0);
      rect(xx, 47, xs, 20);
    }
    if (xs <= 30) {
      fill(#F70707);
      strokeWeight(0);
      rect(xx, 47, xs, 20);
    }
  }
  if (x2 >= 160) {
    x3 --;
    y3 ++;
    image(alvo2, x3, y3);
  }
  if (y3 >= 800) {
    x4 += 1;
    y4 -= 1;
    image(alvo3, x4, y4);
  }
  if (y4 >= 800) {
    y5 -= 1;
    x5 -= 1;
    image(alvo5, x5, y5);
  }
  if (y5 >= 800) {
    y7 -= 1;
    x7 += 1;
    image(alvo6, x7, y7);
  }
  if (y4 >= 700) {
    y8 +=1;
    x8 +=1;
    image(alvo7, x8, y8);
  }
  if (y4 >= 900) {
    x9 += 1;
    y9 -= 1;
    image(alvo8, x9, y9);
  }
  if (y9 >= 900) {
    x10 -= 1;
    y10 += 1;
    image(alvo9, x10, y10);
  }
  if (y9 >= 900) {
    x11 += 1;
    y11 += 1;
    image(alvo, x11, y11);
  }
  ///////
  if (y11 >= 700) {
    x12 += 1;
    image(alvo, x12, y12);
  }
  if (y12 >= 800) {
    y13 += 1;
    x13 +=1;
    image(alvo4, x13, y13);
  }
  if (y13 >= 800) {
    y14 -= 1;
    x14 -=1;
    image(alvo2, x14, y14);
  }
  if (y14 >= 1000) {
    y15 -= 1;
    x15 +=1;
    image(alvo5, x15, y15);
  }
  if (y15 >= 1000) {
    y16 += 1;
    x16 -=1;
    image(alvo3, x16, y16);
  }
  if (y16 >= 900) {
    y17 += 1.5;
    x17 += 1.5;
    image(alvo6, x17, y17);
  }
  if (y17 >= 900) {
    y18 += 2;
    x18 -=2;
    image(alvo, x18, y18);
  }
  if (y18 >= 700) {
    y19 += 1;
    x19 +=1;
    image(alvo7, x19, y19);
  }
  if (y19 >= 700) {
    y20 -= 1;
    x20 -=1;
    image(alvo2, x20, y20);
  }
  if (y20 >= 700) {
    y21 += 1;
    x21 +=1;
    image(alvo5, x21, y21);
  }
  if (y21 >= 700) {
    x22 += 1;
    y22  -=1;
    image(alvo, x22, y22);
  }
  if (y22 >= 700) {
    y23 += 1;
    image(alvo3, x23, y23);
  }
  if (y23 >= 500) {
    x24 += 1;
    y24 += 1;
    image(alvo8, x24, y24);
  }
  if (y24 >= 500) {
    y25 -= 1;
    x25 += 1;    
    image(alvo4, x25, y25);
  }
if (y21 >= 700) {
    x26 += 1;
    y26 +=1;
    image(alvo8, x26, y26);
  }
if (y23 >= 700) {
    x27 -= 1;
    image(alvo2, x27, y27);
  }
if (y24 >= 550) {
    x28 -= 1;
    image(alvo6, x28, y28);
  }
}
/////////////////////////////////////colisão

class nave {
  int x;
  int y;
  int taman;
  int vel;
  boolean up, down, left, right;

  nave(int posX, int posY, int tamanho, int velocidade) {
    x = 380;
    y = 300;
    taman = tamanho;
    vel = velocidade;
  }

  void mostrar() {
    if (y1 >= 400) {
      pushMatrix();
      translate(x, y);
      rotate(atan2(mouseY-y, mouseX-x));
      image(nave, +taman/2, 4, 50, 50); 
      popMatrix();
    }
    /////////////////////////////////////// YOUWIN
    if (r <= 1) {
      r = 0;
      if (pontos >= 100) {
        background(bg1);
        image(youwin, 400, yv);
        yv += 1.2;
        if (yv >= 280) {
          yv = 280;
        }
        xk += 10000;
        xz += 10000;
        xs += 10000;
        xd += 10000;
        xa += 10000;
        xx += 10000;    
        taman+=10000;
        l += 10000;
        k += 10000;
        if (yv == 280) {
          image(yscore, 315, 450);
          fill(#FFFFFF);      
          textSize(37);
          text(" 00000" + pontos, 437, 443);
        }
        tiro.stop();
        ambiencia.stop();  
        impacto.stop();
        if (!ganhou) {
          ganhou = true;
          win.play();
          win.amp(1);
        }
      }
    }
    ////////////////////////////////////// redução de vida
    if (pp_collision(nave, x, y, alvo, x2, y2)     || pp_collision(nave, x, y, alvo2, x3, y3) 
      || pp_collision(nave, x, y, alvo3, x4, y4)   || pp_collision(nave, x, y, alvo4, x5, y5) 
      || pp_collision(nave, x, y, alvo5, x6, y6)   || pp_collision(nave, x, y, alvo6, x7, y7) 
      || pp_collision(nave, x, y, alvo7, x8, y8)   || pp_collision(nave, x, y, alvo8, x9, y9)
      || pp_collision(nave, x, y, alvo8, x10, y10) || pp_collision(nave, x, y, alvo, x11, y11) 
      || pp_collision(nave, x, y, alvo, x12, y12)  || pp_collision(nave, x, y, alvo4, x13, y13)
      || pp_collision(nave, x, y, alvo2, x14, y14) || pp_collision(nave, x, y, alvo5, x15, y15)
      || pp_collision(nave, x, y, alvo3, x16, y16) || pp_collision(nave, x, y, alvo6, x17, y17)
      || pp_collision(nave, x, y, alvo, x18, y18)  || pp_collision(nave, x, y, alvo7, x19, y19)
      || pp_collision(nave, x, y, alvo2, x20, y20) || pp_collision(nave, x, y, alvo5, x21, y21) 
      || pp_collision(nave, x, y, alvo, x22, y22)  || pp_collision(nave, x, y, alvo3, x23, y23)
      || pp_collision(nave, x, y, alvo8, x24, y24) || pp_collision(nave, x, y, alvo4, x25, y25)
      || pp_collision(nave, x, y, alvo8, x26, y26) || pp_collision(nave, x, y, alvo2, x27, y27)
      || pp_collision(nave, x, y, alvo6, x28, y28)) {
      if (!colidiu) {
        colidiu = true;
        alerta.play();
        alerta.amp(0.1);
      } 
      xs -=1.1;
      image(alertacolisao, 400, 140);
    } else { 
      colidiu = false;
    }

    //////////////////////////////////////////GAME OVER
    if (r <= 1) {
      r = 0;
      if (pontos <= 95) {
        background(bg1);
        image(gameover, 380, yn);
        yn += 1.5;
        if (yn >= 280) {
          yn = 280;
        }
        xk += 10000;
        xz += 10000;
        xd += 10000;
        xa += 10000;
        xx += 10000;   
        taman+=1000;
        l += 10000;
        k += 10000;        
        if (yn == 280) {
          image(yscore, 315, 450);
          fill(#FFFFFF);      
          textSize(37);
          text(" 00000" + pontos, 437, 443);
        }
        tiro.stop();
        ambiencia.stop();  
        impacto.stop();
        if (!perdeu) {
          perdeu = true;
          lose.play();
          lose.amp(1);
        }
      }
    }
    if (xs <= 1) {
      xs = 0;
      r = 0; 
      background(bg1);
      image(gameover, 380, yn);
      yn += 1.5;
      if (yn >= 280) {
        yn = 280;
      }
      xk += 10000;
      xz += 10000;
      xd += 10000;
      xa += 10000;
      xx += 10000;   
      taman+=1000;        
      l += 10000;
      k += 10000; 
      if (yn == 280) {
        image(yscore, 315, 450);
        fill(#FFFFFF);      
        textSize(37);
        text(" 00000" + pontos, 437, 443);
      }
      tiro.stop();
      ambiencia.stop();  
      impacto.stop();
      if (!perdeu) {
        perdeu = true;
        lose.play();
        lose.amp(2);
      }
    }

    ////////////////////////////////////// limitar nave
    if (x >= 770) { 
      x = 770;
    } else {  
      if (x <= 20) { 
        x = 20;
      }
    }
    if (y >= 530) {
      y = 530;
    } else {
      if (y <= 20) {
        y = 20;
      }
    }
  }
  void atualizar() {
    if (up) {
      y-=vel;
    }
    if (down) {
      y+=vel;
    }
    if (left) {
      x-=vel;
    }
    if (right) {
      x+=vel;
    }
  }
}
class Bala {
  int x, y, vel;
  float ang;
  Bala(int posX, int posY, int velocidade, float angulo) {
    x = posX;
    y = posY;
    vel = velocidade;
    ang = angulo;
  }
  void mostrar() {
    if (y1 >=400) {
      background(bg2);
      image(bala, x, y);
    }
    ////////////////////////////////////////////// colisão
    if (pp_collision(bala, x, y, alvo, x2, y2)) {
      y2 +=10000;
      x+=10000;
      image(alvo, x2, y2);
      image(bala, x, y);
      pontos+=5;
      impacto.play(3.5);
    }
    if (pp_collision(bala, x, y, alvo2, x3, y3)) {
      y3 +=10000;  
      x+=10000;
      image(alvo2, x3, y3);
      image(bala, x, y);
      pontos+=5;
      impacto.play(3.5);
    }
    if (pp_collision(bala, x, y, alvo3, x4, y4)) {
      y4 +=10000; 
      x+=10000;
      image(alvo3, x4, y4);
      image(bala, x, y);
      pontos+=5;
      impacto.play(3.5);
    }
    if (pp_collision(bala, x, y, alvo5, x5, y5)) {
      y5 +=10000; 
      x+=10000;
      image(alvo5, x5, y5);
      image(bala, x, y);
      pontos+=5;
      impacto.play(3.5);
    }
    if (pp_collision(bala, x, y, alvo4, x6, y6)) {
      y6 +=10000; 
      x+=10000;
      image(alvo4, x6, y6);
      image(bala, x, y);
      pontos+=5;
      impacto.play(3.5);
    }
    if (pp_collision(bala, x, y, alvo6, x7, y7)) {
      y7 +=10000; 
      x+=10000;
      image(alvo6, x7, y7);
      image(bala, x, y);
      pontos+=5;
      impacto.play(3.5);
    }
    if (pp_collision(bala, x, y, alvo7, x8, y8)) {
      y8 +=10000; 
      x+=10000;
      image(alvo7, x8, y8);
      image(bala, x, y);
      pontos+=5;
      impacto.play(3.5);
    }
    if (pp_collision(bala, x, y, alvo8, x9, y9)) {
      y9 +=10000; 
      x+=10000;
      image(alvo8, x9, y9);
      image(bala, x, y);
      pontos+=15;
      impacto.play(3.5);
    }
    if (pp_collision(bala, x, y, alvo9, x10, y10)) {
      y10 +=10000; 
      x+=10000;
      image(alvo9, x10, y10);
      image(bala, x, y);
      pontos+=15;
      impacto.play(3.5);
    }
    if (pp_collision(bala, x, y, alvo, x11, y11)) {
      y11 +=10000; 
      x+=10000;
      image(alvo, x11, y11);
      image(bala, x, y);
      pontos+= 5;
      impacto.play(3.5);
    }
    if (pp_collision(bala, x, y, alvo, x12, y12)) {
      y12 +=10000; 
      x+=10000;
      image(alvo, x12, y12);
      image(bala, x, y);
      pontos+= 5;
      impacto.play(3.5);
    }  
    if (pp_collision(bala, x, y, alvo4, x13, y13)) {
      y13 +=10000; 
      x+=10000;
      image(alvo4, x13, y13);
      image(bala, x, y);
      pontos+= 5;
      impacto.play(3.5);
    }
    if (pp_collision(bala, x, y, alvo2, x14, y14)) {
      y14 +=10000; 
      x+=10000;
      image(alvo2, x14, y14);
      image(bala, x, y);
      pontos+= 5;
      impacto.play(3.5);
    }
    if (pp_collision(bala, x, y, alvo5, x15, y15)) {
      y15 +=10000; 
      x+=10000;
      image(alvo5, x15, y15);
      image(bala, x, y);
      pontos+= 5;
      impacto.play(3.5);
    }
    if (pp_collision(bala, x, y, alvo3, x16, y16)) {
      y16 +=10000; 
      x+=10000;
      image(alvo3, x16, y16);
      image(bala, x, y);
      pontos+= 5;
      impacto.play(3.5);
    }
    if (pp_collision(bala, x, y, alvo6, x17, y17)) {
      y17 +=10000; 
      x+=10000;
      image(alvo6, x17, y17);
      image(bala, x, y);
      pontos+= 5;
      impacto.play(3.5);
    }
    if (pp_collision(bala, x, y, alvo, x18, y18)) {
      y18 +=10000; 
      x+=10000;
      image(alvo, x18, y18);
      image(bala, x, y);
      pontos+= 5;
      impacto.play(3.5);
    }
    if (pp_collision(bala, x, y, alvo, x19, y19)) {
      y19 +=10000; 
      x+=10000;
      image(alvo7, x19, y19);
      image(bala, x, y);
      pontos+= 5;
      impacto.play(3.5);
    }
    if (pp_collision(bala, x, y, alvo, x20, y20)) {
      y20 +=10000; 
      x+=10000;
      image(alvo2, x20, y20);
      image(bala, x, y);
      pontos+= 5;
      impacto.play(3.5);
    }
    if (pp_collision(bala, x, y, alvo5, x21, y21)) {
      y21 +=10000; 
      x+=10000;
      image(alvo5, x21, y21);
      image(bala, x, y);
      pontos+= 5;
      impacto.play(3.5);
    }
    if (pp_collision(bala, x, y, alvo, x22, y22)) {
      y22 +=10000; 
      x+=10000;
      image(alvo, x22, y22);
      image(bala, x, y);
      pontos+= 5;
      impacto.play(3.5);
    }
    if (pp_collision(bala, x, y, alvo3, x23, y23)) {
      y23 +=10000; 
      x+=10000;
      image(alvo3, x23, y23);
      image(bala, x, y);
      pontos+= 5;
      impacto.play(3.5);
    }
    if (pp_collision(bala, x, y, alvo8, x24, y24)) {
      y24 +=10000; 
      x+=10000;
      image(alvo3, x24, y24);
      image(bala, x, y);
      pontos+= 5;
      impacto.play(3.5);
    }  
    if (pp_collision(bala, x, y, alvo4, x25, y25)) {
      y25 +=10000; 
      x+=10000;
      image(alvo, x25, y25);
      image(bala, x, y);
      pontos+= 5;
      impacto.play(3.5);
    }  
if (pp_collision(bala, x, y, alvo8, x26, y26)) {
      y26 +=10000; 
      x+=10000;
      image(alvo8, x26, y26);
      image(bala, x, y);
      pontos+= 5;
      impacto.play(3.5);
    }  
if (pp_collision(bala, x, y, alvo2, x27, y27)) {
      y27 +=10000; 
      x+=10000;
      image(alvo2, x27, y27);
      image(bala, x, y);
      pontos+= 5;
      impacto.play(3.5);
    }
if (pp_collision(bala, x, y, alvo6, x28, y28)) {
      y28 +=10000; 
      x+=10000;
      image(alvo6, x28, y28);
      image(bala, x, y);
      pontos+= 5;
      impacto.play(3.5);
    }
}
  void atualizar() {
    x+=vel*cos(ang);
    y+=vel*sin(ang);
  }
}
void mousePressed() {
  balas.add(new Bala(jogador.x+int((jogador.taman/1.4)*cos(atan2(mouseY-jogador.y, mouseX-jogador.x))) 
    , jogador.y+int((jogador.taman/1.4)*sin(atan2(mouseY-jogador.y, mouseX-jogador.x))) 
    , 15, atan2(mouseY-jogador.y, mouseX-jogador.x))); 
  tiro.play();
  if ( y1 < 400) {
    tiro.stop();
  }
}
/////////////////////////////////// comandos de direção 

void keyPressed() {  
  if (key == 'w' || key == 'W') {
    jogador.up = true;
  }
  if (key == 's' || key == 'S') {
    jogador.down = true;
  }
  if (key == 'a' || key == 'A') {
    jogador.left = true;
  }
  if (key == 'd' || key == 'D') {
    jogador.right = true;
  }
  if (key == ENTER) {
    y1+=400;
    y+=400;
    image(name, x1, y1);
    image(enter, x, y);
    ambiencia.play();
    ambiencia.amp(1);
    if (!play) {
      play = true;
      start.play(0.7);
    } else {
      play = false;
    }
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    jogador.up = false;
  }
  if (key == 's' || key == 'S') {
    jogador.down = false;
  }
  if (key == 'a' || key == 'A') {
    jogador.left = false;
  }
  if (key == 'd' || key == 'D') {
    jogador.right = false;
  }
}


final int ALPHALEVEL = 20;

boolean pp_collision(PImage imgA, float aix, float aiy, PImage imgB, float bix, float biy) {
  int topA, botA, leftA, rightA;
  int topB, botB, leftB, rightB;
  int topO, botO, leftO, rightO;
  int ax, ay;
  int bx, by;
  int APx, APy, ASx, ASy;
  int BPx, BPy; //, BSx, BSy;

  topA   = (int) aiy;
  botA   = (int) aiy + imgA.height;
  leftA  = (int) aix;
  rightA = (int) aix + imgA.width;
  topB   = (int) biy;
  botB   = (int) biy + imgB.height;
  leftB  = (int) bix;
  rightB = (int) bix + imgB.width;

  if (botA <= topB  || botB <= topA || rightA <= leftB || rightB <= leftA)
    return false;


  leftO = (leftA < leftB) ? leftB : leftA;
  rightO = (rightA > rightB) ? rightB : rightA;
  botO = (botA > botB) ? botB : botA;
  topO = (topA < topB) ? topB : topA;

  APx = leftO-leftA;   
  APy = topO-topA;
  ASx = rightO-leftA;  
  ASy = botO-topA-1;
  BPx = leftO-leftB;   
  BPy = topO-topB;

  int widthO = rightO - leftO;
  boolean foundCollision = false;

  imgA.loadPixels();
  imgB.loadPixels();


  int surfaceWidthA = imgA.width;
  int surfaceWidthB = imgB.width;

  boolean pixelAtransparent = true;
  boolean pixelBtransparent = true;

  // Get start pixel positions
  int pA = (APy * surfaceWidthA) + APx;
  int pB = (BPy * surfaceWidthB) + BPx;

  ax = APx; 
  ay = APy;
  bx = BPx; 
  by = BPy;
  for (ay = APy; ay < ASy; ay++) {
    bx = BPx;
    for (ax = APx; ax < ASx; ax++) {
      pixelAtransparent = alpha(imgA.pixels[pA]) < ALPHALEVEL;
      pixelBtransparent = alpha(imgB.pixels[pB]) < ALPHALEVEL;

      if (!pixelAtransparent && !pixelBtransparent) {
        foundCollision = true;
        break;
      }
      pA ++;
      pB ++;
      bx++;
    }
    if (foundCollision) break;
    pA = pA + surfaceWidthA - widthO;
    pB = pB + surfaceWidthB - widthO;
    by++;
  }
  return foundCollision;
}
