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
  
  SpanElement getSpanElement() {
    se.attributes = attributes;
    se.classes = classes;
    
    if(backgroundColor != null) se.style.backgroundColor = backgroundColor;
    if(color != null) se.style.color = color;
    
    se.text = this.char;
    
    if(this.char == "" || this.char.length > 1) {
      se.text = " ";
    }
      
    return se;
  }
}