package Ch06;

class Box {
    public Box(){
        System.out.println("부모생성자 호출됨");
    }
}


class ColorBox extends Box{
    public ColorBox() {
        System.out.println("자식 생성자 호출됨");
    }
}

public class BoxDemo {
    public static void main(String[] args) {
        ColorBox cbox = new ColorBox();
    }
}
=