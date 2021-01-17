/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import thaidq.dto.SubProductDTO;
import thaidq.utils.DBConnection;

/**
 *
 * @author thaid
 */
public class SubProductDAO {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public SubProductDAO() {
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

    public boolean createSubProduct(SubProductDTO dto) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert into tblSubProduct(ProductID) Values (?)";
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getSubProduct());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public String getSubProduct(String equalsId) throws Exception {
        String subProductID = "";
        try {
            String sql = "Select ProductID From tblSubProduct Where ProductID like ?";
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + equalsId + "%");
            rs = preStm.executeQuery();
            if (rs.next()) {
                subProductID = rs.getString("ProductID");
            }
        } finally {
            closeConnection();
        }
        return subProductID;
    }
}
