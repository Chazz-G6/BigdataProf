package Ch08;

import javax.swing.plaf.synth.SynthDesktopIconUI;

public class TryCatch2Demo {
    public static void main(String[] args) {
        int dividend = 10;
        try {
            int divisor = Integer.parseInt(args[0]);
            System.out.println(dividend / divisor); 
            }catch (ArrayIndexOutOfBoundsException e) {
                System.out.println("No Elements");
            }catch (NumberFormatException e) {
                System.out.println("Not a Number");
            }catch (ArithmeticException e) {
                System.out.println("Cannot be divided by 0");
            }finally{
                System.out.println("Always Working");
            }

            System.out.println("Shutdown");
    }
}
