import controlP5.*;
ControlP5 controlP5;
int kidsImportance;      
int spaceImportance;
Toggle kids;




void controlsSetup(){
  controlP5 = new ControlP5(this);
  kids = controlP5.addToggle("kids",false,250,160,10,10);
  kids.setColorLabel(color(128));
  controlP5.addSlider("spaceImportance",0,100,180,10,50,10);
  controlP5.addSlider("kidsImportance",0,100,180,25,50,10);


}



