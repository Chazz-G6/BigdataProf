package Ch05;

public class Circle {

    int radius;

    public Circle(int radius){
        this.radius = radius;
    }

    private void secret() {
        System.out.println("비밀이다. ");
    }

    protected void findRadius() {
        System.out.println("반지름이 10.0센티이다.");
    }

    public void draw() {
        System.out.println("원을 그리다.");
    }

    public double findArea() {
       return pi * radius * radius;
    }

    public void isType() {
        System.out.println("나는 원입니다.");
    }
}
