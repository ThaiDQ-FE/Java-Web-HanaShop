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
import javax.swing.JOptionPane;
import thaidq.dto.CloneProductDTO;
import thaidq.dto.HistoryDTO;
import thaidq.dto.ProductDTO;
import thaidq.dto.ProductTopDTO;
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
                String sql = "Select ProductID, Name, Quantity, Description, Category, Price, DateOfCreate, Status, Image \n"
                        + "From tblProduct \n"
                        + "Where Status = ? and Quantity > 0 \n"
                        + "order by DateOfCreate desc \n"
                        + "OFFSET " + ((Integer.parseInt(page) - 1) * 20) + "ROWS FETCH NEXT 20 ROWS ONLY";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, "Active");
                rs = preStm.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    String id = rs.getString(1);
                    String name = rs.getString(2);
                    String quantity = rs.getString(3);
                    String description = rs.getString(4);
                    String cate = rs.getString(5);
                    String price = rs.getString(6);
                    String date = rs.getString(7);
                    String status = rs.getString(8);
                    String image = rs.getString(9);
                    ProductDTO dto = new ProductDTO(id, name, quantity, description, cate, price, status, date, image.substring(21));
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
                        + "From tblProduct \n"
                        + "Where Status = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, "Active");
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

    public List<ProductDTO> searchProductByName(String searchValue, String page) throws Exception {
        List<ProductDTO> list = null;
        conn = null;
        preStm = null;
        rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "Select ProductID, Name, Quantity, Description, Category, Price, DateOfCreate, Status, Image \n"
                        + "From tblProduct \n"
                        + "Where Name Like ? \n"
                        + "order by DateOfCreate desc \n"
                        + "OFFSET " + ((Integer.parseInt(page) - 1) * 20) + "ROWS FETCH NEXT 20 ROWS ONLY";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, "%" + searchValue + "%");
                rs = preStm.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    String id = rs.getString(1);
                    String name = rs.getString(2);
                    String quantity = rs.getString(3);
                    String description = rs.getString(4);
                    String cate = rs.getString(5);
                    String price = rs.getString(6);
                    String date = rs.getString(7);
                    String status = rs.getString(8);
                    String image = rs.getString(9);
                    ProductDTO dto = new ProductDTO(id, name, quantity, description, cate, price, status, date, image.substring(21));
                    list.add(dto);
                }
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<ProductDTO> searchProductByPrice(String searchValue) throws Exception {
        List<ProductDTO> list = null;
        conn = null;
        preStm = null;
        rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "Select ProductID, Name, Quantity, Description, Category, Price, DateOfCreate, Status, Image \n"
                        + "From tblProduct \n"
                        + "Where Price Like ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, "%" + searchValue + "%");
                rs = preStm.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    String id = rs.getString(1);
                    String name = rs.getString(2);
                    String quantity = rs.getString(3);
                    String description = rs.getString(4);
                    String cate = rs.getString(5);
                    String price = rs.getString(6);
                    String date = rs.getString(7);
                    String status = rs.getString(8);
                    String image = rs.getString(9);
                    ProductDTO dto = new ProductDTO(id, name, quantity, description, cate, price, status, date, image.substring(21));
                    list.add(dto);
                }
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<ProductDTO> searchProductByCategory(String searchValue) throws Exception {
        List<ProductDTO> list = null;
        conn = null;
        preStm = null;
        rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "Select ProductID, Name, Quantity, Description, Category, Price, DateOfCreate, Status, Image \n"
                        + "From tblProduct \n"
                        + "Where Category Like ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, "%" + searchValue + "%");
                rs = preStm.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    String id = rs.getString(1);
                    String name = rs.getString(2);
                    String quantity = rs.getString(3);
                    String description = rs.getString(4);
                    String cate = rs.getString(5);
                    String price = rs.getString(6);
                    String date = rs.getString(7);
                    String status = rs.getString(8);
                    String image = rs.getString(9);
                    ProductDTO dto = new ProductDTO(id, name, quantity, description, cate, price, status, date, image.substring(21));
                    list.add(dto);
                }
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public boolean delete(String id) throws Exception {
        boolean check = false;
        try {
            String sql = "Update tblProduct set Status = ? where ProductID = ? ";
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "Inactive");
            preStm.setString(2, id);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }

        return check;
    }

    public boolean recordActionHistory(HistoryDTO dto) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert into tblActionHistory(Fullname, Action, Date, ProductID) Values (?,?,?,?)";
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getFullname());
            preStm.setString(2, "Delete");
            preStm.setString(3, GetCurrentDate.getCurrentDate());
            preStm.setString(4, dto.getProductId());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean recordActionUpdateHistory(HistoryDTO dto) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert into tblActionHistory(Fullname, Action, Date, ProductID) Values (?,?,?,?)";
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getFullname());
            preStm.setString(2, "Update");
            preStm.setString(3, GetCurrentDate.getCurrentDate());
            preStm.setString(4, dto.getProductId());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<ProductDTO> getOneProductInfo(String info) throws Exception {
        conn = null;
        preStm = null;
        rs = null;
        List<ProductDTO> list = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "Select ProductID, Name, Quantity, Description, Category, Price, DateOfCreate, Status, Image \n"
                        + "From tblProduct \n"
                        + "Where ProductID = ?\n";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, info);
                rs = preStm.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    String id = rs.getString(1);
                    String name = rs.getString(2);
                    String quantity = rs.getString(3);
                    String description = rs.getString(4);
                    String cate = rs.getString(5);
                    String price = rs.getString(6);
                    String date = rs.getString(7);
                    String status = rs.getString(8);
                    String image = rs.getString(9);
                    ProductDTO dto = new ProductDTO(id, name, quantity, description, cate, price, status, date, image.substring(21));
                    list.add(dto);
                }
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public boolean updateNoImage(ProductDTO dto, String id) throws Exception {
        boolean check = false;
        try {
            String sql = "Update tblProduct Set Name = ?, Quantity = ?, Description = ?, Category = ?, Price = ?, DateOfCreate = ? Where ProductID = ?";
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getProductName());
            preStm.setString(2, dto.getQuantity());
            preStm.setString(3, dto.getDescription());
            preStm.setString(4, dto.getCateID());
            preStm.setString(5, dto.getPrice());
            preStm.setString(6, GetCurrentDate.getCurrentDate());
            preStm.setString(7, id);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean updateWithImage(ProductDTO dto, String id) throws Exception {
        boolean check = false;
        try {
            String sql = "Update tblProduct Set Name = ?, Quantity = ?, Description = ?, Category = ?, Price = ?, DateOfCreate = ?, Image = ? Where ProductID = ?";
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getProductName());
            preStm.setString(2, dto.getQuantity());
            preStm.setString(3, dto.getDescription());
            preStm.setString(4, dto.getCateID());
            preStm.setString(5, dto.getPrice());
            preStm.setString(6, GetCurrentDate.getCurrentDate());
            preStm.setString(7, dto.getImage());
            preStm.setString(8, id);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<ProductTopDTO> getTop3Product() throws Exception {
        conn = null;
        preStm = null;
        rs = null;
        List<ProductTopDTO> list = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT top 3 e.ProductID , p.Name ,p.Quantity ,p.Description ,p.Category ,p.Price ,p.DateOfCreate ,p.Image, count(e.ProductID) as Tong \n"
                        + "FROM tblEmotion as e, tblProduct as p \n"
                        + "Where e.ProductID = p.ProductID and p.Status = 'Active' and e.Emotion = 'Like' \n"
                        + "GROUP by e.ProductID,p.Name,p.Category,p.DateOfCreate,p.Description,p.Image,p.Price,p.Quantity \n"
                        + "Order by Tong desc";
                preStm = conn.prepareStatement(sql);
                rs = preStm.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    String id = rs.getString(1);
                    String name = rs.getString(2);
                    String quantity = rs.getString(3);
                    String description = rs.getString(4);
                    String cate = rs.getString(5);
                    String price = rs.getString(6);
                    String date = rs.getString(7);
                    String image = rs.getString(8);
                    String sort = rs.getString(9);
                    ProductTopDTO dto = new ProductTopDTO(id, name, quantity, description, cate, price, date, image.substring(21), sort);
                    list.add(dto);
                }
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public ProductDTO findByPK(String id) throws Exception {
        ProductDTO dto = null;
        try {
            String sql = "Select Name, Price, Quantity, Image From tblProduct Where ProductID = ?";
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String name = rs.getString("Name");
                String price = rs.getString("Price");
                String quantity = rs.getString("Quantity");
                String image = rs.getString("Image");
                dto = new ProductDTO(id, name, price, quantity, image.substring(21));
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public String getProductName(String Id) throws Exception {
        String productName = "";
        try {
            String sql = "Select Name From tblProduct Where ProductID = ?";
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, Id);
            rs = preStm.executeQuery();
            if (rs.next()) {
                productName = rs.getString("Name");
            }
        } finally {
            closeConnection();
        }
        return productName;
    }
    
    public CloneProductDTO getSuggestProduct(String productIdInput) throws Exception {
        conn = null;
        preStm = null;
        rs = null;
        CloneProductDTO dto = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "Select ProductID, Name, Quantity, Description, Category, Price, DateOfCreate, Status, Image \n"
                        + "From tblProduct \n"
                        + "Where Status = ? and Quantity > 0 and ProductID = ?\n";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, "Active");
                preStm.setString(2, productIdInput);
                rs = preStm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString(1);
                    String name = rs.getString(2);
                    String quantity = rs.getString(3);
                    String description = rs.getString(4);
                    String cate = rs.getString(5);
                    String price = rs.getString(6);
                    String date = rs.getString(7);
                    String status = rs.getString(8);
                    String image = rs.getString(9);
                    dto = new CloneProductDTO(id, name, quantity, description, cate, price, status, date, image.substring(21));
                }
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
}
