package Daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseConnection {

    private static final String url ="jdbc:mysql://localhost:3306/gestionConstruction";
    private static final String user = "root";
    private static final String passWord = "0000";

    public static Connection getConnection(){
        Connection connection;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url , user , passWord);
            System.out.println("connection suuccess");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        }
        return connection;
    }
}
