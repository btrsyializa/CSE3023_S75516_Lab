/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lab.controller;

import com.lab.dao.StaffScheduleDAO;
import com.lab.model.StaffSchedule;
import java.io.IOException;
import java.sql.Date;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ScheduleServlet")
public class ScheduleServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        StaffScheduleDAO dao = new StaffScheduleDAO();

        if ("add".equals(action)) {
            StaffSchedule s = new StaffSchedule();
            // Generate random ID
            s.setScheduleId("SCH-" + UUID.randomUUID().toString().substring(0, 8));
            s.setAdvisorId(request.getParameter("advisorId"));
            s.setAjkId(request.getParameter("ajkId"));
            s.setDutyRole(request.getParameter("dutyRole"));
            s.setShiftDate(Date.valueOf(request.getParameter("shiftDate")));
            s.setIsAssigned(1); // Auto assigned

            if (dao.addSchedule(s)) {
                response.sendRedirect("advisor/dashboardAdvisor.jsp?success=1");
            } else {
                response.sendRedirect("advisor/dashboardAdvisor.jsp?error=1");
            }
        } 
        else if ("delete".equals(action)) {
            String id = request.getParameter("scheduleId");
            dao.deleteSchedule(id);
            response.sendRedirect("advisor/dashboardAdvisor.jsp?deleted=1");
        }
        else if ("update".equals(action)) {
    StaffSchedule s = new StaffSchedule();
    s.setScheduleId(request.getParameter("scheduleId"));
    s.setAjkId(request.getParameter("ajkId"));
    s.setDutyRole(request.getParameter("dutyRole"));
    s.setShiftDate(Date.valueOf(request.getParameter("shiftDate")));
    s.setIsAssigned(Integer.parseInt(request.getParameter("isAssigned")));

    if (dao.updateSchedule(s)) {
        response.sendRedirect("advisor/dashboardAdvisor.jsp?updated=1");
    } else {
        response.sendRedirect("advisor/dashboardAdvisor.jsp?error=update_failed");
    }
}
    }
}