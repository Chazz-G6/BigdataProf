package Ch07;


public class Computer implements Controllable {

    @Override
    public void turnOn(){
        System.out.println("Computer를 켠다.");
    }

    @Override
    public void turnOff() {
        System.out.println("Computer를 끈다.");
    }
}
