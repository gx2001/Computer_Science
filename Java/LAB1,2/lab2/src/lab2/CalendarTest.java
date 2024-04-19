package lab2;

public class CalendarTest {

	public static void main(String[] args) {
		Calendar myCalendar = new Calendar();
		myCalendar.pintCurrentDate();
		
		//for(int i=0;i<31;i++) {
			//myCalendar.advanceByADay();
		//}
		for(int i=0;i<5;i++) {
			myCalendar.advanceByAWeek();
		}
		for (int i = 0; i < 5; i++){
			myCalendar.advanceByAWeek();
			myCalendar.pintCurrentDate();
		}		
	}

}
