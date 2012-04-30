///redraws svgchild as processing Object with easier controls then SVG objects
class Subshape {
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
  
  Subshape() {
    fillColor = color(255,0,255);
    strokeColor  = color(0,255,255);
  }
  
  Subshape(PShape svgChildNode, float x, float y) {
    this.svgChildNode = svgChildNode;
    this.x = x;
    this.y = y;
    this.bbox = boundingBox();
    
  }
  
  Vec2[] boundingBox(){
    float _x = 0;
    float _y = 0;
    for (int i = 0; i < svgChildNode.getVertexCount(); i++) {
      _x = svgChildNode.getVertexX(i);
      _y = svgChildNode.getVertexY(i);
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
    fill(255,255,0);
    stroke(128);
    beginShape();
    for (int i = 0; i < svgChildNode.getVertexCount(); i++) {
     vertex(x+svgChildNode.getVertexX(i),y+svgChildNode.getVertexY(i));  
    }
    endShape();
  }
}
