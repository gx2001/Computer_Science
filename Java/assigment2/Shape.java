

public abstract class Shape {
	
	private int area;
	

	public Shape() {
		area=0;
	}
	
	public Shape(int area) {
		this.area=area;
	}
	
	
	public abstract double computeArea();
	
	
	public abstract String getType();
	
	
	public boolean sameType (Shape other) {
		if(other.getType().equals(this.getType())) {
			return true;
		}
		else return false ;
	}
	
	
	public boolean sameArea(Shape other) {
		if(Double.compare(this.computeArea(), other.computeArea())==0 && this !=null) { // allagh \\
			return true;
		}
		else return false;
	}
	public String toString() { 
	
			return  getType() + ":" + computeArea();
	}
	public int getArea() {
		return area;
	}
}
