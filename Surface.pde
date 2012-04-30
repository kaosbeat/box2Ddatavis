///removing copyright as that is about the only part standing in this code, based on Shiffmans box2D example

class Surface {
    ArrayList<Particle> particles;
    ArrayList<Vec2> surface;
    PShape wijksvg;
    PShape w;
    int particlenumber;
    color c; 

  Surface() {
    //default Surface isn't very interesting, a bit superficial
    
  }
  
  Surface(PShape wijk, int particlenumber, color c) {
    this.c = color(random(255),random(255),random(255));

    wijksvg = wijk;
    for (int i = 0;i < mapsvg.getChild("layer1").getChildCount();i++) {
     //println(wl[i].contains(10,150));
    }
   surface = new ArrayList<Vec2>();
   // This is what box2d uses to put the surface in its world
   ChainShape chain = new ChainShape();
   for(int i=0; i < wijksvg.getVertexCount();i++) {
     surface.add(new Vec2(wijksvg.getVertexX(i),wijksvg.getVertexY(i)));
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
  
  void display() {
    strokeWeight(2);
    //stroke(0);
    
    fill(c);
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


