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
  
  static update() {
    for(int i = 0; i < VilTAGE.entities.length; i++) {
      for(int j = 0; j < VilTAGE.entities[i].length; j++) {
        VilTAGE.entities[i][j].update();
      }
    }
  }
}