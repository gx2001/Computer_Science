
public class Receipt {
	
	private Item myItem;
	private ClubMember clubMember;
	private boolean isBuy;
	
	
	public Receipt() {
		
	}
	public Receipt(Item myItem,ClubMember clubMember,boolean isBuy) {
		this.myItem=myItem;
		this.clubMember=clubMember;
		this.isBuy=isBuy;
		
		
		
	}
	
	public boolean equals(Receipt other) {
		return this.myItem.equals(other.myItem)&&this.clubMember.equals(other.clubMember)&&this.isBuy==other.isBuy;
	}
	public String toString () {
		return "User : "+clubMember+"purchased item "+ myItem +" with " + "cash  points";
	}
	

}
