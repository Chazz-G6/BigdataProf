package Ch09;

public class TryCatchDemo {
    public static void main(String[] args) {
        int[] array = { 0, 1, 2};

        try{
            System.out.println("First element -> " + array[0]);
            System.out.println("Last element -> " + array[3]);
        }catch(ArrayIndexOutOfBoundsException e){
            System.out.println("No element");
        }
        System.out.println("Program shutdown");
    }
}
