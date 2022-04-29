package Ch13;

import java.io.*;

public class CopyFileDemo {
    public static void main(String[] args) {
        
    String input = "C:\\Bigdata\\work\\java2\\java2\\bin\\Ch13\\org.txt";
    String output = "C:\\Bigdata\\work\\java2\\java2\\bin\\Ch13\\dup.txt";


try (FileReader fr = new FileReader(input);
    FileWriter fw = new FileWriter(output)) {
        int c;

        while ((c = fr.read()) != -1)
        fw.write(c);
        }catch (IOException e) {
        }
    }
}
