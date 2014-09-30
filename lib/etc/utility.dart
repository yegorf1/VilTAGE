library viltage_etc;

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
        if(charArray[i][j] == null) sb.write(".");
        else sb.write(charArray[i][j]);
      }
      sb.write("<br />");
    }
    VilTAGE.pe.setInnerHtml(sb.toString(), validator:VilTAGE.nvb);
  }
  
  static List<List<String>> charArray, charArray2;
  
  static update(double delta) {
    for(int i = 0; i < VilTAGE.entities.length; i++) {
      for(int j = 0; j < VilTAGE.entities[i].length; j++) {
        VilTAGE.entities[i][j].update(delta);
      }
    }
  }
  
  static bool identical() {
    for(int i = 0; i < charArray.length; i++) {
      for(int j = 0; j < charArray[i].length; j++) {
        if(charArray[i][j] != charArray2[i][j]) return false;
      }
    }
    return true;
  }
  
  static void merge() {
    for(int i = 0; i < charArray.length; i++) {
      for(int j = 0; j < charArray[i].length; j++) {
        charArray2[i][j] = charArray[i][j];
      }
    }
  }
}