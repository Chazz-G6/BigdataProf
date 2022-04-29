package Ch11;
import java.util.Arrays;
import java.util.List;

import javax.sql.rowset.spi.SyncResolver;


public class ListDemo {

    public static void main(String[] args){
    String[] animals1 = {"사슴", "호랑이", "바다표범", "곰"};

        List<String> animals2 = Arrays.asList(animals1);
        animals2.set(1, "앵무새");
        //anials2.add("늑대");

        for (String s : animals2)
        System.out.println(s + " ");
        System.out.println();

        animals2.sort((x,y) -> x.length() - y.length());
        String[] animals3 = animals2.toArray(new String[0]);
        for (int i = 0; i < animals3.length; i++)
        System.out.println(animals3[i] + " ");
        System.out.println();

        List<String> car = List.of("그랜저", "소나타", "아반테", "제네시스");

        car.forEach(s -> System.out.println(s + " "));
    

}

}
