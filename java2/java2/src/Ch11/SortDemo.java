package Ch11;
import java.util.*;


public class SortDemo {
    public static void main(String[] args){

        String[] fruits = { "Grape", "Watermelon", "Apple", "Kiwi", "Mango"};
        List<String> list = Arrays.asList(fruits);
        Collections.sort(list, Collections.reverseOrder());
        System.out.println(list);
        Collections.reverse(list);
        System.out.println(list);                              
    }
}
