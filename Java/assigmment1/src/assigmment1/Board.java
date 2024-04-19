package assigmment1;
import java.util.Random;

public class Board {
	private int n = 0;
	private int cardsRemain=0;
	
	private Random randDeck = new Random();
	
	private int []  myDeck; 
	
	
	public Board () {
		
	}	
	
	public Board(int n) {
	
		this.n = n;
		
		myDeck =  new int [2*n];

		
		int counter=0;
		for (int i=0 ;i<myDeck.length ;i+=2) {
			
			myDeck[i] = counter ;
			myDeck[i+1]=counter;
			counter++;
		}
	
		//Arrays.sort(myDeck);
		
		for(int i=0;i<myDeck.length;i++) {
			int randomIndexToSwap1 = randDeck.nextInt(myDeck.length);
			randDeck=new Random();
			int randomIndexToSwap2 = randDeck.nextInt(myDeck.length);
			randDeck=new Random();
			int temp = myDeck[randomIndexToSwap1];
			
			myDeck[randomIndexToSwap1]=myDeck[randomIndexToSwap2];
			myDeck[randomIndexToSwap2]=temp;
		}
		
		System.out.println("--------------------- Let's Begin :--------------------------");
		
	}
	
	
	public void print () {
		
		for (int i =0 ; i<myDeck.length;i++) {
			System.out.print(i+"  ");
		}
		System.out.println("");
		
		for (int i =0 ; i<myDeck.length;i++) {
			System.out.print("---");
		}
		System.out.println("");
		
		for (int i =0 ; i<myDeck.length;i++) {
			if (myDeck[i] == -1) {
				System.out.print("   ");
			}
			else {
				System.out.print("*  ");
			}
		}
		System.out.println("");
	}
	
	
	private  void delay(int sec){
		try {
			
			long d=1000*sec;
			Thread.sleep(d);
		}
		catch (InterruptedException e) {
			e.printStackTrace();
		}	
	}
	
	public void flash(int first ,int second) {
		
		System.out.println(" ");
		for (int i =0 ; i<myDeck.length;i++) {
			System.out.print(i+"  ");
		}
		System.out.println("");
		
		for (int i =0 ; i<myDeck.length;i++) {
			System.out.print("---");
		}
		System.out.println("");
		for (int i=0;i<myDeck.length;i++) {
			
			if (myDeck[i]==-1) {
				System.out.print("   ");
			}
			else if(i==first){
				System.out.print(myDeck[first]+"  ");
			}
			else if(i==second){
				System.out.print(myDeck[second]+"  ");	
			}
			else {
				System.out.print("*  ");
			}
		}
		
		//print();
		
		//System.out.print(myDeck[first] + "  " + myDeck[second]+"\r");
		
		
		
		delay(5);
		System.out.print("\r");
		for (int i =0 ; i<myDeck.length;i++) {
			if (myDeck[i] == -1) {
				System.out.print("   ");
			}
			else {
				System.out.print("*  ");
			}
		}
		System.out.println("");
		
	}

	public boolean openPositions(int first ,int second) {
			
		if (myDeck[first]==myDeck[second] ) {
			System.out.println("Found pair : " + "("+myDeck[first] + "," + myDeck[second] + ") " + "\n");
			myDeck[first]=-1;
			myDeck[second]=-1;
			print();
			return true;
		}
		else {
			flash(first,second);
			return false;
		}
	}
	
	
	public int getRandomPosition() {
		
		randDeck= new Random();
		int randomPos = randDeck.nextInt(2*n);
		
		while (myDeck[randomPos] == -1) {
			randDeck= new Random();
			randomPos = randDeck.nextInt(2*n);
		}
		return randomPos;
		
	
	}
	
	public int getRandomPosition(int position) {
		
		randDeck= new Random();
		int randomPos = randDeck.nextInt(2*n);
		
		/*while ((myDeck[randomPos] != -1) && (myDeck[position] !=myDeck[randomPos])) {
			newRand = randomPos;
	
		}
		return newRand;
		*/
		while ((myDeck[randomPos] == -1) || ( position ==randomPos )){
			randDeck= new Random();
			randomPos = randDeck.nextInt(2*n);
		}
		return randomPos;
	}
	
	public boolean containsCard(int position) {	
		if(position<0) {
			return false;
		}
		else if (position>=2*n) {
			return false ;
		}
		else if (myDeck[position] ==-1 )  {
			return false;
		}
		else {
			return true;
		}
	}
	
	public int getCard (int position) {
	
		return myDeck[position];
		
	}
	
	public boolean allPairsFound() { 
		for (int i =0 ; i<myDeck.length;i++) {
			if ((myDeck[i]!=-1) ) {
				return false ;
			}
		}
		return true;
	}
}
