/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.MenuItem;

/**
 *
 * @author XUAN_SANG_PC
 */
public class MenuItemsDAO {
    public MenuItemsDAO() {
        super();
    }
    
    
      public static ArrayList<MenuItem> getAccount( ) {
        
          DBContext db =  new DBContext();
         
        ArrayList<MenuItem> objects = new ArrayList<MenuItem>();//khoi tao connection
        try {
            String sql = """
                         select * 
                         from MenuItems
                         """;//2 
            PreparedStatement statement = db.getConnection().prepareStatement(sql);//3 cbi cau lenh sql
         
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                if (rs.getInt("Available")==0) {continue;} 
                MenuItem object = new MenuItem(
                        rs.getInt("ItemID"),
                        rs.getString("Name"),
                        rs.getString("Description"),
                        rs.getBigDecimal("Price"),
                        rs.getInt("Available"));
                objects.add(object);
            }
        } catch (Exception e) {
            return null;
        }

        if (objects.isEmpty()) {
            return null;
        } else {
            return objects;
        }
    }  
    

  
}
