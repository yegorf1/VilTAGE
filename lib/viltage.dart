library viltage;

import 'dart:html';
import 'dart:collection';
import 'dart:async';
import 'package:crypto/crypto.dart';

part 'etc/gamejolt.dart';
part 'etc/utility.dart';
part 'entity/state.dart';
part 'entity/char_node.dart';
part 'entity/entity.dart';
part 'input.dart';
part 'stage.dart';
part 'viltage_config.dart';

class VilTAGE {
  List<List<Entity>> entities = new List<List<Entity>>(20);
  num width, height, updatePS;
  String backgroundColor;
  String backgroundChar;
  int fontSize;
  double lineHeight;
  
  ParagraphElement pe;
  NodeValidatorBuilder nvb;
  Stage _stage;
  bool running = false;
  StreamController updateController;
  Stream onUpdate;
  
  VilTAGE(VilTAGEConfig vc) {
    if(running) return;
    
    window.onBlur.listen(blured);
    window.onFocus.listen(focused);
    window.onLoad.listen(focused);
    
    width = vc.width;
    height= vc.height;
    updatePS = vc.updatePS;
    backgroundColor = vc.backgroundColor;
    pe = vc.pe;
    if(vc.backgroundChar == " ") backgroundChar = "&nbsp;";
    else backgroundChar = vc.backgroundChar;
    fontSize = vc.fontSize;
    lineHeight = vc.lineHeight;
        
    nvb = new NodeValidatorBuilder.common()
      ..allowElement('span', attributes: ['style']);

    charArray = new List<List<String>>(height);
    charArray2 = new List<List<String>>(height);
    for(int i = 0; i < height; i++) {
      charArray[i] = new List<String>(width);
      charArray2[i] = new List<String>(width);
    }
    
    Entity.clear(this);
    Utility.render(entities, charArray);
   
    Input.init();
    
    updateController = new StreamController();
    onUpdate = updateController.stream;
    
    loop(1);
  }
  
  end() {
    Entity.clear(this);
  }
  
  setStage(Stage s) {
    Entity.clear(this);
    _stage = s;
    _stage.init();
  }

  List<List<String>> charArray, charArray2;
  num delta = 0;
  num time1 = 0;
  num pauseState = 1;
  loop(num newDelta) {
    if(pauseState != 1) {
      if(pauseState == 2) { time1 = 0.01; pauseState = 0; }
      else time1 += (newDelta-delta)/1000;
      
      while(time1 >= 1/updatePS) {
        updateController.add(time1);
        Utility.update(entities, time1);
        if(_stage != null) _stage.update(time1);
        
        Utility.render(entities, charArray);
        if(_stage != null) _stage.render();
        if(!Utility.identical(charArray, charArray2)) {
          Utility.draw(pe, charArray, nvb);
          pe.attributes["style"] = "font-family:monospace; background-color:${backgroundColor}; text-align:center; color:#666666; font-size:${fontSize}pt; line-height:${lineHeight}em";
          Utility.merge(charArray, charArray2);
        }
        time1 -= 1/updatePS;
      }
      
      delta = newDelta;
    }
    window.animationFrame.then(loop);
  }
  
  blured(Event e) { pauseState = 1; }
  focused(Event e) { pauseState = 2;  }
}