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
  
  render(List<List<SpanElement>> charArray) {
    states[activeState].render(x, y, charArray);
  }
  
  update(double delta) { }
  remove(VilTAGE viltage) { viltage.entities[layer].remove(this); }
  
  static clear(VilTAGE viltage) {
    for(int i = 0; i < viltage.entities.length; i++) viltage.entities[i] = new List<Entity>();
    Entity e = new Entity(0, 0, 0, viltage);
    for(int i = 0; i < viltage.width; i++) for(int j = 0; j < viltage.height; j++) e.states[0].createCharNode(i, j, viltage.backgroundChar);
  }
}