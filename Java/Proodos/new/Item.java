
public class Item {
	private String name;
	private double price;
	private int points;
	
	public Item(String name, double price, int points){
		this.name = name;
		this.price = price;
		this.points = points;
	}
	
	public double getPrice(){
		return price;
	}
	
	public double getPoints(){
		return points;
	}
	
	
	public String toString(){
		return name+":"+price +","+points;
	}
	
	public boolean equals(Item other){
		return this.name.equals(other.name) && this.price == other.price && this.points == other.points;
	}

}
