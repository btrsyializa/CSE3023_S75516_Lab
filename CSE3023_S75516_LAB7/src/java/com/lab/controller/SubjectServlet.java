/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.lab.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.lab.bean.SubjectBean;
import com.lab.dao.SubjectDAO;

/**
 *
 * @author ASUS
 */

public class SubjectServlet extends HttpServlet {
    private SubjectDAO subjectDAO;
    
    @Override
    public void init() {
        subjectDAO = new SubjectDAO();
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SubjectServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubjectServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        HttpSession session = request.getSession();
        String currentMatric = (String) session.getAttribute("sess_user"); 
        
        if (currentMatric == null) {
            response.sendRedirect("login.jsp?msg=Authentication required.");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) { action = "list"; }

        try {
            switch (action) {
                case "insert":
                    insertSubject(request, response, currentMatric);
                    break;
                case "delete":
                    deleteSubject(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateSubject(request, response);
                    break;
                default:
                    listSubjects(request, response, currentMatric);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void listSubjects(HttpServletRequest request, HttpServletResponse response, String currentMatric)
            throws Exception {
        List<SubjectBean> listSubject = subjectDAO.getSubjectsByMatric(currentMatric);
        request.setAttribute("listSubject", listSubject);
        request.getRequestDispatcher("subject/viewSubjects.jsp").forward(request, response);
    }

    private void insertSubject(HttpServletRequest request, HttpServletResponse response, String currentMatric)
            throws Exception {
        String code = request.getParameter("subject_code");
        String name = request.getParameter("subject_name");

        SubjectBean newSubject = new SubjectBean();
        newSubject.setMatric_no(currentMatric); // Saves to registered_subjects.matric_no
        newSubject.setSubject_code(code);
        newSubject.setSubject_name(name);

        subjectDAO.addSubject(newSubject);
        response.sendRedirect("SubjectServlet?action=list");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        SubjectBean existingSubject = subjectDAO.getSubjectById(id);
        request.setAttribute("subject", existingSubject);
        request.getRequestDispatcher("subject/updateSubject.jsp").forward(request, response);
    }

    private void updateSubject(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        String code = request.getParameter("subject_code");
        String name = request.getParameter("subject_name");

        SubjectBean subject = new SubjectBean();
        subject.setId(id);
        subject.setSubject_code(code);
        subject.setSubject_name(name);

        subjectDAO.updateSubject(subject);
        response.sendRedirect("SubjectServlet?action=list");
    }

    private void deleteSubject(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        subjectDAO.deleteSubject(id);
        response.sendRedirect("SubjectServlet?action=list");
    }

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

    HttpSession session = request.getSession();
    String currentMatric = (String) session.getAttribute("sess_user");

    if (currentMatric == null) {
        response.sendRedirect("login.jsp?msg=Authentication required.");
        return;
    }

    String action = request.getParameter("action");

    try {

        if ("insert".equals(action)) {
            insertSubject(request, response, currentMatric);

        } else if ("update".equals(action)) {
            updateSubject(request, response);

        } else {
            response.sendRedirect("SubjectServlet?action=list");
        }

    } catch (Exception ex) {
        throw new ServletException(ex);
    }
}

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
