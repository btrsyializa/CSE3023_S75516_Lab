/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lab.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.lab.model.SessionBean;

/**
 * Name: Nurbatrisyia Aliza binti Alias
 * Program: SMSK(SE)
 * Course: CSE3023
 * Lab: MP1
 * Date: 16/06/2026
 */
public class SessionDAO {
    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/drivesmart_db", "root", "admin");
    }
    
    public void bookSession (SessionBean session) {
        String sql = "INSERT INTO training_sessions (student_name, branch_location, lesson_type, status) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, session.getStudentName());
            ps.setString(2, session.getBranchLocation());
            ps.setString(3, session.getLessonType());
            ps.setString(4, session.getStatus());
            
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<SessionBean> getAllSessions() {
        List<SessionBean> list = new ArrayList<>();
        String sql = "SELECT * FROM training_sessions ORDER BY branch_location ASC";
        
        try (Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                SessionBean session = new SessionBean();
                session.setSessionId(rs.getInt("session_id"));
                session.setStudentName(rs.getString("student_name"));
                session.setBranchLocation(rs.getString("branch_location"));
                session.setLessonType(rs.getString("lesson_type"));
                session.setStatus(rs.getString("status"));
                list.add(session);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}