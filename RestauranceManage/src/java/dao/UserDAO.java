/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.User;

/**
 *
 * @author XUAN_SANG_PC
 */
public class UserDAO {

    public static User getAccountByUserAndPassword(String userName, String password) {
        DBContext db = new DBContext();
        ArrayList<User> accounts = new ArrayList<User>();//khoi tao connection
        try {
            String sql = """
                         select * 
                         from Users
                         where Username = ? and Password = ?
                         """;//2 
            PreparedStatement statement = db.getConnection().prepareStatement(sql);//3 cbi cau lenh sql
            statement.setString(1, userName);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User user = new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6));
                accounts.add(user);
            }
        } catch (Exception e) {
            return null;
        }

        if (accounts.isEmpty()) {
            return null;
        } else {
            return accounts.get(0);
        }
    }


}
