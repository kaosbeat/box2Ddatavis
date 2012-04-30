// An uneven surface

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
Subshape testshape;

// An object to store information about the uneven surface
//Surface surface;

void setup() {
  size(300,500);
  smooth();
    // Initialize box2d physics and create the world
  controlsSetup ();

  box2d = new PBox2D(this);
  box2d.createWorld();
  // We are setting a custom gravity
  //box2d.setGravity(0, -20);

  // Create the empty list
  //particles = new ArrayList<Particle>();
  // Create the surface
  mapsvg = loadShape("gent.svg");
      testshape = new Subshape(mapsvg.getChild("muide"), 0,0);
      
  wijklijst = mapsvg.getChild("layer1").getChildren();
    
  surfaces = new ArrayList<Surface>();
    for (int i=0;i<wijklijst.length;i++) {
      color c = i ;
      surfaces.add(new Surface(wijklijst[i], 50,c));
      println("adding" +wijklijst[i].getName()+ "with color: " + c);
    }
  
  for (Surface s: surfaces) {
    s.populate();
  }

}

void draw() {


  // If the mouse is pressed, we make new particles
  if (mousePressed) {
    //float sz = random(2,6);
   // particles.add(new Particle(mouseX,mouseY,sz));
   //for (Particle p: particles)  {
      //destroyBody(p.body);
      //Particle p = particles.get(0);
      //particles.remove(0);
      //p.killBody();
      
     // (wl[i].contains(10,150));
      
    // p=null;
     
      //particles.get(0).killBody();
     //println(p);
     //println(p.body.killBody());
   // }
    
  }

  // We must always step through time!
  box2d.step();
  background(255);
  
  // Draw the surfaces and local particles
  for (Surface s: surfaces) {
      s.display();
      for (Particle p: s.particles) {
        p.display();
      }
     // println(s.particles);
  
  }
  // Draw all (global) particles
  //for (Particle p: particles) {
  //  p.display();
// }
  testshape.display();
  // Particles that leave the screen, we delete them
  // (note they have to be deleted from both the box2d world and our list
 // for (int i = particles.size()-1; i >= 0; i--) {
   // Particle p = particles.get(i);
    //if (p.done()) {
   //   particles.remove(i);
   // }
 // }

  // Just drawing the framerate to see how many particles it can handle
 // fill(0);
  text("framerate: " + (int)frameRate,12,16);
  fill(128);
  rect(10,140,10,10);
}

