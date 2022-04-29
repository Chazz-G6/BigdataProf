package Ch03;

public class While2Demo { //구구단을 반복문 2개로 구현하는 코드
    public static void main(String[] args){
        int row = 2;  // row(행)을 2로 설정하여 2단부터 시작
        while (row <10){ // 10보다 작을 때 까지만 반복하여 9단까지 구현
            int column = 1; //col(열)dmf 1로 설정하여 x단의 1곱 숫자부터 구현
            while (column < 10){ //10보다 작을 떄 까지만 반복하여 9곱까지 구현
                System.out.printf("%4d", row * column); 
                column++;
            }
            System.out.println();
            row++;
        }
    }
}
