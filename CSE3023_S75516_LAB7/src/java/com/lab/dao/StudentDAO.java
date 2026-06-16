package com.lab.dao;
import java.sql.*;
import com.lab.bean.StudentBean;

public class StudentDAO {
    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3307/lab7_db", "root", "");
    }

    public boolean registerStudent(StudentBean student) {
        String sql = "INSERT INTO students (matric_no, password, fullname) VALUES (?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, student.getMatricNo());
            ps.setString(2, student.getPassword());
            ps.setString(3, student.getFullname());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}