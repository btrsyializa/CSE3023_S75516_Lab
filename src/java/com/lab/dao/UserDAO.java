package com.lab.dao;

import com.lab.util.DBConnection;
import com.lab.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class UserDAO {

    public User authenticateUser(String email, String password) {
        User user = null;
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            System.out.println("DEBUG: Attempting login with email: " + email);
            System.out.println("DEBUG: Password: " + password);
            
            stmt.setString(1, email);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getString("user_id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                System.out.println("DEBUG: User found - " + user.getUsername());
            } else {
                System.out.println("DEBUG: No user found with email: " + email);
                // Debug: Check if email exists
                String checkQuery = "SELECT * FROM users WHERE email = ?";
                try (PreparedStatement checkStmt = conn.prepareStatement(checkQuery)) {
                    checkStmt.setString(1, email);
                    ResultSet checkRs = checkStmt.executeQuery();
                    if (checkRs.next()) {
                        System.out.println("DEBUG: Email exists but password doesn't match");
                        System.out.println("DEBUG: Stored password: " + checkRs.getString("password"));
                    } else {
                        System.out.println("DEBUG: Email doesn't exist in database");
                    }
                }
            }

        } catch (Exception e) {
            System.out.println("Error in UserDAO: " + e.getMessage());
            e.printStackTrace();
        }

        return user;
    }

    public User getUserById(String id) {
    User user = null;
    String query = "SELECT u.*, a.position FROM users u " +
                   "LEFT JOIN ajk_profile a ON u.user_id = a.ajk_id " +
                   "WHERE u.user_id = ?";
    
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            user = new User();
            user.setUserId(rs.getString("user_id"));
            user.setUsername(rs.getString("username"));
            user.setEmail(rs.getString("email"));
            user.setRole(rs.getString("role"));
            // Ni paling penting:
            user.setPosition(rs.getString("position")); 
        }
    } catch (Exception e) { e.printStackTrace(); }
    return user;
}
    public int getTotalUserCount() {
    String query = "SELECT COUNT(*) FROM users";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(query);
         ResultSet rs = stmt.executeQuery()) {
        if (rs.next()) return rs.getInt(1);
    } catch (Exception e) { e.printStackTrace(); }
    return 0;
}
public List<User> getUsersByRole(String role) {
    List<User> list = new ArrayList<>();
    // JOIN table users dengan ajk_profile
    String query = "SELECT u.*, a.position FROM users u " +
                   "LEFT JOIN ajk_profile a ON u.user_id = a.ajk_id " +
                   "WHERE u.role = ?";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        
        ps.setString(1, role);
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getString("user_id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
                
                // Ambil position dari table ajk_profile
                String pos = rs.getString("position");
                user.setPosition(pos != null ? pos : "N/A"); 
                
                list.add(user);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return list;
}
public boolean registerAjkWithProfile(User user) {
    Connection conn = null;
    try {
        conn = DBConnection.getConnection();
        conn.setAutoCommit(false); 

        // 1. Insert ke table users
        String sqlUser = "INSERT INTO users (user_id, username, email, password, role) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement ps1 = conn.prepareStatement(sqlUser);
        ps1.setString(1, user.getUserId());
        ps1.setString(2, user.getUsername());
        ps1.setString(3, user.getEmail());
        ps1.setString(4, user.getPassword());
        ps1.setString(5, user.getRole());
        ps1.executeUpdate();

        // 2. Insert ke table ajk_profile (DAH BUANG STAFF_ID)
        String sqlProfile = "INSERT INTO ajk_profile (ajk_id, position) VALUES (?, ?)";
        PreparedStatement ps2 = conn.prepareStatement(sqlProfile);
        ps2.setString(1, user.getUserId());
        ps2.setString(2, user.getPosition());
        ps2.executeUpdate();

        conn.commit();
        return true;
    } catch (Exception e) {
        if (conn != null) try { conn.rollback(); } catch (Exception ex) {}
        e.printStackTrace();
        return false;
    }
}
public boolean updateAjkWithProfile(User user) {
    Connection conn = null;
    try {
        conn = DBConnection.getConnection();
        conn.setAutoCommit(false);

        // Update table users
        String sqlUser = "UPDATE users SET username=?, email=? WHERE user_id=?";
        PreparedStatement ps1 = conn.prepareStatement(sqlUser);
        ps1.setString(1, user.getUsername());
        ps1.setString(2, user.getEmail());
        ps1.setString(3, user.getUserId());
        ps1.executeUpdate();

        // Update table ajk_profile
        String sqlProfile = "UPDATE ajk_profile SET position=? WHERE ajk_id=?";
        PreparedStatement ps2 = conn.prepareStatement(sqlProfile);
        ps2.setString(1, user.getPosition());
        ps2.setString(2, user.getUserId());
        ps2.executeUpdate();

        conn.commit();
        return true;
    } catch (Exception e) {
        if (conn != null) try { conn.rollback(); } catch (Exception ex) {}
        e.printStackTrace();
        return false;
    }
}
public boolean deleteUser(String userId) {
    Connection conn = null;
    try {
        conn = DBConnection.getConnection();
        conn.setAutoCommit(false); // Guna transaction lagi

        // 1. Delete dari ajk_profile dulu (sebab ada Foreign Key)
        String sqlProfile = "DELETE FROM ajk_profile WHERE ajk_id = ?";
        PreparedStatement ps1 = conn.prepareStatement(sqlProfile);
        ps1.setString(1, userId);
        ps1.executeUpdate();

        // 2. Baru delete dari table users
        String sqlUser = "DELETE FROM users WHERE user_id = ?";
        PreparedStatement ps2 = conn.prepareStatement(sqlUser);
        ps2.setString(1, userId);
        ps2.executeUpdate();

        conn.commit();
        return true;
    } catch (SQLException e) {
        if (conn != null) try { conn.rollback(); } catch (SQLException ex) {}
        e.printStackTrace();
        return false;
    }
}
}
