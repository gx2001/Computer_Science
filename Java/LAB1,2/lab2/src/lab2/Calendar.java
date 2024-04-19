package lab2;

public class Calendar {
	int date=1;
	int month=1;
	int year=2021;
	
	public void pintCurrentDate () {
		System.out.println("Current date is " + date +"/"+ month +"/"+ year );
	}
	public void advanceByAMonth () {
		if (month==12) {
			month=1;
			year=year+1;
			System.out.println(" " + date +"/"+ month +"/"+ year);
		}
		else {
			month=month+1;
			System.out.println(" " + date +"/"+ month +"/"+ year);
		}
	}
	public void advanceByADay() {
		if(date>30) {
			date=1;
			month=month+1;
			System.out.println(" " + date +"/"+ month +"/"+ year);
		}
		if(date>30 && month>12) {
			date=1;
			month=1;
			System.out.println(" " + date +"/"+ month +"/"+ year);
				
		}
		else {
			date=date+1;
			System.out.println(" " + date +"/"+ month +"/"+ year);
		}
	
	}
	public void advanceByAWeek(){
		date =date +7;
		if (date > 30){
			date =date- 30;
			month =month + 1;
		}
		if (month > 12){
			month = 1;
			year=year+1;
		}
	}
}
