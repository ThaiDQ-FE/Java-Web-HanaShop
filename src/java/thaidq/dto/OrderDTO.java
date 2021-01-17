/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.dto;

import java.io.Serializable;

/**
 *
 * @author thaid
 */
public class OrderDTO{
    private String productId;
    private String accountId;

    public OrderDTO() {
    }

    public OrderDTO(String productId, String accountId) {
        this.productId = productId;
        this.accountId = accountId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    @Override
    public String toString() {
        return "OrderDTO{" + "productId=" + productId + ", accountId=" + accountId + '}' + "\n";
    }
    
    
}
