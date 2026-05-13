package com.lab.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.lab.model.Station;
import com.lab.util.DBConnection; 

public class StationDAO {

    public List<Station> getAllStations() {
        List<Station> stations = new ArrayList<>();

        // SQL Query ni kena ikut sebiji schema finalize kita
        String query = "SELECT s.station_id, s.pricing_id, s.station_name, s.specifications, s.status, " +
                       "p.station_type, p.base_price_per_hour, p.happy_hour " +
                       "FROM gaming_station s " +
                       "LEFT JOIN pricing p ON s.pricing_id = p.pricing_id";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Station station = new Station();

                // Mapping data dari gaming_station
                station.setStationId(rs.getString("station_id"));
                station.setPricingId(rs.getString("pricing_id"));
                station.setStationName(rs.getString("station_name"));
                station.setSpecifications(rs.getString("specifications"));
                station.setStatus(rs.getString("status"));

                // Mapping data dari pricing (hasil JOIN)
                station.setStationType(rs.getString("station_type"));
                station.setBasePricePerHour(rs.getDouble("base_price_per_hour"));
                station.setHappyHour(rs.getDouble("happy_hour"));

                stations.add(station);
            }

        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
        }

        return stations;
    }
    public int getAvailableStationCount() {
    String query = "SELECT COUNT(*) FROM gaming_station WHERE status = 'available'";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(query);
         ResultSet rs = stmt.executeQuery()) {
        if (rs.next()) return rs.getInt(1);
    } catch (Exception e) { e.printStackTrace(); }
    return 0;
}
    // Tambah method ni dlm StationDAO.java kau

public boolean addStation(Station s) {
    String query = "INSERT INTO gaming_station (station_id, pricing_id, station_name, specifications, status) VALUES (?, ?, ?, ?, ?)";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        ps.setString(1, s.getStationId());
        ps.setString(2, s.getPricingId());
        ps.setString(3, s.getStationName());
        ps.setString(4, s.getSpecifications());
        ps.setString(5, s.getStatus());
        return ps.executeUpdate() > 0;
    } catch (SQLException e) { e.printStackTrace(); return false; }
}

public boolean deleteStation(String id) {
    String query = "DELETE FROM gaming_station WHERE station_id = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        ps.setString(1, id);
        return ps.executeUpdate() > 0;
    } catch (SQLException e) { e.printStackTrace(); return false; }
}
// 1. Method untuk tarik satu station sahaja (untuk page Edit)
public Station getStationById(String id) {
    Station station = null;
    String query = "SELECT s.*, p.station_type FROM gaming_station s " +
                   "LEFT JOIN pricing p ON s.pricing_id = p.pricing_id " +
                   "WHERE s.station_id = ?";
    
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        
        ps.setString(1, id);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                station = new Station();
                station.setStationId(rs.getString("station_id"));
                station.setPricingId(rs.getString("pricing_id"));
                station.setStationName(rs.getString("station_name"));
                station.setSpecifications(rs.getString("specifications"));
                station.setStatus(rs.getString("status"));
                station.setStationType(rs.getString("station_type")); // Dari join
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return station;
}

// 2. Method untuk kemas kini data station
public boolean updateStation(Station s) {
    String query = "UPDATE gaming_station SET pricing_id=?, station_name=?, specifications=?, status=? WHERE station_id=?";
    
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        
        ps.setString(1, s.getPricingId());
        ps.setString(2, s.getStationName());
        ps.setString(3, s.getSpecifications());
        ps.setString(4, s.getStatus());
        ps.setString(5, s.getStationId());
        
        return ps.executeUpdate() > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}
}