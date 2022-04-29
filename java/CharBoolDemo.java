import javax.swing.plaf.synth.SynthScrollBarUI;

public class CharBoolDemo {
    public static
void main(String[] aStrings) {
    char ga1 = '가';
    char ga2 = '\uac00';
    char ch;

    ch = 'a';

    boolean cham = true;
    boolean geojit = false;

    System.out.println(ga1);
    System.out.println((int)ga1);
    System.out.println(ga2);
    System.out.println(++ga2);
    System.out.println(cham + "가 아니면" + geojit + "입니다.");
    System.out.println(ch);
}    
}

