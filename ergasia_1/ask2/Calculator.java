import java.io.* ;
import java.util.concurrent.CountDownLatch;

public class Calculator
{   
    private static void Calculate(String expr) 
    {
        int N=expr.length();
        Stack operator = new Stack(N);
        Stack arithmetic = new Stack(N);
        char[] a = expr.toCharArray();
        /* 
        int counter_brackets_right = 0;
        int counter_brackets_left = 0;
        for (int i = 0; i<N;i++){
            Character c = a[i];
            if (c==')'){
                counter_brackets_right++;
            }
            if (c=='('){
                counter_brackets_left++;
            }
            if (counter_brackets_left!=counter_brackets_right){
                System.out.println("Syntax Erorr at brackets");
                System.exit(0);
            }
        }
        
        
        for (int i=0; i<N; i++)
        {
            Character c = a[i];
            // check next character c
            if ((c>='0')&& (c>='9') ){
                arithmetic.push(c);
            }
            if ((c=='+')|| (c=='*') || (c=='-')){
                operator.push(c);
            }
            if (c==')'){
                int number1 = Integer.parseInt(String.valueOf(arithmetic.pop())); //metatropi se arithmo apo char
                int number2 = Integer.parseInt(String.valueOf(arithmetic.pop())); //metatropi se arithmo apo char
                if(operator.pop()=='+'){
                    int new_number = number1 + number2;
                    arithmetic.push((char)new_number);
                }
                else if(operator.pop()=='*'){
                    int new_number = number1 * number2;
                    arithmetic.push((char)new_number);
                }
                else if(operator.pop()=='-'){
                    int new_number = number1 - number2;
                    arithmetic.push((char)new_number);
                }
            }
        }
        */
        
          
    }
    
    public static void main(String[] args)
    {
        //String expr = args[0];
        
        //System.out.println("Input expression = " + expr + " , length = " + expr.length());
        //int N=expr.length();
        

        char[] array = args[0].toCharArray();
        System.out.println("length :"+array.length);
        System.out.println(args[0]);
        int counter_brackets_right = 0;
        int counter_brackets_left = 0;
        int counter_operator = 0;
        System.out.println(counter_brackets_right);

        for (int i = 0; i<array.length;i++){
            //Character c = array[i];
            if (array[i]==')'){
                counter_brackets_right++;
                System.out.println(counter_brackets_right);
            }
            else if (array[i]=='('){
                counter_brackets_left++;
            }
            else if((array[i]=='+')|| (array[i]=='-')|| (array[i]=='*')){
                counter_operator++;
            }
            
        }
        System.out.println("operator"+counter_operator);
        if(2*counter_operator != (counter_brackets_left+counter_brackets_right)){
            System.out.print("Wrong brackets");
            System.exit(0);
        }
         
        else if (counter_brackets_left!=counter_brackets_right){
            System.out.println("Syntax Erorr at brackets");
            System.exit(0);
        }
        
        else if(counter_brackets_left==0){
            System.out.println("Syntax Erorr at brackets");
            System.out.println("Close programm");
            System.exit(0);
        }
        
        
        //Calculate(expr);
    }
}
