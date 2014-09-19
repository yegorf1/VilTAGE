library entity;
import '../viltage.dart';
import 'char_node.dart';
import '../etc/utility.dart';

class Entity {
  int layer;
  int x, y;
  int width, height;
  
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
  
  update() { }
  
  setSize(int width, int height) {
    this.width = width;
    this.height = height;
  }
  
  CharNode createCharNode(int x, int y, String text) {
    CharNode cn = new CharNode(x, y, text[0]);
    charNodes.add(cn);
    return cn;
  }
}