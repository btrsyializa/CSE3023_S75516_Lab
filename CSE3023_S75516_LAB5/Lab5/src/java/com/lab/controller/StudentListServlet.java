/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.lab.controller;

import com.lab.bean.StudentBean;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Name: Nurbatrisyia Aliza binti Alias
 * Program: SMSK(SE)
 * Course: CSE3023
 * Lab: IBH12
 * Date: 29/04/2026
 */

public class StudentListServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Create a list to hold student objects
        List<StudentBean> stdList = new ArrayList<>();

        // Adding sample data
        StudentBean s1 = new StudentBean();
        s1.setName("Ali bin Abu"); s1.setMatricNo("S111");

        StudentBean s2 = new StudentBean();
        s2.setName("Siti Aminah"); s2.setMatricNo("S222");

        StudentBean s3 = new StudentBean();
        s3.setName("Muthusamy"); s3.setMatricNo("S333");

        stdList.add(s1);
        stdList.add(s2);
        stdList.add(s3);

        // Share data with JSP
        request.setAttribute("listData", stdList);

        // Forward to View
        RequestDispatcher rd = request.getRequestDispatcher("displayList.jsp");
        rd.forward(request, response);
    }
}