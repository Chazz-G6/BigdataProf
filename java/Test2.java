

public class Test2 {
    public static void main(String[] args) {
        int x = 5;
        double pi = 3.14;
        int i = 65;
        String s = "java";
        double f = 3.14f;
        System.out.printf("%d\n", i);
        System.out.printf("%o\n", i);
        System.out.printf("%x\n", i);
        System.out.printf("%c\n", i);
        System.out.printf("%5d\n", i);
        System.out.printf("%05d\n", i);
        System.out.printf("%s\n", s);
        System.out.printf("%5s\n", s);
        System.out.printf("%-5s\n", s);
        System.out.printf("%f\n", f);
        System.out.printf("%e\n", f);
        System.out.printf("%4.1f\n", f);
        System.out.printf("%04.1f\n", f);
        System.out.printf("%-4.1f\n", f);
        
        //System.out.printf("x = %d   and   pi = %f \n", (int)x, (float)pi);
    }
    
}
