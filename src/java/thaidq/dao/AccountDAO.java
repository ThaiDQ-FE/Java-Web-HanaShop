/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
}
