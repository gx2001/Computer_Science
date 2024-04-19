package assigmment1;

import java.util.Random;

public class TestBoard {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Board d = new Board (3);
		//d.print();
		Random rand = new Random();
		
		d.print();
		System.out.println("\n");
		
		for(int i =0 ; i<6; i++) {
			System.out.print(d.getCard(i)+"  ");
		}
		System.out.println("\n");
		
		
		d.flash(d.getRandomPosition(),d.getRandomPosition());
		
		
		//Eyresi thesewn pou DEN einai zeygari
		int pos1;
		int pos2;
		int card1;
		int card2;
		
		do {
			pos1=d.getRandomPosition();
			pos2=d.getRandomPosition(pos1);
		
		
			 card1=d.getCard(pos1);
			 card2=d.getCard(pos2);
		
		}while( (card1==card2) || (card1==-1) );
		
		
		//Anoigma kartwn
		d.openPositions(pos1,pos2);
		
		
		//Eyresi thesewn pou EINAI zeygari
		do {
			pos1=d.getRandomPosition();
			pos2=d.getRandomPosition(pos1);
		
		
			 card1=d.getCard(pos1);
			 card2=d.getCard(pos2);
		
		}while( (card1!=card2) || (card1==-1) );
		
		
		//Anoigma kartwn
		d.openPositions(pos1,pos2);
		
		
		//Vriskw mia thesi ME karta
		int isCard=-1;
		do {
			
			pos1=d.getRandomPosition();
			
			isCard=d.getCard(pos1);
			
		}while(isCard==-1);
		
		
		
		//Kalw tin containsCard ME karta
		System.out.println("\nKlisi tis containsCard() ME karta: " + d.containsCard(pos1));
		
		
		//Kalw tin containsCard XWRIS karta
		System.out.println("\nKlisi tis containsCard() XWRIS karta: " + d.containsCard(pos2));
		
		
		//Eyresi thesewn pou EINAI zeygari
		do {
			pos1=d.getRandomPosition();
			pos2=d.getRandomPosition(pos1);
		
		
			 card1=d.getCard(pos1);
			 card2=d.getCard(pos2);
		
		}while( (card1!=card2) || (card1==-1) );
		
		
		//Anoigma kartwn
		d.openPositions(pos1,pos2);
		
	
		
		//Eyresi dyo tyxaiwn thesewn
		pos1=d.getRandomPosition();
		pos2=d.getRandomPosition(pos1);
		
		//Anoigma kartwn
		d.openPositions(pos1,pos2);
		
		
		System.out.println("\nAll pairs found: "+d.allPairsFound());
		
		
		/*d.openPositions(0,3);
		d.openPositions(1,0);
		
		
		d.getRandomPosition(1);
		d.getRandomPosition(3);
		
		for(int i =0 ; i<3; i++) {
			System.out.println(d.containsCard(i));	
			
		}
		
		d.openPositions(1, 2);
		d.openPositions(3,2);
		
		d.allPairsFound();
		
		System.out.println(d.allPairsFound());
		
		
		*/
		
		
	}
}
