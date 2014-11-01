part of viltage;

class VilTAGEConfig {
  int width = 20;
  int height = 20;
  int updatePS = 15;
  int fontSize = 14;
  double offX, offY;
  int canvasWidth = 300;
  int canvasHeight = 300;
    
  double lineHeight = 1.0;
  String backgroundColor = "#FFFFFF";
  String backgroundChar = ".";
  CanvasElement ce;
  
  VilTAGEConfig(this.ce) { 
//    offX = offY = fontSize;
  }
  
  calculate() {
    ce.width = canvasWidth;
    ce.height = canvasHeight;
    if(offX == null) offX = canvasWidth/width;
    if(offY == null) offY = canvasHeight/height;
  }
}