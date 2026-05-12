package com.lab.dao;

import com.lab.util.DBConnection;
import com.lab.model.StaffSchedule;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

public class StaffScheduleDAO {

    // Helper method untuk map ResultSet ke Object (supaya tak ulang code banyak kali)
    private StaffSchedule mapResultSetToSchedule(ResultSet rs) throws Exception {
        StaffSchedule schedule = new StaffSchedule();
        schedule.setScheduleId(rs.getString("schedule_id"));
        schedule.setAdvisorId(rs.getString("advisor_id"));
        schedule.setAjkId(rs.getString("ajk_id"));
        schedule.setShiftDate(rs.getDate("shift_date")); // Terus guna java.sql.Date
        schedule.setDutyRole(rs.getString("duty_role"));
        schedule.setIsAssigned(rs.getInt("is_assigned")); // Ambil sebagai int (0/1)
        
        // Data dari JOIN
        schedule.setAjkName(rs.getString("username"));
        // Kalau kau tambah advisorName kat model tadi, boleh map kat sini juga
        return schedule;
    }

    public List<StaffSchedule> getAllSchedules() {
        List<StaffSchedule> schedules = new ArrayList<>();
        // Query dikekalkan, cuma make sure column name tally dengan SQL
        String query = "SELECT ss.*, u.username " +
                      "FROM staff_schedule ss " +
                      "LEFT JOIN users u ON ss.ajk_id = u.user_id " +
                      "ORDER BY ss.shift_date DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                schedules.add(mapResultSetToSchedule(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return schedules;
    }

    // Update Method: Guna int isAssigned
    public boolean addSchedule(StaffSchedule s) {
        String query = "INSERT INTO staff_schedule (schedule_id, advisor_id, ajk_id, shift_date, duty_role, is_assigned) " +
                      "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, s.getScheduleId());
            stmt.setString(2, s.getAdvisorId());
            stmt.setString(3, s.getAjkId());
            stmt.setDate(4, s.getShiftDate());
            stmt.setString(5, s.getDutyRole());
            stmt.setInt(6, s.getIsAssigned()); // Set as int

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteSchedule(String scheduleId) {
    String query = "DELETE FROM staff_schedule WHERE schedule_id = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(query)) {
        
        stmt.setString(1, scheduleId);
        return stmt.executeUpdate() > 0;
        
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}
    public boolean updateSchedule(StaffSchedule s) {
    String query = "UPDATE staff_schedule SET ajk_id = ?, shift_date = ?, duty_role = ?, is_assigned = ? WHERE schedule_id = ?";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(query)) {

        stmt.setString(1, s.getAjkId());
        stmt.setDate(2, s.getShiftDate());
        stmt.setString(3, s.getDutyRole());
        stmt.setInt(4, s.getIsAssigned());
        stmt.setString(5, s.getScheduleId());

        return stmt.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}
    public StaffSchedule getScheduleById(String scheduleId) {
    StaffSchedule schedule = null;
    // Kita buat JOIN dengan table users supaya boleh tarik nama AJK sekali
    String query = "SELECT ss.*, u.username FROM staff_schedule ss " +
                   "LEFT JOIN users u ON ss.ajk_id = u.user_id " +
                   "WHERE ss.schedule_id = ?";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(query)) {

        stmt.setString(1, scheduleId);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            schedule = new StaffSchedule();
            schedule.setScheduleId(rs.getString("schedule_id"));
            schedule.setAdvisorId(rs.getString("advisor_id"));
            schedule.setAjkId(rs.getString("ajk_id"));
            schedule.setShiftDate(rs.getDate("shift_date"));
            schedule.setDutyRole(rs.getString("duty_role"));
            schedule.setIsAssigned(rs.getInt("is_assigned"));
            
            // Data tambahan dari JOIN untuk display kat UI
            schedule.setAjkName(rs.getString("username"));
        }
    } catch (Exception e) {
        System.err.println("Error in getScheduleById: " + e.getMessage());
        e.printStackTrace();
    }
    return schedule;
}
    public Map<String, String> getAllAJKStaff() {
    Map<String, String> ajkStaff = new HashMap<>();
    String query = "SELECT u.user_id, u.username FROM users u WHERE u.role = 'ajk'";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(query);
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            ajkStaff.put(rs.getString("user_id"), rs.getString("username"));
        }
    } catch (Exception e) { e.printStackTrace(); }
    return ajkStaff;
}
    
}