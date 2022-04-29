package Ch07;

interface Coin {
    int PENNY = 1, NICKEL = 5 , DIME = 10, QUARTER = 25;
    // public static final int -> 상수
    void printCoin(); 
}

class Coins implements Coin {
    public void printCoin() {
        System.out.println("Coins....");
    }
}

public class Coin1Demo {
    public static void main() {
        Coins c = new Coins();
        System.out.println("Dime은" + Coin.Dime + "센트입니다.");
    }
}
