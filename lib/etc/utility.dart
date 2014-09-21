library utility;
import '../viltage.dart';

class Utility {
  static render() {
    for(int i = 0; i < VilTAGE.entities.length; i++) {
      for(int j = 0; j < VilTAGE.entities[i].length; j++) {
        VilTAGE.entities[i][j].render();
      }
    }
 }
  
  static draw() {
    StringBuffer sb = new StringBuffer();
    for(int i = 0; i < VilTAGE.height; i++) {
      for(int j = 0; j < VilTAGE.width; j++) {
        sb.write(ar[i][j]);
      }
      sb.write("<br />");
    }
    VilTAGE.pe.setInnerHtml(sb.toString(), validator:VilTAGE.nvb);
  }
  
  static List<List<String>> ar, ar2;
  
  static update() {
    for(int i = 0; i < VilTAGE.entities.length; i++) {
      for(int j = 0; j < VilTAGE.entities[i].length; j++) {
        VilTAGE.entities[i][j].update();
      }
    }
  }
  
  static bool identical() {
    for(int i = 0; i < ar.length; i++) {
      for(int j = 0; j < ar[i].length; j++) {
        if(ar[i][j] != ar2[i][j]) return false;
      }
    }
    return true;
  }
  
  static void merge() {
    for(int i = 0; i < ar.length; i++) {
      for(int j = 0; j < ar[i].length; j++) {
        ar2[i][j] = ar[i][j];
      }
    }
  }
}