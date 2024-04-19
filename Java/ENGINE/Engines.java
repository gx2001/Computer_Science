import java.util.ArrayList;
public class Engines {
	
		public static double averageConsumption(ArrayList<CarEngine> myArray){
			//5. The method averageConsumption takes as argument an ArrayList of engines and returns the average of their consumption.
			double sum = 0 ;
			for (CarEngine x : myArray) {
				sum += x.consumption();
			}
			return sum/myArray.size();
		}
		
		public static void main(String[] args){
			//6. Create an ArrayList of engines. 
			ArrayList<CarEngine> myArray = new ArrayList<CarEngine>();
			//7. Create one simple egine of 1500 cc, and a turbo engine of 1400cc with boost coefficient 2.0 and add them to the list
			//8. Use the method averageConsumption to obtain the average consumption of the two engines and print it. 
			CarEngine engine  = new CarEngine(1500);
			myArray.add(engine);
			
			engine = new TurboCarEngine(1400,2);
			myArray.add(engine);
			
			
			double avg = averageConsumption(myArray);
			
			System.out.println(avg);
			
		
		}
		
		
	}


