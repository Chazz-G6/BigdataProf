import java.util.Scanner;

public class Hello2 {
	public static void main(String[] args){

		Scanner in = new Scanner(System.in);
		
		int max;
		int x = in.nextInt();
        int y = in.nextInt();
        

		max = x > y ? x : y;

		System.out.printf("%d 와 %d 중 더 큰 값은 %d 입니다.\n", x, y, max);

	}
}