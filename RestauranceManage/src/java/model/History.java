/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 *
 * @author XUAN_SANG_PC
 */
public class History {

    int historyID;
    int orderId;
    String status;
    LocalDateTime updateAt;
    BigDecimal total;
    
    int userId;
    String userName;

    public History() {
    }

    public History(int historyID, int orderId, String status, LocalDateTime updateAt, BigDecimal total,  int userId, String userName) {
        this.historyID = historyID;
        this.orderId = orderId;
        this.status = status;
        this.updateAt = updateAt;
        this.total = total;
        
        this.userId = userId;
        this.userName = userName;
    }

    public int getHistoryID() {
        return historyID;
    }

    public void setHistoryID(int historyID) {
        this.historyID = historyID;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDateTime getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(LocalDateTime updateAt) {
        this.updateAt = updateAt;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }



    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

}
