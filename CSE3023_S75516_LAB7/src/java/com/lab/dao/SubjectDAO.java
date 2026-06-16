package com.lab.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.lab.bean.SubjectBean;

public class SubjectDAO {
    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3307/lab7_db", "root", "");
    }

    public boolean addSubject(SubjectBean subject) {
        String sql = "INSERT INTO registered_subjects (matric_no, subject_code, subject_name) VALUES (?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, subject.getMatric_no());
            ps.setString(2, subject.getSubject_code());
            ps.setString(3, subject.getSubject_name());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<SubjectBean> getSubjectsByMatric(String matric_no) {
        List<SubjectBean> list = new ArrayList<>();
        String sql = "SELECT * FROM registered_subjects WHERE matric_no = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, matric_no);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    SubjectBean sb = new SubjectBean();
                    sb.setId(rs.getInt("id"));
                    sb.setMatric_no(rs.getString("matric_no"));
                    sb.setSubject_code(rs.getString("subject_code"));
                    sb.setSubject_name(rs.getString("subject_name"));
                    list.add(sb);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public SubjectBean getSubjectById(int id) {
        String sql = "SELECT * FROM registered_subjects WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    SubjectBean sb = new SubjectBean();
                    sb.setId(rs.getInt("id"));
                    sb.setMatric_no(rs.getString("matric_no"));
                    sb.setSubject_code(rs.getString("subject_code"));
                    sb.setSubject_name(rs.getString("subject_name"));
                    return sb;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateSubject(SubjectBean subject) {
        String sql = "UPDATE registered_subjects SET subject_code = ?, subject_name = ? WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, subject.getSubject_code());
            ps.setString(2, subject.getSubject_name());
            ps.setInt(3, subject.getId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteSubject(int id) {
        String sql = "DELETE FROM registered_subjects WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}