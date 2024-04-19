package assigmment1;

public class TestComputer {
	public static void main(String[] args) {
		
		Board b = new Board(3);
		
		
		b.print();

		System.out.println("\n");
		
		for(int i =0 ; i<6; i++) {
			System.out.print(b.getCard(i));
		}
		
		System.out.println("\n");
		
		ComputerPlayer computer = new  ComputerPlayer("jk", 3);
		
		for(int i=0; i<10; i++) {
			System.out.println("----------"+ (i+1) + "--------------");
			computer.play(b);
			System.out.println("\n");
		}
		
		/*
		computer.play(b);
		System.out.println("------------------------");
		computer.play(b);
		*/
		
		
		System.out.println(computer.toString()+": points "+computer.getComputerPoints());
		System.out.println();
		
	}

}
