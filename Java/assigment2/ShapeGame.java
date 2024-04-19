
import java.util.*;

public class ShapeGame {


	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int numOfShapes= 0 ;
		int sizeOfStack=0;
		Scanner input  = new Scanner(System.in);
		System.out.println("Give the number of shapes per type");
		numOfShapes = input.nextInt();
		ShapeGenerator generator= new ShapeGenerator(numOfShapes);
		
		System.out.println("Give the size of the stack for the player" );
		sizeOfStack= input.nextInt();
		
		Player player = new Player(sizeOfStack);
		
		while ((player.isStackFull() == false) && (generator.hasShape())) {
			System.out.print("Incoming Shape ");
			player.playShape(generator.nextShape());
			System.out.println("Player has : " + player.getPoints() + " points \n");
			System.out.println("Current Stack :");
			player.printStack();
			//System.out.println("Player has : " + player.getPoints() + " points");
			System.out.println("");
		}
		System.out.println(" Game over ");
	}

}
