import java.util.Scanner;

public class ScannerDemo {
    public static void main(String[] args){

        Scanner in = new Scanner(System.in);

        int x = in.nextInt();
        int y = in.nextInt();
        System.out.printf("%d * %d 은 %d 입니다.\n", x, y, x * y);
    
    }
}
