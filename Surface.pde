// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// PBox2D example

// An uneven surface boundary

class Surface {
  // We'll keep track of all of the surface points

    ArrayList<Particle> particles;
    ArrayList<Vec2> surface;
    PShape wijksvg;
 
    PShape w;
    int particlenumber;

  Surface() {
    //mapsvg = loadShape("gent.svg");
   // wijksvg = mapsvg.getChild("blah");
//particles = new ArrayList<Particle>();
   //particles = 

   
  
  }
  
  Surface(PShape wijk, int particlenumber) {  

    
    //println("drawing "+mapsvg.getChildCount());
    //wijksvg = mapsvg.getChild(wijk);
    wijksvg = wijk;
    for (int i = 0;i < mapsvg.getChild("layer1").getChildCount();i++) {
     //println(wl[i].contains(10,150));
      
   
    }
   


   // wijksvg
    //wijksvg.scale(2.0);
    //redraw wijksvg as a fresh object
    //w = new PShape;
    
    
    //println(wijksvg.getWidth());
    surface = new ArrayList<Vec2>();
    
    // This is what box2d uses to put the surface in its world
    ChainShape chain = new ChainShape();
      for(int i=0; i < wijksvg.getVertexCount();i++) {
        surface.add(new Vec2(wijksvg.getVertexX(i),wijksvg.getVertexY(i)));
        //println("added one" +wijksvg.getVertexX(i));
       
      }

    
    
    // Build an array of vertices in Box2D coordinates
    // from the ArrayList we made
    Vec2[] vertices = new Vec2[surface.size()];
    for (int i = 0; i < vertices.length; i++) {
      Vec2 edge = box2d.coordPixelsToWorld(surface.get(i));
      vertices[i] = edge;
    }
    
    // Create the chain!
    chain.createChain(vertices,vertices.length);
    
    // The edge chain is now attached to a body via a fixture
    BodyDef bd = new BodyDef();
    bd.position.set(0.0f,0.0f);
    Body body = box2d.createBody(bd);
    // Shortcut, we could define a fixture if we
    // want to specify frictions, restitution, etc.
    body.createFixture(chain,1);

  }

  // A simple function to just draw the edge chain as a series of vertex points
  void display() {
    strokeWeight(2);
    stroke(0);
   // fill(145,125,3);
   // shape(wijksvg,0,0);
   
    beginShape();
     for (Vec2 v: surface) {
      vertex(v.x,v.y);
     }
   
    
    
    endShape();
  }
  
  void populate() {
    println("populating");
    particles = new ArrayList<Particle>();
    for(int i=0;i<50;i++) {
      particles.add(new Particle(170,10,4));
           
    } 
  }
  

}


