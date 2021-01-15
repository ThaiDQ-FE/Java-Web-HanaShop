/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import thaidq.dto.EmotionDTO;
import thaidq.utils.DBConnection;

/**
 *
 * @author thaid
 */
public class EmotionDAO {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

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

    public boolean createEmotion(EmotionDTO dto) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert into tblEmotion(Emotion, AccountId, ProductID) Values (?,?,?)";
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getEmotion());
            preStm.setString(2, dto.getAccountId());
            preStm.setString(3, dto.getProductId());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public int countAccountId(String accountId) throws Exception {
        conn = null;
        preStm = null;
        rs = null;

        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(e.AccountId) \n"
                        + "From tblAccount as a, tblEmotion as e \n"
                        + "Where a.AccountId = e.AccountId and e.AccountId = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, accountId);
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

    public int countProductId(String productId) throws Exception {
        conn = null;
        preStm = null;
        rs = null;

        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(e.ProductID) \n"
                        + "From tblProduct as p, tblEmotion as e \n"
                        + "Where p.ProductID = e.ProductID and e.ProductID = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, productId);
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

    public int checkIsCreate(String productId, String accountId) throws Exception {
        conn = null;
        preStm = null;
        rs = null;

        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(e.ProductID) \n"
                        + "From tblProduct as p, tblEmotion as e, tblAccount as a \n"
                        + "Where p.ProductID = ? and e.ProductID = p.ProductID and a.AccountId = e.AccountId and e.AccountId = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, productId);
                preStm.setString(2, accountId);
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

    public boolean updateEmotionToDislike(String accountId, String productId) throws Exception {
        boolean check = false;
        try {
            String sql = "Update tblEmotion set Emotion = ? where AccountId = ? and ProductID = ?";
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "Dislike");
            preStm.setString(2, accountId);
            preStm.setString(3, productId);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }

        return check;
    }

    public String getEmotion(String accountId, String productId) throws Exception {
        String emotion = "";
        try {
            String sql = "SELECT e.Emotion \n"
                    + "From tblProduct as p, tblEmotion as e, tblAccount as a \n"
                    + "Where p.ProductID = ? and e.ProductID = p.ProductID and a.AccountId = e.AccountId and e.AccountId = ?";
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, productId);
            preStm.setString(2, accountId);
            rs = preStm.executeQuery();
            if (rs.next()) {
                emotion = rs.getString("Emotion");
            }
        } finally {
            closeConnection();
        }
        return emotion;
    }

    public boolean updateEmotionToLike(String accountId, String productId) throws Exception {
        boolean check = false;
        try {
            String sql = "Update tblEmotion set Emotion = ? where AccountId = ? and ProductID = ?";
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "Like");
            preStm.setString(2, accountId);
            preStm.setString(3, productId);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }

        return check;
    }

}
