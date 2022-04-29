package Ch11;

import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.*;

public class EtcDemo {
    public static void main(String[] args){
        List<String> list1
            =List.of("Apple", "Grape", "Watermelon", "Kiwi", "Grape", "Mango", "Apple");

            HashSet<String> set = new HashSet<>(list1);

            List<String> list2 = new ArrayList<>(set);
            Collections.sort(list2);

            System.out.println("Search how many fruits are");

            for (String fruit : list2) {
                System.out.printf("%s : %d\n", fruit,
                Collections.frequency(list1, fruit));
            }
    }
}