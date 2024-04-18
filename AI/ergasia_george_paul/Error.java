public class Error {
    status st ;

    public Error(){
        
    }
    public Boolean memoryError(status st){
        this.st = st;
        if (st == null){
            System.out.println("Error in create of a new Status \n Exception in thread  java.lang.OutOfMemoryError: Java heap space");
            return true ;
        }
        return false;
    }
    public Boolean queueError(status st){
        this.st = st;
        if (st == null){
            System.out.println("Error initialize queue");
            return true;
        }
        return false;
    }
}
