package Ch03;

import java.util.Scanner; //스캐너 호출

public class SimpleIfDemo {
    public static void main(String[] args){
        Scanner in = new Scanner(System.in); //스캐너 객체 생성 'in'
        System.out.println("숫자를 입력하세요 : ");
        int number = in.nextInt();  // 스캐너 객체 in.호출하고 
        //정수 입력 메서드인 nextInt로 입력 받은 값을 int number에 대입.

        /*
        if (number % 2 == 0) // 입력받은 수가 2로 나누었을 때에 나머지가 0일 시(짝수)
            System.out.println("짝수 입니다."); //를 출력
        if (number % 2 == 1) // 입력받은 수가 2로 나누었을 떄에 나머지가 1일 시(홀수)
            System.out.println("홀수 입니다."); //를 출력
        */
        in.close();
        if (number % 3 == 0) // 입력받은 수가 3으로 나누었을 때에 나머지가 0일 시(3의 배수)
            System.out.println("3의 배수 입니다.");
        else
            System.out.println("3의 배수가 아닙니다.");

        System.out.println("종료");;
    }

    
}
