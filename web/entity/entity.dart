library entity;
import '../viltage.dart';
import 'node.dart';
import '../etc/utility.dart';

class Entity {
  int layer;
  int x, y;
  
  List<Node> nodes = new List<Node>();
  
  Entity(this.x, this.y, this.layer) {
    VilTAGE.entities[layer].add(this);
    for(int i = 0; i < 10; i++) {
      nodes.add(new Node(x+i, y, "."));
    }
  }
  
  remove() {
    VilTAGE.entities[layer].remove(this);
  }
  
  render() {
    for(int i = 0; i < nodes.length; i++) {
      Utility.ar[y+nodes[i].y][x+nodes[i].x] = nodes[i].getChar(); 
    }
  }
  
  update() {
    
  }
}