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
    List<SpanElement> se = new List<SpanElement>();
    for(int i = 0; i < charArray.length; i++) {
      for(int j = 0; j < charArray[0].length; j++) {
        se.add(charArray[i][j]);
      }
      SpanElement endLineElement = new SpanElement();
      endLineElement.setInnerHtml("</br>");
      se.add(endLineElement);
    }
    for(int i = 0; i < se.length; i++) {
      if(pe.children.length == i) pe.children.add(se[i]);
      else pe.children[i] = se[i];
    }
  }
  
  static update(List<List<Entity>> entities, double delta) {
    for(int i = 0; i < entities.length; i++) {
      for(int j = 0; j < entities[i].length; j++) {
        entities[i][j].update(delta);
      }
    }
  }
  
  static bool identical(List<List<SpanElement>> charArray, List<List<SpanElement>> charArray2) {
    for(int i = 0; i < charArray.length; i++) {
      for(int j = 0; j < charArray[i].length; j++) {
        if(charArray[i][j] != charArray2[i][j]) return false;
      }
    }
    return true;
  }
  
  static void merge(List<List<SpanElement>> charArray, List<List<SpanElement>> charArray2) {
    for(int i = 0; i < charArray.length; i++) {
      for(int j = 0; j < charArray[i].length; j++) {
        charArray2[i][j] = charArray[i][j];
      }
    }
  }
}