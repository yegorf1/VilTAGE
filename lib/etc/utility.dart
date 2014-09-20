library utility;
import '../viltage.dart';

class Utility {
  static render() {
    for(int i = 0; i < VilTAGE.entities.length; i++) {
      for(int j = 0; j < VilTAGE.entities[i].length; j++) {
        VilTAGE.entities[i][j].render();
      }
    }

    StringBuffer sb = new StringBuffer();
    for(int i = 0; i < VilTAGE.height; i++) {
      for(int j = 0; j < VilTAGE.width; j++) {
        sb.write(ar[i][j]);
      }
      sb.write("<br />");
    }
    VilTAGE.pe.setInnerHtml(sb.toString(), validator:VilTAGE.nvb);
  }
  
  static List<List<String>> ar;
  
  static update() {
    for(int i = 0; i < VilTAGE.entities.length; i++) {
      for(int j = 0; j < VilTAGE.entities[i].length; j++) {
        VilTAGE.entities[i][j].update();
      }
    }
  }
}