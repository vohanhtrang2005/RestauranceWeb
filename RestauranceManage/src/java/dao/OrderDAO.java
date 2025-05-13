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
//https://grok.com/chat/1eecf73f-f44c-4242-bfe0-5c82df962f4c
public class OrderDAO {
    //thêm vào list
    //hiện thị danh sách
    //tạo đăng nhập cho nhân viên
    //hiện thị danh sách order
    //ấn trong mỗi order sẽ sang 1 trang, hoặc hiện 1 bảng order item

    public static ArrayList<Order> order() {
        DBContext db = new DBContext();
        ArrayList<Order> orderList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Orders order by OrderTime DESC ";
            PreparedStatement statement = db.getConnection().prepareStatement(sql);//3 cbi cau lenh sql
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order obj = new Order(
                        rs.getInt("OrderID"),
                        rs.getInt("TableNumber"),
                        rs.getTimestamp("OrderTime").toLocalDateTime(),
                        rs.getString("Status")
                );
                orderList.add(obj);
            }
        } catch (Exception e) {
            return null;
        }

        if (orderList.isEmpty()) {
            return null;
        } else {
            return orderList;
        }
    }

    public static ArrayList<Order> getOrdersByDate(String date) {
        ArrayList<Order> orders = new ArrayList<>();
        DBContext db = new DBContext();
        try {
            String sql = "SELECT * FROM Orders WHERE CAST(OrderTime AS DATE) = ? order by OrderTime DESC";
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            statement.setString(1, date);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("OrderId"));
                order.setTableNumber(rs.getInt("TableNumber"));
                order.setOrderTime(rs.getTimestamp("OrderTime").toLocalDateTime());
                order.setStatus(rs.getString("Status"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public static ArrayList<String> getOrderDates() {
        ArrayList<String> dates = new ArrayList<>();
        DBContext db = new DBContext();
        try {
            String sql = "SELECT DISTINCT CAST(OrderTime AS DATE) AS orderDate FROM Orders ORDER BY orderDate DESC";
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                dates.add(rs.getString("orderDate"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dates;
    }

    public static int AddOrder(int tableNumber) {
        DBContext db = new DBContext();
        int orderId = -1; // gán mặc định

        try {
            String sql = """
                     INSERT INTO Orders(TableNumber)
                     VALUES(?)
                     """;

            PreparedStatement statement = db.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, tableNumber);

            int rs = statement.executeUpdate();

            if (rs == 0) {
                return -1;
            }

            ResultSet generatedKeys = statement.getGeneratedKeys();
            if (generatedKeys.next()) {
                orderId = generatedKeys.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }

        return orderId;
    }
 public static boolean updateStatus(int orderId, String newStatus) {
    DBContext db = new DBContext();
    try {
        String sql = "UPDATE Orders SET Status = ? WHERE OrderId = ?";
        PreparedStatement statement = db.getConnection().prepareStatement(sql);
        statement.setString(1, newStatus);
        statement.setInt(2, orderId);
        int rowsAffected = statement.executeUpdate();
        return rowsAffected > 0; 
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false; 
}
   public static String getStatus(int OrderID) {
     
        DBContext db = new DBContext();
        String sql = "";
        try {
             sql = "SELECT Status FROM Orders where OrderID=?";
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
             statement.setInt(1, OrderID);
            ResultSet rs = statement.executeQuery();
           if (rs.next()) {
            return rs.getString("Status");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
        return null;
}
}
//tạo update 
//gửi sang servlet mới
//update luôn ở servlet đấy