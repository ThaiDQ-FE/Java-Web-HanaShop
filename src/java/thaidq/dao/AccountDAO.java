/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import thaidq.dto.AccountDTO;
import thaidq.utils.DBConnection;

/**
 *
 * @author thaid
 */
public class AccountDAO {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public AccountDAO() {
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

    public String checkLogin(String username, String password) throws Exception {
        String role = "failed";
        try {
            String sql = "Select Role From tblAccount Where Username = ? and Password = ?";
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            preStm.setString(2, password);
            rs = preStm.executeQuery();
            if (rs.next()) {
                role = rs.getString("Role");
            }
        } finally {
            closeConnection();
        }
        return role;
    }

    public AccountDTO checkLogins(String username, String password) throws SQLException, ClassNotFoundException, Exception {
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "Select Id, Username, Password, Role, Fullname From tblAccount Where Username = ? and Password = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, username);
                preStm.setString(2, password);
                rs = preStm.executeQuery();
                if (rs.next()) {
                    return new AccountDTO(
                            rs.getString("Id"),
                            rs.getString("Username"),
                            rs.getString("Password"),
                            rs.getString("Role"),
                            rs.getString("Fullname")
                    );
                }
            }
        } finally {
            closeConnection();
        }
        return null;
    }

//    public String checkId(String idGoogle) throws Exception {
//        String id = "failed";
//        try {
//            String sql = "Select Role From tblAccount Where Id = ?";
//            conn = DBConnection.getConnection();
//            preStm = conn.prepareStatement(sql);
//            preStm.setString(1, idGoogle);
//            rs = preStm.executeQuery();
//            if (rs.next()) {
//                id = rs.getString("Id");
//            }
//        } finally {
//            closeConnection();
//        }
//        return id;
//    }
    public boolean createAccountGoogle(AccountDTO dto) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert into tblAccount(Id, Username, Password, Role, Fullname) Values (?,?,?,?,?)";
            conn = DBConnection.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getId());
            preStm.setString(2, "");
            preStm.setString(3, "");
            preStm.setString(4, "USER");
            preStm.setString(5, dto.getFullname());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public int countId(String googleId) throws Exception {
        conn = null;
        preStm = null;
        rs = null;

        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(tblAccount.Id) \n"
                        + "From tblAccount \n"
                        + "Where Id = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, googleId);
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
    
}
