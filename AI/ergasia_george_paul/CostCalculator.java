public class CostCalculator {

    public double costReturn = 0.0;
    public double y ;
    public double newY;
    public double Dy;
    public double oldCost;
    public double newCost;
    public double returnCost;  

    public CostCalculator(double y , double newY , double oldCost){
        this.y = y ;
        this.newY = newY;
        this.oldCost = oldCost; 
        this.Dy = newY - y;
    }

    public double getCost(){
        if( Dy > 0){
            return returnCost = oldCost + Dy; 
        }
        else if(Dy < 0){
            return returnCost = oldCost + 0.5*(-Dy);
        }
        else{
            return returnCost = oldCost + 0.75;
        }
    }
    
}
