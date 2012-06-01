import controlP5.*;
ControlP5 controlP5;
CheckBox checkbox;
Toggle kids;



void controlsSetup(){
  controlP5 = new ControlP5(this);
  checkbox = controlP5.addCheckBox("checkBox",260,20); 
  kids = controlP5.addToggle("kids",false,250,160,10,10);
  kids.setColorLabel(color(128));

  // make adjustments to the layout of a checkbox.
  checkbox.setColorBackground(color(10));
  checkbox.setColorForeground(color(120));
  checkbox.setColorActive(color(255,25,20));
  checkbox.setItemsPerRow(1);
  checkbox.setSpacingColumn(30);
  checkbox.setSpacingRow(10);
  // add items to a checkbox.
  checkbox.addItem("2008",2);
  checkbox.addItem("2009",10);
  checkbox.addItem("2010",50);
  checkbox.addItem("2011",100);
  checkbox.addItem("2012",200);
}


void controlEvent(ControlEvent theEvent) {
  if(theEvent.isGroup()) {
    print("got an event from "+theEvent.group().name()+"\t");
    // checkbox uses arrayValue to store the state of 
    // individual checkbox-items. usage:
    for(int i=0;i<theEvent.group().arrayValue().length;i++) {
      int n = (int)theEvent.group().arrayValue()[i];
      print(n);
      if(n==1) {
        println(((RadioButton)theEvent.group()).getItem(i).internalValue());
      }
    }
    println();
  }
}

