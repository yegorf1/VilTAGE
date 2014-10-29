part of viltage;

class Utility {
  static render(List<List<Entity>> entities, List<List<CharNode>> charArray) {
    for(int i = 0; i < entities.length; i++) {
      for(int j = 0; j < entities[i].length; j++) {
        entities[i][j].render(charArray);
      }
    }
 }
  
  static draw(CanvasRenderingContext2D ctx, int offX, int offY, List<List<CharNode>> charArray) {
    for(int i = 0; i < charArray.length; i++) {
      for(int j = 0; j < charArray[0].length; j++) {
        ctx.fillStyle = charArray[i][j].backgroundColor;
        ctx.fillRect(j*offX, i*offY, (j+1)*offX, (i+1)*offY);
      }
    }
    
    for(int i = 0; i < charArray.length; i++) {
      for(int j = 0; j < charArray[0].length; j++) {
        ctx.fillStyle = charArray[i][j].color;
        ctx.fillText(charArray[i][j].char, j*offX, (i+1)*offY);
      }
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