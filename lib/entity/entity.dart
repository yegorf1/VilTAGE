library entity;
import '../viltage.dart';
import 'char_node.dart';
import '../etc/utility.dart';

class Entity {
  int layer;
  int x, y;
  
  List<CharNode> charNodes = new List<CharNode>();
  
  Entity(this.x, this.y, this.layer) {
    VilTAGE.entities[layer].add(this);
  }
  
  remove() {
    VilTAGE.entities[layer].remove(this);
  }
  
  render() {
    for(int i = 0; i < charNodes.length; i++) {
      Utility.ar[y+charNodes[i].y][x+charNodes[i].x] = charNodes[i].getChar(); 
    }
  }
  
  update() {
    
  }
}