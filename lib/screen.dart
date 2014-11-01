part of viltage;

class VilTAGEScreen {
	VilTAGE viltage;
	
	List<List<Entity>> entities;
	
	VilTAGEScreen(this.viltage) {
		entities = new List<List<Entity>>(20);
		Entity.clearScreen (this);
		Utility.render(this.entities, viltage.charArray);
	}
	
	void show() { }
	void hide() { }
	void update(double delta) { }
	void render() { }
}