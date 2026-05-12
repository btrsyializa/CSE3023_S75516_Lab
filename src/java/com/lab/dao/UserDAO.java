package com.lab.dao;

import com.lab.util.DBConnection;
import com.lab.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

    public User getUserById(String userId) {
        User user = null;
        String query = "SELECT * FROM users WHERE user_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, userId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getString("user_id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
            }

        } catch (Exception e) {
            System.out.println("Error in UserDAO: " + e.getMessage());
            e.printStackTrace();
        }

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
}
