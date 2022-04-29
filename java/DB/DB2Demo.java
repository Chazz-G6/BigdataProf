package DB;
import java.sql.*;

public class DB2Demo {
            STringB


    public static void main(String[] args) throws SQLException {
        Connection con = makeConnection();
        Statement stmt = con.createStatement();

        String sql = "INSERT INTO person (name, phone, email) VALUES "
            + "('임꺽정', '010-4444-4444', 'lim@four.com')";

        if (stmt.executeUpdate(sql) == 1)
            System.out.println("레코드 추가 성공");
        else
            System.out.println("레코드 추가 실패");

        con.close();
        stmt.close();
    }
}
