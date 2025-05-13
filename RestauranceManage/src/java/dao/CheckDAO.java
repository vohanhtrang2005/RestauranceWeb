/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import model.Order;
import java.util.ArrayList;
import model.MenuItem;
import java.sql.Connection;
/**
 *
 * @author XUAN_SANG_PC
 */
public class CheckDAO {
    public static ArrayList<Order> order() {
    DBContext db = new DBContext();
    ArrayList<Order> orderList = new ArrayList<>();
    try (Connection conn = db.getConnection();
         PreparedStatement statement = conn.prepareStatement("SELECT * FROM Orders");
         ResultSet rs = statement.executeQuery()) {
        if (conn == null) {
            System.err.println("Database connection is null");
            return orderList;
        }
        while (rs.next()) {
            Order order = new Order(
                    rs.getInt("OrderID"),
                    rs.getInt("TableNumber"),
                    rs.getObject("OrderTime", LocalDateTime.class),
                    rs.getString("Status"));
            orderList.add(order);
        }
    } catch (SQLException e) {
        e.printStackTrace();
        System.err.println("Error fetching orders: " + e.getMessage());
    }
    return orderList; // Luôn trả về orderList, kể cả rỗng
}

}
