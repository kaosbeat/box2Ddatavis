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

// An object to store information about the uneven surface
//Surface surface;

void setup() {
  size(300,500);
  smooth();
    // Initialize box2d physics and create the world
  box2d = new PBox2D(this);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, -20);

  // Create the empty list
  particles = new ArrayList<Particle>();
  // Create the surface
  mapsvg = loadShape("gent.svg");
  wijklijst = mapsvg.getChild("layer1").getChildren();
  println(wijklijst);
  
  
  surfaces = new ArrayList<Surface>();
  //add surfaces
    //surfaces.add(new Surface("meulestede", 50));
   // surfaces.add(new Surface("muide", 0));
   // surfaces.add(new Surface("voormuide", 0));
    //surfaces.add(new Surface("afrika",0));
    
    //for (PShape w: wijklijst) {
    for (int i=0;i<wijklijst.length;i++) {
      //int i = wijklijst.getChildIndex(w);
      //i = 5; 
      //println(o);
      color c = i ;

      //color c = color(112,145,10);
      surfaces.add(new Surface(wijklijst[i], 50,c));
      println("adding" +wijklijst[i].getName()+ "with color: " + c);
    }
  
  //preseed 
    
  for(int i=0;i<50;i++) {
    particles.add(new Particle(170,100,4));
    
  }
  
  
  for (Surface s: surfaces) {
    s.populate();
  }
  
  //geometry info on the ghentmap
  

}

void draw() {
  // If the mouse is pressed, we make new particles
  if (mousePressed) {
    //float sz = random(2,6);
   // particles.add(new Particle(mouseX,mouseY,sz));
   //for (Particle p: particles)  {
      println(particles.size());
      //destroyBody(p.body);
      Particle p = particles.get(0);
      particles.remove(0);
      p.killBody();
      
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
  for (Particle p: particles) {
    p.display();
  }
  
 

  // Particles that leave the screen, we delete them
  // (note they have to be deleted from both the box2d world and our list
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    //if (p.done()) {
   //   particles.remove(i);
   // }
  }

  // Just drawing the framerate to see how many particles it can handle
 // fill(0);
  text("framerate: " + (int)frameRate,12,16);
  fill(128);
  rect(10,140,10,10);
}

