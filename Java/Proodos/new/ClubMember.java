
public class ClubMember {
	private int id;
	private int points;
	private double amount;
	
	public ClubMember(int id, double amount){
		this.id = id;
		this.amount = amount;
	}

	public Receipt purchaseItem(Item x){
		if (this.amount >= x.getPrice()){
			points += x.getPoints();
			this.amount -= x.getPrice();
			return new Receipt(x,this,true);
		}
		return null;
	}
	
	public void redeemPoints(){
		amount += points;
		points = 0;
	}
	
	public boolean redeemPoints(Item x){
		if (points >= x.getPrice()){
			points -= (int)x.getPrice();
			return true;
		}
		return false;
	}
	
	public String toString(){
		return id+"";
	}
	
	public boolean equals(ClubMember other){
		return this.id == other.id;
	}

}
