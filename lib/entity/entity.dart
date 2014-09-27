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
}