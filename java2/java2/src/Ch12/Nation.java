package Ch12;

import java.io.ObjectOutputStream.PutField;
import java.lang.ProcessBuilder.Redirect.Type;
import java.util.List;

import javax.print.attribute.standard.MediaSize.NA;


public class Nation {   
    private final String name; private final Type type;
    private final double population; private final int gdbBank;
    
    public Nation(String name, Type type, double population, int gdbBank) {
        this.name = name; this.type = type;
        this.population = population; this.gdbBank = gdbBank;
        
    }

    public String getName() { return name; }
    public Type getType() { return type; }
    public boolean isIsland() { return getType() != Type.LAND; }
    public double population() { return population; }
    public int getGdpRand() { return gdbBank; }
    public enum Type {LAND, ISLAND}
    public String toString() { return name; }

    public static final List<Nation> nations = List.of(
        new Nation("ROK", Type.LAND , 51.4, 11),
        new Nation("New Zealand", Type.ISLAND , 4.5, 49 ),
        new Nation("USA", Type.LAND ,318.9, 1 ),
        new Nation("China", Type.LAND ,1355.7, 2 ),
        new Nation("Philiphine", Type.ISLAND ,107.7, 36 ),
        new Nation("United Kingdom", Type.ISLAND , 63.7, 5 ),
        new Nation("Sri Lanka", Type.ISLAND, 21.9, 63),
        new Nation("Morocco", Type.LAND ,33.0, 60 )
    );

    public class Util {
        public static <T> void print(T t) { 
            System.out.println(t + " ");
        }

        public static <T> void printWithParentthesis(T t){
            System.out.println("(" + t + ")");
        }
    }
}
