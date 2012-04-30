///removing copyright as that is about the only part standing in this code, based on Shiffmans box2D example

class Surface {
    ArrayList<Particle> particles;
    ArrayList<Vec2> surface;
    PShape wijksvg;
    PShape w;
    int particlenumber;
    color c;
    int year;
    color fillColor;
    color strokeColor;
    PShape svgChildNode;
    float x;
    float y;
    PShape shape;
    float bigX = 0;
    float bigY = 0;
    float litX = 0;
    float litY = 0;
    Vec2[] bbox;

  Surface() {
    //default Surface isn't very interesting, a bit superficial
    fillColor = color(255,0,255);
    strokeColor  = color(0,255,255);
    this.svgChildNode = svgChildNode;
    this.x = x;
    this.y = y;
    this.bbox = boundingBox();
  }
  
  Surface(PShape wijk, int particlenumber, color c) {
    this.c = color(random(255),random(255),random(255));
    wijksvg = wijk;
    surface = new ArrayList<Vec2>();
    year = year();
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
  
  Vec2[] boundingBox(){
    float _x = 0;
    float _y = 0;
    for (int i = 0; i < wijksvg.getVertexCount(); i++) {
      _x = wijksvg.getVertexX(i);
      _y = wijksvg.getVertexY(i);
      if (_x > bigX){bigX = _x;}
      if (_x < litX){litX = _x;}
      if (_y > bigY){bigY = _y;}
      if (_y < litY){litY = _y;}
    }
    //println("returning fancy vectorlists");
    Vec2[] bbox = {new Vec2(litX, litY), new Vec2(bigX-litX,bigY-litY)};
    return bbox;
  }
  
  
  
  
  
  void display() {
    strokeWeight(2);
    fill(255,255,0);
    stroke(128);
    beginShape();
    for (int i = 0; i < wijksvg.getVertexCount(); i++) {
     vertex(x+wijksvg.getVertexX(i),y+wijksvg.getVertexY(i));  
    }
    endShape();


  }
  
  void populate(int year) {
    println("populating");
    float xx = surface.get(surface.size()-1).x - surface.get(floor(surface.size()/2)).x;
    println(xx);
    float yy = surface.get(surface.size()-1).y - surface.get(floor(surface.size()/2)).y;
    println(yy);
    particles = new ArrayList<Particle>();
    for(int i=0;i<num1999[0]/10000;i++) {
      particles.add(new Particle(160,280,4));
           
    } 
  }
  

}


