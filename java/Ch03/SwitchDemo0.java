package Ch03;
import java.util.Scanner;


public class SwitchDemo0 {
    public static void main(String[] args){

        Scanner in = new Scanner(System.in);
        int number = in.nextInt();

        switch (number / 10) {
            case 10:
            case 9:
                System.out.println("A");
                break;
            case 8:
                System.out.println("B");
                break;
            case 7:
                System.out.println("C");
                break;
            case 6:
                System.out.println("D");
                break;    
            default :
                System.out.println("F");
        }
        in.close();
    }
    
}