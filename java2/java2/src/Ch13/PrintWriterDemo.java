package Ch13;

import java.io.*;

public class PrintWriterDemo {
    public static void main(String[] args) {

        String infile = "C:\\Bigdata\\work\\java2\\java2\\bin\\Ch13\\org.txt";
        String outFile = "C:\\Bigdata\\work\\java2\\java2\\bin\\Ch13\\dup.txt";

        try (BufferedReader br = new BufferedReader(new FileReader(infile)); 
            PrintWriter pr = new PrintWriter(new FileWriter(outFile));) {
                
                br.lines().forEach(x -> pr.println(x));
            }catch (IOException e) {
            }
    }
    
}
