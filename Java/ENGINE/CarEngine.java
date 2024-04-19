
public class CarEngine {
	//1. The class CarEngine handles simple car engines whose comsuption is determined by the size. The consumption is computed in the method consumption()
	
		private int cc;
		
		public CarEngine(int cc){
			this.cc = cc;
		}
		
		public double consumption(){
			return 3.8*cc/1000.0;
		
	}

}
