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
import thaidq.dto.OrderHistoryDTO;
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
    
    
    public boolean createOrderDetail(String detailID, String orderID, int quantity, String productID, String productName) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert into tblOrderDetail(OrderDetailID, OrdersId, Quantity, ProductID, ProductName) values(?,?,?,?,?)";
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, detailID);
            preStm.setString(2, orderID);
            preStm.setInt(3, quantity);
            preStm.setString(4, productID);
            preStm.setString(5, productName);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public List<OrderHistoryDTO> getListHistory(String accountId) throws Exception{
        conn = null;
        preStm = null;
        rs = null;
        List<OrderHistoryDTO> list = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "select od.ProductName,  p.Price ,od.Quantity,o.DateOfCreate,p.Image \n"
                        + "from tblOrder as o, tblOrderDetail as od , tblProduct as p \n"
                        + "where AccountId = ? and o.OrdersID = od.OrdersId  and od.ProductID = p.ProductID";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, accountId);
                rs = preStm.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    String productName = rs.getString(1);
                    String price = rs.getString(2);
                    String quantity = rs.getString(3);
                    String date = rs.getString(4);
                    String image = rs.getString(5);
                    OrderHistoryDTO dto = new OrderHistoryDTO(productName, price, quantity, date,image.substring(21));
                    list.add(dto);
                }
            }
        } finally {
            closeConnection();
        }
        return list;
    }
}
