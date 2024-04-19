package lab6;

public class TestBankAccount {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		BankAccount myAccount = new BankAccount("Professor");
		myAccount.deposit(1000);
		myAccount.withdraw(2000);
		BankCheck firstCheck = new BankCheck("Professor", 200);
		myAccount.deposit(firstCheck);
		BankCheck secondCheck = new BankCheck("Professore",200);
		myAccount.deposit(secondCheck);
		myAccount.withdraw(500);	
		myAccount.printStatement();
	}
	
}
