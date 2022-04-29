package Ch08;

public class TryCatch3Demo {
    public static void main(String[] args) throws ArrayIndexOutOfBoundsException {
        int[] array = { 0, 1, 2 };
        try {
            int x = array[3];
        } catch (Exception e) {
            System.out.println("Oooops!");
        }
        System.out.println("종료"); 
    }
}
