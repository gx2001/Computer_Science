
class TurboCarEngine extends CarEngine
{
	private double boost;
	private double consumption;
	public TurboCarEngine(int cc, double boost){
		//3. The constructor initializes the size (cc) and the boost coefficient of the engine.
		super(cc);
		this.boost=boost;
	}
	
	public double consumption(){
		//4. The consumption is computed as the consumption of a simple car engine multiplied by the boost coefficient
		return super.consumption() * boost;
	
	}
	
	
	
}