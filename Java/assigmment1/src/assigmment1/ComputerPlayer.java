package assigmment1;

import java.util.Random;

public class ComputerPlayer {
	private String name ;
	private int n;
	private int [] computerSeenPositions;
	private int points =0;
	
	public ComputerPlayer() {
	
	}
	
	public ComputerPlayer(String name,int n ) {
		
		int i;
		
		this.name = name ;
		this.n=n;
		
		computerSeenPositions = new int[n];
		
		for(i=0 ; i<computerSeenPositions.length; i++) {
			computerSeenPositions[i]=-1;
		}
		
	}
	
	
	
	public void play(Board board) {
	
		
		
		int position1;
		int position2;
		int card1;
		int card2;		
		
		
		if (board.allPairsFound()) return;
		
		
		position1=board.getRandomPosition();
		card1=board.getCard(position1);
		
		
		if (computerSeenPositions[card1]!=-1 ) {
			
			position2 = computerSeenPositions[card1];
			card2 = board.getCard(position2);
			
			if (position1 == position2) {
				position2=board.getRandomPosition(position1);
				card2 = board.getCard(position2);
			}
			
		}
		else {
			position2=board.getRandomPosition(position1);
			card2=board.getCard(position2);
		}
		
		computerSeenPositions[card1] = position1;
		computerSeenPositions[card2] = position2;
		
		boolean pairFound = false;
		
		pairFound = board.openPositions(position1, position2);
		
		if (pairFound) {
			 this.points++;
		}
	}
	

	
	public int getComputerPoints() {
		return points;
	}
	
	
	public String toString() {
		return name ; 
	}
	
	
	
}