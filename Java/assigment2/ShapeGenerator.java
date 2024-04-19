
import java.util.Random;

import java.util.Arrays;
public class ShapeGenerator {
	
	private int shapeNum;
	
	private Shape[] arrayOfShapes ;
	
	private String myArrayString ;
	

	public ShapeGenerator (int shapeNum) {
		
		this.shapeNum=shapeNum;
		int n=shapeNum * 4;
		
		arrayOfShapes = new  Shape [n]; // Θεσεις πινακα
		
		initializeShapes(arrayOfShapes);
		

		Random r = new Random();
		
		Shape temp;
		
		for (int i =0; i < arrayOfShapes.length; i++) {
			
			int j = r.nextInt(arrayOfShapes.length);
			
			 temp = arrayOfShapes[i];
			 arrayOfShapes[i] = arrayOfShapes[j];
			 arrayOfShapes[j] = temp;
			 			 
			 
		}
		
	}
	
	
	private void initializeShapes (Shape[] arrayOfShapes) {
		
		
		int []  randomArea = {1,2,3,4,8,12,16};
		
		Random r = new Random();
		
		int randomPosition;
		int randomSize;
	
		
		
		for (int i = 0; i< arrayOfShapes.length/4;i++ ) {
			randomPosition = r.nextInt(randomArea.length);
			randomSize = randomArea[randomPosition];
			arrayOfShapes[i] = new Square(randomSize);
		}	
		
		for(int i = arrayOfShapes.length/4 ; i < 2*arrayOfShapes.length/4; i++) {
			randomPosition = r.nextInt(randomArea.length);
			randomSize = randomArea[randomPosition];
			arrayOfShapes[i] = new Triangle(randomSize); 
			
		}		
		
		for (int i = 2*arrayOfShapes.length/4 ;i<3*arrayOfShapes.length/4;i++) {
			randomPosition = r.nextInt(randomArea.length);
			randomSize = randomArea[randomPosition];
			arrayOfShapes[i] = new Pentagon(randomSize);
		}
		
		for (int i = 3*arrayOfShapes.length/4 ;i<arrayOfShapes.length;i++) {
			randomPosition = r.nextInt(randomArea.length);
			randomSize = randomArea[randomPosition];
			arrayOfShapes[i] = new Circle(randomSize);
		}
		
	
		
	}
	
	  
	
	public Shape nextShape () {
		Random r = new Random();
		int randomPosition = r.nextInt(arrayOfShapes.length);
		Shape tempShape;

		
		while (arrayOfShapes[randomPosition] == null) {
			randomPosition = r.nextInt(arrayOfShapes.length);
		}
	
		
		if (arrayOfShapes[randomPosition].getClass().getName().equals(new Square(0).getClass().getName())) {
			tempShape = new Square(arrayOfShapes[randomPosition].getArea());
		}
		else if (arrayOfShapes[randomPosition].getClass().getName().equals(new Triangle(0).getClass().getName())) {
			tempShape = new Triangle(arrayOfShapes[randomPosition].getArea());
		}
		else if (arrayOfShapes[randomPosition].getClass().getName().equals(new Pentagon(0).getClass().getName())) {
			tempShape = new Pentagon(arrayOfShapes[randomPosition].getArea());
		}
		else {
			tempShape = new Circle(arrayOfShapes[randomPosition].getArea());
		}
			
		
		
		arrayOfShapes[randomPosition] = null;
		
		return tempShape;
		
		
	}
	
	
	public boolean hasShape () {
		int count = 0;
		for(int i = 0;i< arrayOfShapes.length ; i++ ) {
			if (arrayOfShapes[i]==null) {
				count +=1;
			}
		}
		
		if (count == arrayOfShapes.length ) {
			return false ;
		}
		else return true;
	}
	
	public String toString () {
		
		myArrayString = "";
		
		for (int i = 0;i< arrayOfShapes.length ; i++) {
			
			if (arrayOfShapes[i]!=null) {
				myArrayString += arrayOfShapes[i].toString() + "\n" ;
			}
			else {
				myArrayString += "(not exists)\n";
			}
		}
		
		return myArrayString;
	}
	/*
	public static void main(String args[]) {
		
		ShapeGenerator test = new ShapeGenerator(4);
		Shape exitedShape;
		
		System.out.println(test);
		
		
		while(test.hasShape()) {
			exitedShape = test.nextShape();
			System.out.println("Sxima pou vgike: " + exitedShape);
		}
		
		System.out.println(test);
		
		
			
		
		System.out.println("End");
		
	}*/
	
}
