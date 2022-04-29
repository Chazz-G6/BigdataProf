package Ch04;

import javax.lang.model.util.ElementScanner14;

class Printer { 
    private int numOfPapers = 0;
    private boolean duplex;

    void paperAdd() {
        int i = 100;
        this.numOfPapers = numOfPapers;

        numOfPapers += i;
        System.out.println("종이를" + i + "장 추가하였습니다.\n");
    }
    void paperCount() {
        System.out.println("현재 프린터에 남아있는 종이는" + numOfPapers + "장 입니다.\n");
    }
    public boolean getDuplex() {
        this.duplex = duplex;
        if(duplex == false) {
            return false;
        }
        else
            return true;
    }
    public void setDuples(boolean duplex) {
        if(duplex == true){
            
        }
        
            
    }
    public void print(int amount) {
        if(numOfPapers<amount){
            System.out.println("용지" + amount + "장을 인쇄합니다.\n");
            System.out.println("모두 출력하려면 용지가" + (amount-numOfPapers) + "장 부족합니다.  " + numOfPapers + "장만 출력합니다.\n");
            numOfPapers = 0;
            System.out.println("현재" + numOfPapers + "장 남아 있습니다.");
        }
        else {
        numOfPapers -= amount;
        System.out.println("용지" + amount + "장을 인쇄합니다.\n");
        System.out.println("현재" + numOfPapers + "장 남아 있습니다.\n");
        }
        
    }
}
public class PrinterTest {
    public static void main(String[] args) {

        System.out.println("프린터를 테스트 합니다.\n\n");

        Printer myPrinter;
        myPrinter = new Printer();
        myPrinter.paperCount(); 
        myPrinter.paperAdd();
        myPrinter.paperCount();
        myPrinter.print(10);
        myPrinter.print(20);
        myPrinter.setDuples(true);
    
        

    }
}
