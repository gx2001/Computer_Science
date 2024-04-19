package lab6;

import java.util.ArrayList;

class BankAccount
{
	private String name;
	private double balance;
	private ArrayList<String> log = new ArrayList<String>();
	
	public BankAccount(String name){
		this.name = name;
	}
	
	public void deposit(double amount){
		log.add("Deposit of" + amount + " euros" );
		balance += amount;
	}
	
	public boolean deposit(BankCheck check){
		if (this.name.equals(check.getPayeeName())){
			balance += check.getAmount();
			log.add("Deposit of check: "+check);
			return true;
		}
		return false;
	}
	
	public double withdraw(double amount){
		if (balance < amount){
			return 0;
		}else{
			balance -= amount;
			log.add("Withdrawal of " + amount + " euros" );
			return amount;
		}
	}
	
	public String getName(){
		return name;
	}
	
	public void printStatement(){
		System.out.println(name+" account:");
		System.out.println("The balance in the account is "+balance+" euros" + "\n"  + "Trancisions" );
		for (int i =0 ; i<log.size() ;i++) {
			System.out.print(log.get(i));
			
		}
	}
	
	public String toString(){
		return name+" account";
	}
	
}
