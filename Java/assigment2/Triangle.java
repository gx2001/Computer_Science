

public class Triangle extends Shape {
	//private int area ;
	private double triangleArea;
	
	public Triangle(int area) {
		super(area);
		//this.area = area;
	}
	
	public double computeArea() {
		triangleArea = (double)getArea();
		
		return (0.5 * triangleArea) ;
	}
	public String getType() {
		return "Triangle";
	}
}
