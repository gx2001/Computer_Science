import java.util.Scanner;

public class Askisi1a
{
	public static void main(String[] args)
	{
		Board b=new Board();
		b.UCS();
		System.out.printf("To num_of_states einai %d.\n",b.number_of_states);
		System.out.printf("To num_of_parents einai %d.\n",b.number_of_parents);
	}

}
