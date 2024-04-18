public class ArrayHandler {

    public DefineConstants d = new DefineConstants();
    public int [][]copy ;


    public ArrayHandler(){
    
    }
    public int[][] copyArray(int[][] original , int coordinateX , int coordinateY ,int value){
        copy = new int [d.totalCubes][2];

        for (int i = 0 ; i < d.totalCubes;i++){
            copy[i][0] = original[i][0];
            copy[i][1] = original[i][1];
        }
        copy[value][0] = coordinateX;
        copy[value][1] = coordinateY; 
        return copy;
    }
    
}
