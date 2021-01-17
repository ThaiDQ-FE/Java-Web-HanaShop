/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import thaidq.dto.OrderDTO;
import thaidq.utils.DBConnection;
import thaidq.utils.GetCurrentDate;

/**
 *
 * @author thaid
 */
public class OrderDAO implements Serializable{
    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;
    
    public OrderDAO() {
    }
    
    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (preStm != null) {
            preStm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
    
    public boolean createOrder(String orderID, int accountID, String dateOfCreate, int total, String status) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert tblOrder(OrdersID, AccountId, Total, DateOfCreate, Status) values(?,?,?,?,?)";
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, orderID);
            preStm.setInt(2, accountID);
            preStm.setInt(3, total);
            preStm.setString(4, GetCurrentDate.getCurrentDate());
            preStm.setString(5, status);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public String findByLastOrderID(String username) throws Exception {
        String orderID = null;
        try {
            String sql = "Select OrdersID From tblOrder Where DateOfCreate = (Select MAX(DateOfCreate) From tblOrder Where AccountId = ?)";
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            rs = preStm.executeQuery();
            if (rs.next()) {
                orderID = rs.getString("OrdersID");
            }
        } finally {
            closeConnection();
        }
        return orderID;
    }
    
    
    public boolean createOrderDetail(String detailID, String orderID, int quantity, String productID) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert into tblOrderDetail(OrderDetailID, OrdersId, Quantity, ProductID) values(?,?,?,?)";
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, detailID);
            preStm.setString(2, orderID);
            preStm.setInt(3, quantity);
            preStm.setString(4, productID);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
}
