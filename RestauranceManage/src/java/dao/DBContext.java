package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {
    protected Connection connection;
     public Connection getConnection() {
        return connection;
    }
    public DBContext()
    {
        try {
            // Edit URL , username, password to authenticate with your MS SQL Server
            String url = "jdbc:sqlserver://DESKTOP-EKDTVUU:1433;databaseName=RestaurantDatabase";
            String username = "sa";
            String password = "admin";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }
    
    
    
    
    
    
    
    
    
}
