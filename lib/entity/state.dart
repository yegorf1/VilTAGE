part of viltage;

class State {
  List<CharNode> charNodes = new List<CharNode>();
  
  render(int x, int y) {
    for(int i = 0; i < charNodes.length; i++) {
      if(y+charNodes[i].y < VilTAGE.height && y+charNodes[i].y >= 0 &&
         x+charNodes[i].x < VilTAGE.width  && x+charNodes[i].x >= 0)
      Utility.charArray[y+charNodes[i].y][x+charNodes[i].x] = charNodes[i].getHTML(); 
    }
  }
  
  CharNode createCharNode(int x, int y, String text) {
    CharNode cn;
    String charText = text;
    if(text.length > 1 || text == " ") charText = "&nbsp;";
    cn = new CharNode(x, y, charText);
    charNodes.add(cn);
    return cn;
  }
  
  List<CharNode> createCharNodeLine(int x, int y, bool horizontal, String text) {
    List<CharNode> charNodes = new List<CharNode>();
    for(int i = 0; i < text.length; i++) {
      String charText = text[i];
      if(text[i] == " ") charText = "&nbsp;";
      
      CharNode cn;
      if(horizontal) cn = new CharNode(x + i, y, charText);
      else cn = new CharNode(x, y + i, charText);
      charNodes.add(cn);
      this.charNodes.add(cn);
    }
    return charNodes;
  }
  
  List<List<CharNode>> createCharNodeRect(int x, int y, List<String> text) {
    List<List<CharNode>> charNodes = new List<List<CharNode>>();
    for(int i = 0; i < text.length; i++) {
      charNodes.add(new List<CharNode>());
      for(int j = 0; j < text[i].length; j++) {
        String charText = text[i][j];
        if(text[i][j] == " ") charText = "&nbsp;";
        
        CharNode cn = new CharNode(x + j, y + i, charText);
        charNodes[i].add(cn);
        this.charNodes.add(cn);
      }
    }
    return charNodes;
  }
}