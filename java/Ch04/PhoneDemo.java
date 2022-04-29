package Ch04;


class Phone {
    String model;
    int value;
    int nUsing; // 1 : 사용중   0 : 대기
    Phone() {
        System.out.println("생성자 호출");
    }
    void print() {
        System.out.println(value + " 만원 짜리 " + model + " 스마트폰 ");
    } 
    void printState(){
        if ( nUsing == 1)
            System.out.println(" 기기 사용 중");
        else
            System.out.println(" 기기 대기 중");
    }
}
public class PhoneDemo {
    public static void main(String[] args){
        Phone myPhone;
        myPhone = new Phone();
        myPhone.model = "갤럭시 S22";
        myPhone.value = 100;
        myPhone.print();
        myPhone.nUsing = 1;
        myPhone.printState();

        myPhone.nUsing = 0;
        myPhone.printState();

        /*
        Phone yourPhone = new Phone();
        yourPhone = new Phone();
        yourPhone.model = "아이폰 14";
        yourPhone.value = 200;
        yourPhone.print();*/
    }
}