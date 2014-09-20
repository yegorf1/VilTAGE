library state;

import 'char_node.dart';
import '../etc/utility.dart';

class State {
  List<CharNode> charNodes = new List<CharNode>();
  
  render(int x, int y) {
    for(int i = 0; i < charNodes.length; i++) {
      Utility.ar[y+charNodes[i].y][x+charNodes[i].x] = charNodes[i].getChar(); 
    }
  }
  
  CharNode createCharNode(int x, int y, String text) {
    CharNode cn = new CharNode(x, y, text[0]);
    charNodes.add(cn);
    return cn;
  }
  
  List<CharNode> createCharNodeLine(int x, int y, bool horizontal, String text) {
    List<CharNode> charNodes = new List<CharNode>();
    for(int i = 0; i < text.length; i++) {
      CharNode cn;
      if(horizontal) cn = new CharNode(x + i, y, text[i]);
      else cn = new CharNode(x, y + i, text[i]);
      charNodes.add(cn);
      this.charNodes.add(cn);
    }
    return charNodes;
  }
}