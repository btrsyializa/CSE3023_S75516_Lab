/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.lab.controller;

import com.lab.dao.ProductDAO;
import com.lab.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
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

public class UpdateProductServlet extends HttpServlet {

    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int id = Integer.parseInt(request.getParameter("id"));

        // Call DAO
        Product product = productDAO.selectProduct(id);

        if (product != null) {
            out.println("<h2>Update Product</h2>");
            out.println("<form action='UpdateProductServlet' method='POST'>");

            out.println("<input type='hidden' name='id' value='" + product.getId() + "'>");

            out.println("Name: <input type='text' name='name' value='" 
                        + product.getName() + "' required><br><br>");

            out.println("Category: <input type='text' name='category' value='" 
                        + product.getCategory() + "' required><br><br>");

            out.println("Price: <input type='number' step='0.01' name='price' value='" 
                        + product.getPrice() + "' required><br><br>");

            out.println("Quantity: <input type='number' name='quantity' value='" 
                        + product.getQuantity() + "' required><br><br>");

            out.println("<input type='submit' value='Update Product'>");
            out.println("</form>");
        } else {
            out.println("<h3>Product not found!</h3>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Product product = new Product(id, name, category, price, quantity);

        // Call DAO
        productDAO.updateProduct(product);

        response.sendRedirect("ViewProductServlet");
    }
}