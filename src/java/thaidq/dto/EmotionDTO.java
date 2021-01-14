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
public class EmotionDTO {
    private String emotion;
    private String accountId;
    private String productId;

    public EmotionDTO() {
    }

    public EmotionDTO(String emotion, String accountId, String productId) {
        this.emotion = emotion;
        this.accountId = accountId;
        this.productId = productId;
    }

    public String getEmotion() {
        return emotion;
    }

    public void setEmotion(String emotion) {
        this.emotion = emotion;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }
    
    
}
