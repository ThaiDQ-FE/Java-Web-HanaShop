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
public class ProductDTO {

    private String productId;
    private String productName;
    private String quantity;
    private String description;
    private String cateID;
    private String price;
    private String status;
    private String date;
    private String image;
    private String sort;
    private int quantityCart;

    public ProductDTO() {
    }

    public ProductDTO(String productId, String productName, String quantity, String price, String image) {
        this.productId = productId;
        this.productName = productName;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
    }
    
    

    public ProductDTO(String productId, String productName, String quantity, String description, String cateID, String price, String status, String date, String image, String sort) {
        this.productId = productId;
        this.productName = productName;
        this.quantity = quantity;
        this.description = description;
        this.cateID = cateID;
        this.price = price;
        this.status = status;
        this.date = date;
        this.image = image;
        this.sort = sort;
    }
    
    

    public ProductDTO(String productId, String productName, String quantity, String description, String cateID, String price, String status, String date, String image) {
        this.productId = productId;
        this.productName = productName;
        this.quantity = quantity;
        this.description = description;
        this.cateID = cateID;
        this.price = price;
        this.status = status;
        this.date = date;
        this.image = image;
    }


    public ProductDTO(String productName, String quantity, String description, String cateID, String price, String status, String date, String image) {
        this.productName = productName;
        this.quantity = quantity;
        this.description = description;
        this.cateID = cateID;
        this.price = price;
        this.status = status;
        this.date = date;
        this.image = image;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public int getQuantityCart() {
        return quantityCart;
    }

    public void setQuantityCart(int quantityCart) {
        this.quantityCart = quantityCart;
    }
    
    

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCateID() {
        return cateID;
    }

    public void setCateID(String cateID) {
        this.cateID = cateID;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "productId=" + productId + ", productName=" + productName + ", quantity=" + quantity + ", description=" + description + ", cateID=" + cateID + ", price=" + price + ", status=" + status + ", date=" + date + ", image=" + image + ", sort=" + sort + ", quantityCart=" + quantityCart + '}';
    }

    

    

    

    
}
