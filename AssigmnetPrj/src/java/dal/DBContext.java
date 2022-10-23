package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    protected Connection connection;

    public DBContext() {   
        try {
            String user = "sa";// sửa tên đăng nhập
            String password = "123456";// sửa tùy theo máy của mỗi người
            String url = "jdbc:sqlserver://localhost:1433;databaseName=FlowerShop";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, password);  
            System.out.println("OK");
        }catch (ClassNotFoundException | SQLException ex) {
            System.out.println("fail");
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
