package Ch08;




public class CarTest {
    public static void main(String[] args) {
        Car myCar = new Car("그랜저","2021");
        Car yourCar = new Car("그랜저","2021");

        
                                                                                        


        if (myCar.equals(yourCar))
            System.out.println("내 자동차는 " + myCar + 
            ", 네 자동차는 " + yourCar + "로 모델이 같다.");
        else
            System.out.println("내 자동차는 " + myCar + 
            ", 네 자동차는 " + yourCar + "으로 모델이 다르다.");
        
    }
    
}
