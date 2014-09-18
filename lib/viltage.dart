library viltage;

import 'dart:html';
import 'entity/entity.dart';
import 'viltage_config.dart';
import 'etc/utility.dart';
import 'entity/char_node.dart';

class VilTAGE {
  static List<List<Entity>> entities = new List<List<Entity>>(20);
  static num width, height, renderPS, updatePS;
  static ParagraphElement pe;
  
  static start(VilTAGEConfig vc) {
    width = vc.width;
    height= vc.height;
    renderPS = vc.renderPS;
    updatePS = vc.updatePS;
    pe = vc.pe;

    for(int i = 0; i < entities.length; i++) entities[i] = new List<Entity>();
    Utility.ar = new List<List<String>>(height);
    for(int i = 0; i < Utility.ar.length; i++) Utility.ar[i] = new List<String>(width);
    
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
  Entity e = new Entity(0, 0, 0);
  
  for(int i = 0; i < VilTAGE.width; i++) {
    for(int j = 0; j < VilTAGE.height; j++) {
      e.charNodes.add(new CharNode(e.x+i, e.y+j, "."));
    }
  }
}