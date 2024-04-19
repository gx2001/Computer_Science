package lab1;
import java.util.Scanner;

public class LinearEquation1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("Give an alpha and beta ");
		Scanner input = new Scanner(System.in);
		double a = input.nextInt();
		double b = input.nextInt();
		double c =-b/a;
		System.out.print("The solution to the equation:" +a +"x" +"+"+ b +"=0 is x=" +c);
		
	}

}
