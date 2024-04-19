package assigmment1;
import java.util.Scanner;

public class MemoryGame {
	int num=0;
	
	public static void main(String[] args) {
		
		int n=0;
		
		if(args.length!=1){
		       System.out.println("\nERROR:Game Size argument is not set correctly\n\n");
		       return;
		 }
		
		n=Integer.parseInt(args[0]);
		MemoryGame game = new MemoryGame();
		

		Board b = new Board (n);
		
		String computerName ;
		String humanPlayer1;
		String humanPlayer2;
		
		int rounds=1;
		int choise;
		
		Scanner input = new Scanner(System.in);
		
		do {
			System.out.println("Choose your play style: ");
			System.out.println("1. Human-Computer");
			System.out.println("2. Human-Human");
			choise=input.nextInt();
		}while( (choise!=1) && (choise!=2) );
		
		
		
		if (choise==1 ) {
			System.out.println("give computer's name:");
			computerName = input.next();
			ComputerPlayer computer = new ComputerPlayer(computerName ,n);
			System.out.println("give human's name:");
			humanPlayer1=input.next();
			HumanPlayer human= new HumanPlayer(humanPlayer1);
			
			while (b.allPairsFound() != true) {
				System.out.println("\n\n------------------ round:"+ rounds +"-----------------------\n\n");
				computer.play(b);
				System.out.println(""+computer.toString()+": points "+computer.getComputerPoints());
				human.play(b);
				System.out.println(""+human.toString()+": points "+human.getHumanPoints());
				rounds+=1;
				
			}
			System.out.println("\n\nGame over !!! \n ");
			if (computer.getComputerPoints()>human.getHumanPoints()) {
				System.out.println("The winner is : "+computerName.toString());
			}
			else if (computer.getComputerPoints()<human.getHumanPoints()) {
				System.out.println("The winner is : "+human.toString());
			}
			else {
				System.out.println("Tie");
			}
			
		}
		
		else {
			System.out.println("give 1st player's name:");
			humanPlayer1=input.next();
			HumanPlayer player1= new HumanPlayer(humanPlayer1);
				
			System.out.println("give 2nd player's name:");
			humanPlayer2=input.next();
			HumanPlayer player2= new HumanPlayer(humanPlayer2);
			
			while (b.allPairsFound() != true) {
				System.out.println("\n\n------------------ round:"+ rounds +"-----------------------\n\n");
				player1.play(b);
				System.out.println(""+player1.toString()+": points "+player1.getHumanPoints());
				player2.play(b);
				System.out.println(""+player2.toString()+": points "+player2.getHumanPoints());
				rounds+=1;				
			}
			
			
			System.out.println("\n\nGame over !!! \n");
			if (player1.getHumanPoints()>player2.getHumanPoints()) {
				System.out.println("The winner is : "+player1.toString());
			}
			else if (player1.getHumanPoints()<player2.getHumanPoints()) {
				System.out.println("The winner is : "+player2.toString());
			}
			else {
				System.out.println("Tie");
			}
		}
		input.close();
	}
}
