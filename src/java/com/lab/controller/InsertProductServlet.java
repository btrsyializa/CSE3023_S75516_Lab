/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.lab.controller;

import com.lab.dao.ProductDAO;
import com.lab.model.Product;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Name: Nurbatrisyia Aliza binti Alias
 * Program: SMSK(SE)
 * Course: CSE3023
 * Lab: MP1
 * Date: 07/04/2026
 */
public class InsertProductServlet extends HttpServlet {

    private ProductDAO dao;

    public void init() {
        dao = new ProductDAO();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String category = req.getParameter("category");
        double price = Double.parseDouble(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        Product p = new Product(name, category, price, quantity);
        dao.insertProduct(p);

        res.sendRedirect("ViewProductServlet");
    }
}