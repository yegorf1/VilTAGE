part of viltage;

class CharNode {
  int x, y;
  String char = "x";
  String color = "#000000";
  String backgroundColor = "none";
  List<String> classes = new List<String>();
  Map<String, String> attributes = new Map<String, String>();
  SpanElement se = new SpanElement();
    
  CharNode(this.x, this.y, this.char) { 
    classes.add("char_node");
  }
}