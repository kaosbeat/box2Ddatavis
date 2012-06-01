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
  
  //calculate bbox
  this.bbox = boundingBox();
  }
  
  Vec2[] boundingBox(){
    float _x = 0;
    bigX = wijksvg.getVertexX(0);
    litX = bigX;
    float _y = 0;
    litY = wijksvg.getVertexY(0);
    bigY = litY;
    //println("CALCULATING BOUNDINGBOX");
    for (int i = 0; i < wijksvg.getVertexCount(); i++) {
      _x = wijksvg.getVertexX(i);
      _y = wijksvg.getVertexY(i);
      //println (_y);
      if (_x > bigX){bigX = _x;}
      if (_x < litX){litX = _x;}
      if (_y > bigY){bigY = _y;}
      if (_y < litY){litY = _y;}
    }
    //println("returning fancy vectorlists");
    //println(litY +","+ bigY);
    Vec2[] bbox = {new Vec2(litX, litY), new Vec2(bigX,bigY)};
    return bbox;
  }
  
  
  
  
  
  void display() {
    strokeWeight(2);
    fill(255,255,0,128);
    stroke(128);
    beginShape();
    for (int i = 0; i < wijksvg.getVertexCount(); i++) {
     vertex(x+wijksvg.getVertexX(i),y+wijksvg.getVertexY(i));  
    }
    endShape();


  }
  
  void populate(int year) {
    float x = (this.bbox[1].x - this.bbox[0].x)/2 +5 + this.bbox[0].x;
    float y = (this.bbox[1].y - this.bbox[0].y)/2 + this.bbox[0].y;
    particles = new ArrayList<Particle>();
    int index = Arrays.binarySearch(namemap, wijksvg.getName() );
    //System.out.println (index);
    
    println("populating "+  wijksvg.getName() + " " + x +"," + y + ", " + num2011[index]/20);

    for(int i=0;i<num2011[index]/20;i++) {
      particles.add(new Particle(x,y,3,c));
    } 
  }
  

}


