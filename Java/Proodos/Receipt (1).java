public class Receipt{

    private final Item item;
    private final ClubMember clubMember;
    private final boolean cash;

    public Receipt(Item item, ClubMember clubMember, boolean cash){
        this.item=item;
        this.clubMember=clubMember;
        this.cash=cash;
    }

    public String toString() {
        return "User: "+clubMember+" purchased item "+item+" with"+ (cash ? "cash" : "points");
    }

    public boolean equals(Receipt other){
        return this.item.equals(other.item)&&this.clubMember.equals(other.clubMember)&&this.cash==other.cash;
    }
}