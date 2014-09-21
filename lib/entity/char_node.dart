library char_node;

class CharNode {
  int x, y;
  String char = "x";
  String color = "#8989B3";
  String backgroundColor = "#00FFFFFF";
  List<String> classes = new List<String>();
  
  
  CharNode(this.x, this.y, this.char) { 
    classes.add("char_node");
  }
  
  String getChar() {
    StringBuffer sbClasses = new StringBuffer();
    for(int i = 0; i < classes.length; i++) {
      sbClasses.write('${classes[i]} ');
    }
    return '<span class="${sbClasses.toString()}" style="color: $color; background-color: ${backgroundColor};">$char</span>';
  }
}