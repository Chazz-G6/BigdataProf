package Ch06;

public class Circle {
    private void secret() {
        System.out.println("비밀이다. ");
    }

    protected void findRadius() {
        System.out.println("반지름이 10.0센티이다.");
    }

    public void findArea() {
        System.out.println("넓이는 (파이 * 반지름 * 반지름) 이다.");
    }

    public void isType() {
        System.out.println("나는 원입니다.");
    }
}
