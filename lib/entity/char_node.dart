library char_node;

class CharNode {
  int x, y;
  String char = "x";
  String color;
  String backgroundColor;
  List<String> classes = new List<String>();
  Map<String, String> styles = new Map<String, String>();
  
  StringBuffer _sbClasses, _sbStyles;
  
  CharNode(this.x, this.y, this.char) { 
    classes.add("char_node");
    _sbClasses = new StringBuffer();
    _sbStyles = new StringBuffer();
  }
  
  String getHTML() {
    if(classes.length > 0) {
      _sbClasses = new StringBuffer();
      _sbClasses.write('class="');
      for(int i = 0; i < classes.length; i++) {
        _sbClasses.write(' ${classes[i]}');
      }
      _sbClasses.write('"');
    }
    if(styles.length > 0) {
      _sbStyles = new StringBuffer();
      styles.forEach((k, v) {
        _sbStyles.write("$k: $v;");
      });
    }
    String bc = (backgroundColor==null)?"":"background-color: ${backgroundColor};";
    String fc = (color==null)?"":"color: ${color};";
    return '<span ${_sbClasses.toString()} style="$fc $bc ${_sbStyles}">$char</span>';
  }
}