package Ch13;

import java.io.*;

import javax.sql.rowset.spi.SyncResolver;

public class StreamReaderDemo {
    public static void main(String[] args) {
        String input = "C:\\Bigdata\\work\\java2\\java2\\bin\\Ch13\\org.txt";

        try (FileInputStream fi = new FileInputStream(input);
        InputStreamReader in = new InputStreamReader(fi, "US-ASCII")) {
            int c;
            System.out.println(in.getEncoding());
            while ((c = in.read()) != -1)
            System.out.println((char)c);
        } catch (IOException e) {
        }
    }
}
