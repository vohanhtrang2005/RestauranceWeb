/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Statement; // ✅ Chính xác, dùng cho RETURN_GENERATED_KEYS

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.ArrayList;
import model.OrderItem;

/**
 *
 * @author XUAN_SANG_PC
 */
public class OrderItemDAO {

    public static ArrayList<OrderItem> OrderItem() {
        DBContext db = new DBContext();

        ArrayList<OrderItem> OrderItemList = new ArrayList<>();
        try {
            String sql = "select * from OrderItems ";
            PreparedStatement statement = db.getConnection().prepareStatement(sql);//3 cbi cau lenh sql

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {

                OrderItem object = new OrderItem(
                        rs.getInt("OrderItemID"),
                        rs.getInt("OrderID"),
                        rs.getInt("ItemID"),
                        rs.getInt("Quantity"));
                OrderItemList.add(object);
            }
        } catch (Exception e) {
            return null;
        }

        if (OrderItemList.isEmpty()) {
            return null;
        } else {
            return OrderItemList;
        }
    }

    public static boolean addOrderItem(int OrderId, int ItemId, int quantity) {
        DBContext db = new DBContext();
        int orderId = -1; // gán mặc định

        try {
            String sql = """
                     INSERT INTO OrderItems(OrderID,ItemID,Quantity)
                     VALUES(?,?,?)
                     """;

            PreparedStatement statement = db.getConnection().prepareStatement(sql);

            statement.setInt(1, OrderId);
            statement.setInt(2, ItemId);
            statement.setInt(3, quantity);

            int rs = statement.executeUpdate();

            if (rs == 0) {
                return false; // không insert được
            }

        } catch (Exception e) {
            e.printStackTrace(); // giúp debug dễ hơn
            return false;
        }

        return true;
    }

}
