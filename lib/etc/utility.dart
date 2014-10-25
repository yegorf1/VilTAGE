part of viltage;

class Utility {
  static render(List<List<Entity>> entities, List<List<SpanElement>> charArray) {
    for(int i = 0; i < entities.length; i++) {
      for(int j = 0; j < entities[i].length; j++) {
        entities[i][j].render(charArray);
      }
    }
 }
  
  static draw(ParagraphElement pe, List<List<SpanElement>> charArray) {
    pe.children.clear();
    List<SpanElement> spanElements = new List<SpanElement>();
//    StringBuffer sb = new StringBuffer();
    for(int i = 0; i < charArray.length; i++) {
      for(int j = 0; j < charArray[0].length; j++) {
        spanElements.add(charArray[i][j]);
/*        if(charArray[i][j] == null) sb.write("&nbsp;");
        else if(charArray[i][j] == "") sb.write("&nbsp;");
        else if(charArray[i][j] == " ") sb.write("&nbsp;");
        else sb.write(charArray[i][j]); */
      }
      SpanElement endLineElement = new SpanElement();
      endLineElement.setInnerHtml("</br>");
      spanElements.add(endLineElement);
//      sb.write("<br />");
    }
    for(int i = 0; i < spanElements.length; i++) pe.children.add(spanElements[i]);
//    pe.setInnerHtml(sb.toString(), validator:nvb);
  }
  
  static update(List<List<Entity>> entities, double delta) {
    for(int i = 0; i < entities.length; i++) {
      for(int j = 0; j < entities[i].length; j++) {
        entities[i][j].update(delta);
      }
    }
  }
  
  static bool identical(List<List<String>> charArray, List<List<String>> charArray2) {
    for(int i = 0; i < charArray.length; i++) {
      for(int j = 0; j < charArray[i].length; j++) {
        if(charArray[i][j] != charArray2[i][j]) return false;
      }
    }
    return true;
  }
  
  static void merge(List<List<String>> charArray, List<List<String>> charArray2) {
    for(int i = 0; i < charArray.length; i++) {
      for(int j = 0; j < charArray[i].length; j++) {
        charArray2[i][j] = charArray[i][j];
      }
    }
  }
}