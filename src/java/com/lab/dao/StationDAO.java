package com.lab.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.lab.model.GamingStation;
import com.lab.util.DBConnection; 

public class StationDAO {

    public List<GamingStation> getAllStations() {
        List<GamingStation> stations = new ArrayList<>();

        // SQL Query ni kena ikut sebiji schema finalize kita
        String query = "SELECT s.station_id, s.pricing_id, s.station_name, s.specifications, s.status, " +
                       "p.station_type, p.base_price_per_hour, p.happy_hour " +
                       "FROM gaming_station s " +
                       "LEFT JOIN pricing p ON s.pricing_id = p.pricing_id";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                GamingStation station = new GamingStation();

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
}