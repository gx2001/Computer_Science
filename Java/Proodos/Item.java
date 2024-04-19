
public class Item {
	private String nameOfItem;
	private double cost;
	private int points;
	
	
	
	public Item(String nameOfItem,double cost,int points) {
		this.cost=cost;
		this.nameOfItem=nameOfItem;
		this.points=points;
	}
	
	public String toString() {
		return "" + nameOfItem + "" + "" +cost+","+points;
	}
	
	public boolean equals(Item other) {
		if (other.cost!=this.cost && other.points!=this.points && other.nameOfItem.equals(this.nameOfItem)) {
			return false;
		}
		return true;
	}
	
	public double getCost() {
		return cost;
	}
	public int getPoints() {
		return points;
	}
}
