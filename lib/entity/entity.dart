part of viltage;

class Entity {
	int layer;
	int x, y;
	int width, height;
	int activeState = 0;
  
	List<State> states = new List<State>();
	  
  	Entity.FromScreen(this.x, this.y, this.layer, VilTAGEScreen s) {
  		s.entities[layer].add(this);
  		states.add(new State());
  	}
    
  	Entity.FromVilTAGE(this.x, this.y, this.layer, VilTAGE v) {
  		v.getScreen().entities[layer].add(this);
  		states.add(new State());
  	}
  
	render(List<List<CharNode>> charArray) {
		states[activeState].render(x, y, charArray);
	}
  
	update(double delta) {
		
	}
	
	removeFromScreen(VilTAGEScreen s) {
		s.entities[layer].remove(this);
	}
	
	removeFromvilTAGE(VilTAGE v) {
		removeFromScreen(v.getScreen());	
	}
	  
  	static clearScreen(VilTAGEScreen s) {
  		for(int i = 0; i < s.entities.length; i++) {
  			s.entities[i] = new List<Entity>();
  		}
  		Entity e = new Entity.FromScreen(0, 0, 0, s);
  		for(int i = 0; i < s.viltage.width; i++) {
  			for(int j = 0; j < s.viltage.height; j++) {
  				e.states[0].createCharNode(i, j, s.viltage.backgroundChar);
  			}
  		}
  	}
    
  	static clearVilTAGE(VilTAGE v) {
		clearScreen (v.getScreen());
  	}
}