/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lab.dao;

/**
 * Name: Nurbatrisyia Aliza binti Alias
 * Program: SMSK(SE)
 * Course: CSE3023
 * Lab: MP1
 * Date: 07/04/2026
 */

import com.lab.model.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/CSE3023";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    protected Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    // CREATE
    public void insertProduct(Product product) {
        String sql = "INSERT INTO products (name, category, price, quantity) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, product.getName());
            ps.setString(2, product.getCategory());
            ps.setDouble(3, product.getPrice());
            ps.setInt(4, product.getQuantity());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // READ ALL
    public List<Product> selectAllProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("category"),
                        rs.getDouble("price"),
                        rs.getInt("quantity")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // READ ONE
    public Product selectProduct(int id) {
        Product p = null;
        String sql = "SELECT * FROM products WHERE id=?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                p = new Product(
                        id,
                        rs.getString("name"),
                        rs.getString("category"),
                        rs.getDouble("price"),
                        rs.getInt("quantity")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    // UPDATE
    public boolean updateProduct(Product p) {
        String sql = "UPDATE products SET name=?, category=?, price=?, quantity=? WHERE id=?";
        boolean updated = false;

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, p.getName());
            ps.setString(2, p.getCategory());
            ps.setDouble(3, p.getPrice());
            ps.setInt(4, p.getQuantity());
            ps.setInt(5, p.getId());

            updated = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return updated;
    }

    // DELETE
    public boolean deleteProduct(int id) {
        String sql = "DELETE FROM products WHERE id=?";
        boolean deleted = false;

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            deleted = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return deleted;
    }
}