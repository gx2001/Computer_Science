package lab6;

class BankCheck
{
	private String payeeName;
	private double amount;
	
	public BankCheck(String payeeName){
		this.payeeName = payeeName;
	}
	
	public BankCheck(double amount){
		this.amount = amount;
	}
	
	public BankCheck(String payeeName, double amount){
		this.payeeName = payeeName;
		this.amount = amount;
	}
	
	public String getPayeeName(){
		return payeeName;
	}
	
	public void setPayeeName(String payeeName){
		this.payeeName = payeeName;
	}
		
	
	public double getAmount(){
		return amount;
	}
	
	
	public String toString(){
		return "[Check to "+payeeName+ ": "+amount +"E]";
	}
	
	public boolean equals(BankCheck other){
		if (this.payeeName.equals(other.payeeName) 
			&& this.amount == other.amount){
				return true;
		}else{
			return false;
		}
	}
	
}
