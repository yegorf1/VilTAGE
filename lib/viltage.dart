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
  Map<String, String> attributes = new Map<String, String>();
  int fontSize;
  int offX, offY;
  
  CanvasElement ce;
  Stage _stage;
  StreamController updateController;
  StreamController focusedController;
  Stream onUpdate;
  Stream onFocused;
  
  VilTAGE(VilTAGEConfig vc) {
    vc.calculate();    
    
    window.onBlur.listen(blured);
    window.onFocus.listen(focused);
    window.onLoad.listen(focused);
    
    width = vc.width;
    height= vc.height;
    updatePS = vc.updatePS;
    backgroundColor = vc.backgroundColor;
    backgroundChar = vc.backgroundChar;
    ce = vc.ce;
    
    fontSize = vc.fontSize;
    offX = vc.offX.floor();
    offY = vc.offY.floor();

    charArray = new List<List<CharNode>>(height);
    charArray2 = new List<List<CharNode>>(height);
    ce.children.clear();
    
    for(int i = 0; i < height; i++) {
      charArray[i] = new List<CharNode>(width);
      charArray2[i] = new List<CharNode>(width);
    }
    
    Entity.clear(this);
    Utility.render(entities, charArray);
   
    Input.init();
    
    focusedController = new StreamController();
    onFocused = focusedController.stream;
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

  List<List<CharNode>> charArray, charArray2;
  num delta = 0;
  num time1 = 0;
  num pauseState = 1;
  loop(num newDelta) {
    if(pauseState != 1) {
      if(pauseState == 2) { time1 = 0.01; pauseState = 0; }
      else time1 += (newDelta-delta)/1000;
      
      while(time1 >= 1/updatePS) {
        ce.context2D.clearRect(0, 0, ce.width, ce.height);
        ce.context2D.fillStyle = backgroundColor;
        ce.context2D.fillRect(0, 0, ce.width, ce.height);
        
        ce.context2D.font="${fontSize}px Monospace";
        updateController.add(time1);
        Utility.update(entities, time1);
        if(_stage != null) _stage.update(time1);
        
        Utility.render(entities, charArray);
        if(_stage != null) _stage.render();
        ce.context2D.fillStyle = backgroundColor;    
        ce.context2D.fillRect(0, 0, ce.width, ce.height);
        Utility.draw(ce.context2D, offX, offY, charArray);
        time1 -= 1/updatePS;
      }
      
      delta = newDelta;
    }
    window.animationFrame.then(loop);
  }
  
  blured(Event e) { pauseState = 1; }
  focused(Event e) { pauseState = 2; focusedController.add(0); }
}