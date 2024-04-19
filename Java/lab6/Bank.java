package lab6;

import java.util.HashMap;

public class Bank {
	private HashMap <String,BankAccount> myMap = new  HashMap <String,BankAccount>();
	
	
	public void addAccount(BankAccount account) {
		String newName = account.getName();
		if(myMap.containsKey(newName)== false)  {
			myMap.put(account.getName(), account);
		}
		else {
			System.out.println("This name already exist");
		}
		
	}

	public void  printAccountStatement(String name ) {
		
		
		if (myMap.containsKey(name)) {
			
			myMap.get(name).printStatement();
		}
		else {
			System.out.println("This name is not exist");
		}
	}
	public void printAccounts() { 
		System.out.println("Bank accounts:");
		for(String w: myMap.keySet()){
		    System.out.println(w+":"+myMap.get(w));
		}	
	}
}
