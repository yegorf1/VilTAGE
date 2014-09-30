library viltage;

import 'dart:html';
import 'dart:collection';
import 'etc/utility.dart';

part 'entity/state.dart';
part 'entity/char_node.dart';
part 'entity/entity.dart';
part 'input.dart';
part 'stage.dart';
part 'viltage_config.dart';

class VilTAGE {
  static List<List<Entity>> entities = new List<List<Entity>>(20);
  static num width, height, updatePS;
  static String backgroundColor;
  static String backgroundChar;
  static int fontSize;
  static double lineHeight;
  
  static ParagraphElement pe;
  static NodeValidatorBuilder nvb;
  static Stage _stage;
  
  static start(VilTAGEConfig vc) {
    window.onBlur.listen(blured);
    window.onFocus.listen(focused);
    
    width = vc.width;
    height= vc.height;
    updatePS = vc.updatePS;
    backgroundColor = vc.backgroundColor;
    pe = vc.pe;
    if(vc.backgroundChar == " ") backgroundChar = "&nbsp;";
    else backgroundChar = vc.backgroundChar;
    fontSize = vc.fontSize;
    lineHeight = vc.lineHeight;
    
    pe.attributes["font-family"] = "'Courier', sans-serif";
    
    nvb = new NodeValidatorBuilder.common()
      ..allowElement('span', attributes: ['style']);

    for(int i = 0; i < entities.length; i++) entities[i] = new List<Entity>();
    Utility.charArray = new List<List<String>>(height);
    Utility.charArray2 = new List<List<String>>(height);
    for(int i = 0; i < height; i++) {
      Utility.charArray[i] = new List<String>(width);
      Utility.charArray2[i] = new List<String>(width);
    }
    
    Utility.createBaseEntity();
    Utility.render();
   
    Input.init();
    
    loop(1);
  }
  
  static setStage(Stage s) {
    for(int i = 0; i < entities.length; i++) entities[i] = new List<Entity>(); 
    _stage = s;
    _stage.init();
    Utility.createBaseEntity();
  }

  static num delta = 0;
  static num time1 = 0;
  static num pauseState = 0;
  static loop(num newDelta) {
    if(pauseState != 1) {
      if(pauseState == 2) { time1 = 0.01; pauseState = 0; }
      else time1 += (newDelta-delta)/1000;
      
      while(time1 >= 1/updatePS) {
        Utility.update(time1);
        if(_stage != null) _stage.update(time1);
        
        Utility.render();
        if(_stage != null) _stage.render();
        if(!Utility.identical()) {
          Utility.draw();
          pe.attributes["style"] = "font-family:courier; background-color:${backgroundColor}; text-align:center; color:#666666; font-size:${fontSize}pt; line-height:${lineHeight}em";
          Utility.merge();
        }
        time1 -= 1/updatePS;
      }
      
      delta = newDelta;
    }
    window.animationFrame.then(loop);
  }
  
  static blured(Event e) { pauseState = 1; }
  static focused(Event e) { pauseState = 2;  }
}