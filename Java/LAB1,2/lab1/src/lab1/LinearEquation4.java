package lab1;

import java.util.Scanner;

public class LinearEquation4 {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		
		String choise ="";
		
		do {
			System.out.println("enter your choise if you want to stop enter no");
			choise = input.next();
			
			System.out.println("Give an alpha and beta ");
			double a = input.nextInt();
			double b = input.nextInt();
			double c =-b/a;
			if(a==0 && b==0) {
				System.out.println("Infinite solution ");
			}
			else if(a==0 && b!=0) {
				System.out.println("No Solution");
				
				}
			else {
				System.out.println("The solution to the equation:" +a +"x" +"+"+ b +"=0 is x=" +c);
			}
			System.out.print("Do you want to solve an equation?");
			choise = input.next();

			
		}while(!choise.equals("no") || choise.equals("NO"));
	}
}
