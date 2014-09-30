part of viltage;

class Entity {
  int layer;
  int x, y;
  int width, height;
  int activeState = 0;
  
  List<State> states = new List<State>();
  
  Entity(this.x, this.y, this.layer) {
    VilTAGE.entities[layer].add(this);
    states.add(new State());
  }
  
  render() {
    states[activeState].render(x, y);
  }
  
  update(double delta) { }
  remove() { VilTAGE.entities[layer].remove(this); }
  
  static clear() {
    for(int i = 0; i < VilTAGE.entities.length; i++) VilTAGE.entities[i] = new List<Entity>();
    Entity e = new Entity(0, 0, 0);
    for(int i = 0; i < Utility.charArray.length; i++) {
      for(int j = 0; j < Utility.charArray[i].length; j++) {
        e.states[0].createCharNode(j, i, VilTAGE.backgroundChar);
      }
    }  
  }
}