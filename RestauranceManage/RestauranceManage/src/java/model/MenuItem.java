/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.math.BigDecimal;
/**
 *
 * @author XUAN_SANG_PC
 */
public class MenuItem {
   private int itemId;
    private String name;
    private String description;
    private BigDecimal price;   
    private int available;

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int isAvailable() {
        return available;
    }

    public void setAvailable(int available) {
        this.available = available;
    }

    public MenuItem() {
    }

    public MenuItem(int itemId, String name, String description, BigDecimal price, int available) {
        this.itemId = itemId;
        this.name = name;
        this.description = description;
        this.price = price;
        this.available = available;
    }
    
    
    
}
