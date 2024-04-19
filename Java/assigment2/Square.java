

public class Square extends Shape{
	
	//private int area ;
	
	public Square(int area) {
		//this.area=area;
		super(area);
	}
	
	public double computeArea() {
		return (double)getArea();
	}
	public String getType() {
		return "Square";
	}
}
