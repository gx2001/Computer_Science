
public class ClubMember {
	private int memberId;
	private double money;
	private int points;
	
	public ClubMember(int memberId, double money ) {
		this.memberId=memberId;
		this.money=money;
		points=0;
	}
	public boolean purchaseItem(Item myItem) {
		if (money>myItem.getCost() || money == myItem.getCost()) {
			return true;
		}
		else return false;
	}
	public void redeemPoints() {
		this.money+=this.points;
		this.points=0;
	}
	public boolean reedeemPoints(Item myItem) {
		if (points > (int)myItem.getCost()) {
			points = points - (int)myItem.getCost();
			this.points=0;
			return true ;
			
		}
		else return false;
	}
	public String toString() {
		return "Club member :"+memberId;
	}
	public boolean equals (ClubMember other) {
		if(this.memberId==other.memberId) {
			return false;
		}
		else return true;
	}

}
