package Ch07;
/*
interface Countable {
    void count();

}


class Bird implements Countable {
    String name;
    int num;
    
    public Bird(String name) {
        this.name = name;
    }
    void fly() {

    }

    public void count() {
        System.out.println(name + "가 2마리 있다.");
        
    }
}

class Tree implements Countable {
    String name;
    int num;
    
    public Tree(String name) {
        this.name = name;
    }
    void ripen() {
        
    }

    public void count() {
        System.out.println(name + "가 5그루 있다.");
        
    }
}

public class CoundtableTest {
    public static void main(String[] args) {
        Countable[] m = { new Bird("뻐꾸기"), new Bird("독수리"),new Tree("사과나무"), new Tree("밤나무")};

        for (Countable e : m)
            e.count();

        for (int i = 0; i < m.length; i++) {
            
        }
    }
    
}
*/ //interface


abstract class Countable {
    protected String name;
    protected int num;
    Countable(String name, int num) {
        this.name = name;
        this.num = num;
    }
    abstract void count();

}


class Bird extends Countable {
    String name;
    int num;
    
    public Bird(String name, int num) {
        super(name,num);
    } 
    

    public void count() {
        System.out.println(name + "가 " + num + " 마리 있다.");
        
    }
    void fly() {
        System.out.println(name + " 가 날아 갑니다.");
    }
}
class Tree extends Countable {
    String name;
    int num;
    
    public Tree(String name, int num) {
        super(name,num);
    } 
    
    public void count() {
        System.out.println(name + "가 " + num + " 그루 있다.");
        
    }
    void ripen() {
        System.out.println(name + " 가 흔들립니다.");
    }
}

public class CoundtableTest {
    public static void main(String[] args) {
        Countable[] m = { new Bird("뻐꾸기", 5), new Bird("독수리", 2),new Tree("사과나무", 10), new Tree("밤나무", 7)};

        for (Countable e : m)
            e.count();

        for (int i = 0; i < m.length; i++) {
        
        }
    }
    
}

