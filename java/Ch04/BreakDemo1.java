package Ch04;

public class BreakDemo1 {
    public static void main(String[] args) {
        for (int i = 0; i < 101; i++) {       
            if (i % 3 == 0 && i % 5 == 0)
            {                
                System.out.println(i);
                continue;
            }                      
        }
    }
}     