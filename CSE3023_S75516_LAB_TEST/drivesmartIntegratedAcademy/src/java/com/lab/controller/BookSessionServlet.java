/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.lab.controller;

import com.lab.dao.SessionDAO;
import com.lab.model.SessionBean;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Name: Nurbatrisyia Aliza binti Alias
 * Program: SMSK(SE)
 * Course: CSE3023
 * Lab: MP1
 * Date: 16/06/2026
 */

@WebServlet("/BookSessionServlet")
public class BookSessionServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentName = request.getParameter("student_name");
        String branchLocation = request.getParameter("branch_location");
        String lessonType = request.getParameter("lesson_type");
        
        SessionBean sessionBean = new SessionBean();
        sessionBean.setStudentName(studentName);
        sessionBean.setBranchLocation(branchLocation);
        sessionBean.setLessonType(lessonType);
        sessionBean.setStatus("Booked");
        
        SessionDAO dao = new SessionDAO();
        dao.bookSession(sessionBean);
        
        response.sendRedirect("ScheduleServlet");
    }
}