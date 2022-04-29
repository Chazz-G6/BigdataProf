package Ch13;
import java.io.*;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class IOTest {
    public static void main(String[] args) {
        String fileName = "C:\\Bigdata\\work\\java2\\java2\\bin\\Ch13\\file.txt";
        


        try {
            byte[] buf = new byte[100];

            FileInputStream fis = new FileInputStream(fileName);
            BufferedInputStream bis = new BufferedInputStream(fis);

            fis.close();
            bis.close();

        }catch(FileNotFoundException ex) {
                System.out.println(ex.getMessage() );
        }catch(IOException ex){
                System.out.println(ex.getMessage() );
        }
    
    }
}
//파일 입출력/ 스트림, 리더 형태로 각각 바이트와 문자.
