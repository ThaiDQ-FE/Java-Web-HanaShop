/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.dto;

/**
 *
 * @author thaid
 */
public class OrderHistoryDTO {

    private String productName;
    private String price;
    private String quantity;
    private String date;
    private String image;

    public OrderHistoryDTO() {
    }

    public OrderHistoryDTO(String productName, String price, String quantity, String date, String image) {
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.date = date;
        this.image = image;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "OrderHistoryDTO{" + "productName=" + productName + ", price=" + price + ", quantity=" + quantity + ", date=" + date + '}';
    }

}
