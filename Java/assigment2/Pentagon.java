

public class Pentagon extends Shape{
	//private int area ;
	private double pentagonArea;
	
	public Pentagon(int area) {
		//this.area=area;
		super(area);
	}
	
	public double computeArea() {
		pentagonArea = (double)getArea();
		
		return (0.75 * pentagonArea) ;
	}
	
	public String getType() {
		return "Pentagon";
	}
}
