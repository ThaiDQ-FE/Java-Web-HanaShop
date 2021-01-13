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
public class HistoryDTO {

    private String fullname;
    private String action;
    private String date;
    private String productId;

    public HistoryDTO() {
    }

    public HistoryDTO(String fullname, String action, String date, String productId) {
        this.fullname = fullname;
        this.action = action;
        this.date = date;
        this.productId = productId;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

}
