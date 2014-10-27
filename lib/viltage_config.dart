part of viltage;

class VilTAGEConfig {
  int width = 20;
  int height = 20;
  int updatePS = 15;
  int fontSize = 14;
  int offX = 9;
  int offY = 11;
  double lineHeight = 1.0;
  String backgroundColor = "#FFFFFF";
  String backgroundChar = ".";
  CanvasElement ce;
  
  VilTAGEConfig(this.ce) { 
    offX = offY = fontSize;
  }
}