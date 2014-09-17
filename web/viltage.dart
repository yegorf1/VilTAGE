library viltage;
import 'dart:html';
import 'entity/entity.dart';
import 'viltage_config.dart';
import 'etc/utility.dart';

class VilTAGE {
  static List<List<Entity>> entities = new List<List<Entity>>(20);
  static num width, height, renderPS, updatePS;
  static ParagraphElement pe;
  
  static start(VilTAGEConfig vc) {
    for(int i = 0; i < entities.length; i++) entities[i] = new List<Entity>();
    width = vc.width;
    height= vc.height;
    renderPS = vc.renderPS;
    updatePS = vc.updatePS;
    pe = vc.pe;
    
    loop(1);
  }

  static num delta = 0;
  static num time1 = 0, time2 = 0;
  static loop(num newDelta) {
    time1 += (newDelta-delta)/1000;
    time2 += (newDelta-delta)/1000;
    while(time1 >= 1/renderPS) {
     Utility.render();
     time1 -= 1/renderPS;
    }
    while(time2 >= 1/updatePS) {
     Utility.update();
     time2 -= 1/updatePS;
    }
    
//    print("Loops: ${1~/((newDelta-delta)/1000)}");
    delta = newDelta;
    window.animationFrame.then(loop);
  }
}

void main() {
  VilTAGEConfig vtc = new VilTAGEConfig(querySelector("#can"));
  VilTAGE.start(vtc);
}