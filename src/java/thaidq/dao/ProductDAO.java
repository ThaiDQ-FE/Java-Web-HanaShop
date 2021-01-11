/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import thaidq.dto.ProductDTO;
import thaidq.utils.DBConnection;
import thaidq.utils.GetCurrentDate;

/**
 *
 * @author thaid
 */
public class ProductDAO implements Serializable {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public ProductDAO() {
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

    public boolean createProduct(ProductDTO dto) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert into tblProduct(Name, Quantity, Description, Category, Price, DateOfCreate, Status, Image) Values (?,?,?,?,?,?,?,?)";
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getProductName());
            preStm.setString(2, dto.getQuantity());
            preStm.setString(3, dto.getDescription());
            preStm.setString(4, dto.getCateID());
            preStm.setString(5, dto.getPrice());
            preStm.setString(6, GetCurrentDate.getCurrentDate());
            preStm.setString(7, "Active");
            preStm.setString(8, dto.getImage());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<ProductDTO> getAllProduct(String page) throws Exception {
        conn = null;
        preStm = null;
        rs = null;
        List<ProductDTO> list = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "Select Name, Quantity, Description, Category, Price, DateOfCreate, Status, Image \n"
                        + "From tblProduct \n"
                        + "order by DateOfCreate desc \n"
                        + "OFFSET " + ((Integer.parseInt(page) - 1) * 20) + "ROWS FETCH NEXT 20 ROWS ONLY";
                preStm = conn.prepareStatement(sql);
                rs = preStm.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    String name = rs.getString(1);
                    String quantity = rs.getString(2);
                    String description = rs.getString(3);
                    String cate = rs.getString(4);
                    String price = rs.getString(5);
                    String date = rs.getString(6);
                    String status = rs.getString(7);
                    String image = rs.getString(8);
                    ProductDTO dto = new ProductDTO(name, quantity, description, cate, price, status, date, image.substring(21));
                    list.add(dto);
                }
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public int countProduct() throws Exception {
        conn = null;
        preStm = null;
        rs = null;

        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(tblProduct.ProductID) \n"
                        + "From tblProduct";
                preStm = conn.prepareStatement(sql);
                rs = preStm.executeQuery();
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } finally {
            closeConnection();
        }
        return 0;
    }

    public List<ProductDTO> searchProductBy(String searchValue, String search, String page) throws Exception {
        List<ProductDTO> list = null;
        conn = null;
        preStm = null;
        rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "Name, Quantity, Description, Category, Price, DateOfCreate, Status, Image \n"
                        + "From tblProduct \n"
                        + "Where ? Like ?"
                        + "order by DateOfCreate desc \n"
                        + "OFFSET " + ((Integer.parseInt(page) - 1) * 20) + "ROWS FETCH NEXT 20 ROWS ONLY";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, searchValue);
                preStm.setString(2, "%" + search + "%");
                rs = preStm.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    String name = rs.getString(1);
                    String quantity = rs.getString(2);
                    String description = rs.getString(3);
                    String cate = rs.getString(4);
                    String price = rs.getString(5);
                    String date = rs.getString(6);
                    String status = rs.getString(7);
                    String image = rs.getString(8);
                    ProductDTO dto = new ProductDTO(name, quantity, description, cate, price, status, date, image.substring(21));
                    list.add(dto);
                }
            }
        } finally {
            closeConnection();
        }
        return list;
    }
}
