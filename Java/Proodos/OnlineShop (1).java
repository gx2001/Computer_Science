class OnlineShop{
	public static void main(String[] args){
		ClubMember user = new ClubMember(1111, 600);
		Item fridge = new Item("fridge", 500, 100);
		Item headphones = new Item("headphones", 200, 10);
		Item ticket = new Item("ticket", 10, 2);
        Receipt temp=user.purchaseItem(fridge);
		if (temp!=null){
			System.out.println(temp);
		}
		user.redeemPoints();
        temp=user.purchaseItem(headphones);
		if (temp!=null){
			System.out.println(temp);
		}
        temp=user.redeemPoints(ticket);
		if (temp!=null){
			System.out.println(temp);
		}
	}
}
