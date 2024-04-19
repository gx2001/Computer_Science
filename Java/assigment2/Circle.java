

import java.lang.Math;

public class Circle extends Shape{
	//private int area;
	private double circleArea;
	
	public Circle(int area) {
		//this.area=area;
		super(area);
	}
	
	public double computeArea() {
		circleArea = (double)getArea();
		
		return (Math.PI  * circleArea) * 0.25 ;
	}
	public String getType() {
		return "Circle";
	}
}
