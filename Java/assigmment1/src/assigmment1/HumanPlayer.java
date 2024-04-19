package assigmment1;
import java.util.Scanner;


public class HumanPlayer {
	private String name ;
	private int points = 0;
	private int firstNumber;
	private int secNumber;
	
	public HumanPlayer(String name ) {
		this.name=name ;
		
	}
	
	public void play(Board board) {
		
		Scanner input = new Scanner(System.in);
		
		if (board.allPairsFound()) {
			return;
		}

		System.out.print(this.name +": select two positions: ");
		
		firstNumber=input.nextInt();
		secNumber=input.nextInt();
		
		
		
		
		while( (board.containsCard(firstNumber)!=true) || (board.containsCard(secNumber)!=true) || (firstNumber==secNumber) ){
			
			System.out.print("\n\n" + this.name +": select two positions: ");
			
			firstNumber=input.nextInt();
			secNumber=input.nextInt();	
			
		}
			
		if( board.openPositions(firstNumber, secNumber) == true ) {
			points+=1;
		}
	

	
		
	}
	
	
	public int getHumanPoints() {
		return points;
	}
	
	
	public String toString() {
		return name ;
	}
	
	
}
