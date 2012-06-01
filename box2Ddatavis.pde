import pbox2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.*;

// A reference to our box2d world
PBox2D box2d;

// An ArrayList of particles that will fall on the surface
ArrayList<Particle> particles;
ArrayList<Surface> surfaces;
PShape mapsvg;
PShape[] wijklijst;
color backgroundColor;

void setup() {
  size(300,500);
  backgroundColor = color(255);
  smooth();
    // Initialize box2d physics and create the world
  controlsSetup ();

  box2d = new PBox2D(this);
  box2d.createWorld();
  // We are setting a custom gravity
  //box2d.setGravity(0, -20);

  mapsvg = loadShape("gent.svg");
  wijklijst = mapsvg.getChild("layer1").getChildren();
  surfaces = new ArrayList<Surface>();
    for (int i=0;i<wijklijst.length;i++) {
      color c = i ;
      surfaces.add(new Surface(wijklijst[i], 50,c));
     // println("adding" +wijklijst[i].getName()+ "with color: " + c);
    }
  
  for (Surface s: surfaces) {
    s.populate(year());
  }

}

void draw() {

  // If the mouse is pressed, we make new particles
  /*
  if (mousePressed) {
    //float sz = random(2,6);
   // particles.add(new Particle(mouseX,mouseY,sz));
     for (Surface s: surfaces)  {
      if( s.particles.size() > 0 ){
        //Particle p = s.particles.get(0);
        //s.particles.remove(0);
        //p.killBody();
        for (Particle p: s.particles){
          p.r++;
          Vec2 pos = box2d.getBodyPixelCoord(p.body);
          p.killBody();
          p.makeBody(pos.x,pos.y,p.r);
         
        
        }
      }
     }
     // (wl[i].contains(10,150));
      
    // p=null;
     
      //particles.get(0).killBody();
     //println(p);
     //println(p.body.killBody());
   // }
    
  }
  */
  // We must always step through time!
  box2d.step();
  background(backgroundColor);
  
  // Draw the surfaces and local particles
  for (Surface s: surfaces) {
      s.display();
      pushMatrix();
      float Sx = (s.bbox[1].x - s.bbox[0].x);
      float Sy = (s.bbox[1].y - s.bbox[0].y);
      fill(255,0,0,128);
      //println (Sy);

      //rect(s.bbox[0].x,s.bbox[0].y,Sx,Sy);
      popMatrix();
      for (Particle p: s.particles) {
        p.display();
        
      }
//      for (int i = s.particles.size()-1; i >= 0; i--) {
//        Particle p = s.particles.get(i);
//        
//        
//       }
      
      //println(s.particles);
      
      
  
  }

  // Particles that leave the screen, we delete them
  // (note they have to be deleted from both the box2d world and our list
   

  // Just drawing the framerate to see how many particles it can handle
 // fill(0);
  text("framerate: " + (int)frameRate,12,16);
  //fill(128);
  //rect(10,140,10,10);
}


void kids(boolean kidstoggle) {
  if(kidstoggle==true) {
  // backgroundColor = color(255);
    for (Surface s: surfaces)  {
      if( s.particles.size() > 0 ){
        //Particle p = s.particles.get(0);
        //s.particles.remove(0);
        //p.killBody();
        for (Particle p: s.particles){
          p.r = 5;
          Vec2 pos = box2d.getBodyPixelCoord(p.body);
          p.killBody();
          p.makeBody(pos.x,pos.y,p.r);
         
        
        }
      }
     }
   
  } else {
   //backgroundColor = color(0);
       for (Surface s: surfaces)  {
      if( s.particles.size() > 0 ){
        //Particle p = s.particles.get(0);
        //s.particles.remove(0);
        //p.killBody();
        for (Particle p: s.particles){
          p.r = 3;
          Vec2 pos = box2d.getBodyPixelCoord(p.body);
          p.killBody();
          p.makeBody(pos.x,pos.y,p.r);
         
        
        }
      }
     }
  }
  println("a toggle event.");
}
