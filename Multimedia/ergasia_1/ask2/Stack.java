import java.io.*;

// implementation of a pushdown stack
public class Stack<Item> {

    /* enter your code! */
    private Character[] S; 
    private int N;
    Stack(int maxN) { 
        S = new Character[maxN]; 
        N=0; 
    }
    boolean isEmpty() { 
        return (N == 0); 
    }
    void push(Character item) { 
        S[N++] = item; 
    }
    Character pop() { 
        Character t = S[--N]; S[N] = null; 
        return t; 
    }
}
