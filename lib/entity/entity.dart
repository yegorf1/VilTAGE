part of viltage;

class Entity {
  int layer;
  int x, y;
  int width, height;
  int activeState = 0;
  
  List<State> states = new List<State>();
  
  Entity(this.x, this.y, this.layer, VilTAGE viltage) {
    viltage.entities[layer].add(this);
    states.add(new State());
  }
  
  render(List<List<String>> charArray) {
    states[activeState].render(x, y, charArray);
  }
  
  update(double delta) { }
  remove(VilTAGE viltage) { viltage.entities[layer].remove(this); }
  
  static clear(List<List<Entity>> entities) {
    for(int i = 0; i < entities.length; i++) entities[i] = new List<Entity>();
  }
}