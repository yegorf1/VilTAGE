library char_node;

class CharNode {
  int x, y;
  String char = "x";
  String color = "#f00";
  List<String> classes = new List<String>();
  
  
  CharNode(this.x, this.y, this.char) { }
  
  String getChar() {
//   return '<span style="color: $color;">$char</span>';
    StringBuffer sbClasses = new StringBuffer();
    for(int i = 0; i < classes.length; i++) {
      sbClasses.write("$classes[i] ");
    }
    return '<span class="${sbClasses.toString()}>$char</span>';
  }
}