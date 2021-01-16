/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.dto;

import java.io.Serializable;
import java.util.HashMap;
import thaidq.dao.ProductDAO;

/**
 *
 * @author thaid
 */
public class CartDTO implements Serializable{
    private String custName;
    private HashMap<String, Integer> shoppingCart;

    
    public CartDTO(String custName) {
        this.custName = custName;
        this.shoppingCart = new HashMap<>();
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public HashMap<String, Integer> getShoppingCart() {
        return shoppingCart;
    }

    public void setShoppingCart(HashMap<String, Integer> shoppingCart) {
        this.shoppingCart = shoppingCart;
    }
    
    public void resetCart(){
        this.shoppingCart.clear();
    }
    
    
    public void addToCart(String id){
        int quantity = 1;
        if (this.shoppingCart.containsKey(id)){
            quantity = this.shoppingCart.get(id) + 1;
        }
        this.shoppingCart.put(id, quantity);
    }
    
    public void remove(String id){
        if(this.shoppingCart.containsKey(id)){
            this.shoppingCart.remove(id);
        }
    }
    
    public void update(String id, int quantity){
        if(this.shoppingCart.containsKey(id)){
            this.shoppingCart.put(id, quantity);
        }
    }
    
    public int getTotal() throws Exception{
        int result = 0;
        ProductDAO dao = new ProductDAO();
        for (String id : this.shoppingCart.keySet()) {
            int quantity = this.shoppingCart.get(id);
            int price = Integer.parseInt(dao.findByPK(id).getPrice());
            result += quantity * price;
        }
        return result;
    }

    @Override
    public String toString() {
        return "CartDTO{" + "custName=" + custName + ", shoppingCart=" + shoppingCart + '}';
    }
    
    
}
