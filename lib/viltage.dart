library viltage;

import 'dart:html';
import 'entity/entity.dart';
import 'viltage_config.dart';
import 'etc/utility.dart';
import 'entity/char_node.dart';
import 'input.dart';
import 'stage.dart';

class VilTAGE {
  static List<List<Entity>> entities = new List<List<Entity>>(20);
  static num width, height, renderPS, updatePS;
  static String backgroundColor;
  static ParagraphElement pe;
  static NodeValidatorBuilder nvb;
  static Stage _stage;
  
  static start(VilTAGEConfig vc) {
    width = vc.width;
    height= vc.height;
    renderPS = vc.renderPS;
    updatePS = vc.updatePS;
    backgroundColor = vc.backgroundColor;
    pe = vc.pe;
    
    pe.attributes["font-family"] = "'Courier', sans-serif";
    
    nvb = new NodeValidatorBuilder.common()
      ..allowElement('span', attributes: ['style']);

    for(int i = 0; i < entities.length; i++) entities[i] = new List<Entity>();
    Utility.ar = new List<List<String>>(height);
    Utility.ar2 = new List<List<String>>(height);
    for(int i = 0; i < height; i++) {
      Utility.ar[i] = new List<String>(width);
      Utility.ar2[i] = new List<String>(width);
    }
    
    Entity e = new Entity(0, 0, 0);

    for(int i = 0; i < Utility.ar.length; i++) {
      for(int j = 0; j < Utility.ar[i].length; j++) {
        e.states[0].charNodes.add(new CharNode(j, i, "."));
      }
    }
    Utility.render();
   
    Input.init();
    
    loop(1);
  }
  
  static setStage(Stage s) {
    for(int i = 0; i < entities.length; i++) entities[i] = new List<Entity>(); 
    _stage = s;
    _stage.init();
  }

  static num delta = 0;
  static num time1 = 0, time2 = 0;
  static loop(num newDelta) {
    time1 += (newDelta-delta)/1000;
    time2 += (newDelta-delta)/1000;
    while(time1 >= 1/renderPS) {
     Utility.render();
     if(_stage != null) _stage.render();
     if(!Utility.identical()) {
       Utility.draw();
       pe.attributes["style"] = "font-family:courier; background-color:${backgroundColor}; text-align:center; color:#666666;";
       pe.attributes["font-size"] = "14px";
       Utility.merge();
     }
     time1 -= 1/renderPS;
    }
    while(time2 >= 1/updatePS) {
     Utility.update();
     if(_stage != null) _stage.update();
     time2 -= 1/updatePS;
    }
    
//    print("Loops: ${1~/((newDelta-delta)/1000)}");
    delta = newDelta;
    window.animationFrame.then(loop);
  }
}