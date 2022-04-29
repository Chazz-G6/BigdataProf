package Ch03;

import java.util.Scanner; //스캐너 호출

public class IfElseDemo {
    public static void main(String[] args){
        Scanner in = new Scanner(System.in);
        System.out.println("숫자를 입력하세요 : ");
        int number = in.nextInt();        
        if (number % 2 == 0) // 입력받은 수가 2로 나누었을 때에 나머지가 0일 시(짝수)
            System.out.println("짝수 입니다."); //를 출력     
        else
            System.out.println("홀수 입니다.");

        System.out.println("종료");;
        in.close();
    }

    
}
