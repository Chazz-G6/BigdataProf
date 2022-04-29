package Ch13;


import java.io.*;
import java.nio.file.*;
import java.util.List;
import java.nio.charset.Charset;

public class Files2Demo {
    public static void main(String[] args) throws Exception{
        Charset cs = Charset.defaultCharset();
        Path p = new File("C:\\Bigdata\\work\\java2\\java2\\bin\\Ch13\\new.txt").toPath();

        if (Files.notExists(p))
            Files.createFile(p);

        byte[] data = "좋은 아침! \n2잘 가세요! \n".getBytes();
        Files.write(p, data, StandardOpenOption.APPEND);

        try {
            List<String> lines = Files.readAllLines(p, cs);

            for (String line : lines)
            System.out.println(line);
            
        }catch (IOException e){

        }
    }
}
