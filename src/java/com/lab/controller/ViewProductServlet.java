/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.lab.controller;

import com.lab.dao.ProductDAO;
import com.lab.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
public class ViewProductServlet extends HttpServlet {

    private ProductDAO dao;

    @Override
    public void init() {
        dao = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        
        List<Product> list = dao.selectAllProducts();
        
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Product List</title>");
        out.println("</head>");
        out.println("<body>");

        out.println("<h2>Product List</h2>");
        out.println("<table border='1'>");
        out.println("<tr><th>ID</th><th>Name</th><th>Category</th><th>Price</th><th>Qty</th><th>Action</th></tr>");

        for (Product p : list) {
            out.println("<tr>");
            out.println("<td>" + p.getId() + "</td>");
            out.println("<td>" + p.getName() + "</td>");
            out.println("<td>" + p.getCategory() + "</td>");
            out.println("<td>" + p.getPrice() + "</td>");
            out.println("<td>" + p.getQuantity() + "</td>");
            out.println("<td><a href='UpdateProductServlet?id=" + p.getId() + "'>Edit</a> | ");
            out.println("<a href='DeleteProductServlet?id=" + p.getId() + "'>Delete</a></td>");
            out.println("</tr>");
        }

        out.println("</table>");
        out.println("<br><br>");
        out.println("<a href='add_product.html'>+ Add Product</a>");

        out.println("</body>");
        out.println("</html>");
    }
}