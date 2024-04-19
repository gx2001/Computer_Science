
import java.io.*;
import java.util.*;
public class Player {
	
	
	Stack<Shape> stack;
	private double points;
	private String choise;
	private int sizeOfStack;
	private int elementsOnStack;
	
	
	public Player(int sizeOfStack) {
		this.sizeOfStack=sizeOfStack;
		points=0.0;
		choise = "";
		stack = new Stack<Shape>();
		//stack.setSize(sizeOfStack);
		elementsOnStack = 0;
	}
	
	
	public void playShape(Shape shape) {
		
		Shape lastShapeOnStack ;
		
		Scanner input  = new Scanner(System.in);
		System.out.println(shape.toString());
		System.out.println("Do you want to accept? (y/n) ");
		
		choise = input.next();
		
		
		if (choise.equals("y")) {
			
			System.out.println("Added "+shape.computeArea()+" points");
			
			/*
			stack.push(shape);
			
			if (stack.peek()!=null) {
				lastShapeOnStack = stack.peek();
			}
			else {
				lastShapeOnStack = new Triangle(0);
			}
			*/
			
			if (stack.isEmpty()) {
				
				stack.push(shape);
				elementsOnStack++;
				points += shape.computeArea();
				return;
				
			}
			
			lastShapeOnStack = stack.peek();
			
			if(lastShapeOnStack.sameType(shape)) {
				stack.pop();
				elementsOnStack--;
				System.out.println("Top shapes removed");
				points += shape.computeArea();
			}
			else {
				
			
				System.out.println("shape i choose " + stack.peek());
			
				if (lastShapeOnStack.sameArea(stack.peek())) {
					
					System.out.println("X10 points");
					stack.push(shape);
					elementsOnStack++;
					points = points + (lastShapeOnStack.computeArea()*10.0);
				}
				else {
					stack.push(shape);
					elementsOnStack++;
					points += stack.peek().computeArea();
				
				}
			}
			
		}
		//System.out.println("don't chosen shape" + shape.toString());	
	}
	
	
	public boolean isStackFull() {
		
		if (elementsOnStack == sizeOfStack) {
			return true;
		}
		
		return false;
		/*
		int counter =0;
		for (Shape s : stack) {
			
			if (s.getType()!=null) {
				counter++;
			}
		}
		if (counter == stack.capacity()) {
			return true;
		}
		else return false;
		*/
	}
	
	public void printStack() {
		
		for(int i = elementsOnStack-1; i>=0; i--) {
			if (stack.get(i) != null ) {
				System.out.println(i+1 + ":" + stack.get(i) );
			}
			//System.out.println(i + ":" + stack.get(i) + ":" + stack.get(i).getArea());
		}
		/*
		System.out.println();
		  Stack<Shape> temp = new Stack<Shape>();
		   
		  while (stack.empty() == false)
		  {
		    temp.push(stack.peek());
		    stack.pop();
		  }  
		 
		  while (temp.empty() == false)
		  {
		    Shape t = temp.peek();
		    System.out.println(t + " ");
		    temp.pop();
		 
		    // To restore contents of
		    // the original stack.
		    stack.push(t); 
		  }
		}*/

	
	}
	
	public double getPoints() {
		return points;
	}
}
