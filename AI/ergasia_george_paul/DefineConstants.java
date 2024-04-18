import java.util.Scanner;
class DefineConstants
{
	public int counter = 1;
	public static final String inititialize = " ### ------------------- [ Board ] ---------------------- ### ";
	public  String state = "### ------------------- [ State "+ counter+ " ]---------------------- ### ";
	
	public static final int K=getK();
	
	public static final int getK(){
		Scanner keyboard=new Scanner(System.in);
		System.out.print("Give a K: ");
		int numK;

		do {
			while(!keyboard.hasNextInt()){
				System.out.println("Error input \nGive a K: ");
				keyboard.next();
			}
			numK = keyboard.nextInt();
		}while(numK < 0 );
		//numK = keyboard.nextInt() ;
		return numK;
	}
	
	public void initializeBoard(){
		Board = new String[3][];
		Board[0] = new String[fisrtLine];
		Board[1] = new String[K];
		Board[2] = new String[K];

		for (int j = 0 ;  j< Board[0].length; j++ ){
            Board[0][j] =  "*";
        }
        for (int j = 0 ;  j< Board[1].length; j++ ){
            Board[1][j] =  "*";
        }
        for (int j = 0 ;  j< Board[1].length; j++ ){
            Board[2][j] =  "*";
        }
	}
	public String  stateCounter(int counter){
		this.counter = counter;
		String stateBegin = "### ------------------- [ State " ; 
		String stateEnd =  " ]---------------------- ### ";
		String stateReturn = stateBegin+counter+stateEnd;
		return stateReturn ;
	}

	public int fisrtLine = K *4;
	public int totalCubes = K*3;

	public String [][] Board ;
	// method which print the Board with its Coordinates //
	public void printBoard(){
		//String [][] Board ;

		System.out.println(inititialize);
		Boolean x = false ; 
		for(int i = Board.length - 1 ; i>= 0 ;i--){
			System.out.print(i+"| ");
			for(int j = 0 ; j < Board[i].length;j++){
				System.out.print(Board[i][j] + " ");
			}
			if(i>=0)
			System.out.println();
		}
		//System.out.println();
		System.out.print("   ");
        if (x == false){
            for(int i = 0 ; i< fisrtLine;i++){
                System.out.print("_ ");
            }
        }
        System.out.println();
        System.out.print("   ");
		for(int i = 0 ; i< fisrtLine;i++){
			System.out.print(i+" ");
		}
		System.out.println();
	}


	public void statusPrint(int[][] statusList){
		System.out.println(state);
		int coordinateX = 0 ;
		int coordinateY = 0 ;
		//System.out.println(Board.length);
		for(int i = 0 ; i < 3*K;i++){
			coordinateX = statusList[i][1];
			coordinateY = statusList[i][0];
			Board[coordinateX][coordinateY] = Integer.toString(i);
		}

		Boolean x = false ; 
		for(int i = Board.length - 1 ; i>= 0 ;i--){
			System.out.print(i+"| ");
			for(int j = 0 ; j < Board[i].length;j++){
				System.out.print(Board[i][j] + " ");
			}
			if(i>=0)
			System.out.println();
		}
		System.out.print("   ");
        if (x == false){
            for(int i = 0 ; i< fisrtLine;i++){
                System.out.print("_ ");
            }
        }
        System.out.println();
        System.out.print("   ");
		for(int i = 0 ; i< fisrtLine;i++){
			System.out.print(i+" ");
		}
	}


	public void statusPrint(int[][] statusList , int counter){

		System.out.println(stateCounter(counter));

		int coordinateX = 0 ;
		int coordinateY = 0 ;
		//System.out.println(Board.length);
		for(int i = 0 ; i < 3*K;i++){
			coordinateX = statusList[i][1];
			coordinateY = statusList[i][0];
			Board[coordinateX][coordinateY] = Integer.toString(i);
		}

		Boolean x = false ; 
		for(int i = Board.length - 1 ; i>= 0 ;i--){
			System.out.print(i+"| ");
			for(int j = 0 ; j < Board[i].length;j++){
				System.out.print(Board[i][j] + " ");
			}
			if(i>=0)
			System.out.println();
		}
		System.out.print("   ");
        if (x == false){
            for(int i = 0 ; i< fisrtLine;i++){
                System.out.print("_ ");
            }
        }
        System.out.println();
        System.out.print("   ");
		for(int i = 0 ; i< fisrtLine;i++){
			System.out.print(i+" ");
		}
	}

	public void printCoordinates(int[][] array , int flag){

		if (flag == 0){
			System.out.println("Choosen Coordinates");
			for(int i =0 ; i<totalCubes;i++){
				System.out.println("(x"+array[i][0] +",y" +array[i][1]);
			}
		}
	}
}
