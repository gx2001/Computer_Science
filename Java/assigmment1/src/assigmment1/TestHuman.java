package assigmment1;

public class TestHuman {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Board d = new Board (3);
		
		d.print();
		
		HumanPlayer human = new HumanPlayer("george");
	
		for(int i =0 ; i<6; i++) {
			System.out.print(d.getCard(i));
		}
		
		System.out.println("");
		
		for(int i=0; i<10; i++) {		
			human.play(d);
			System.out.print(human.toString()+": points "+human.getHumanPoints());
		}
		
		
		
		
		
		
	}
}
