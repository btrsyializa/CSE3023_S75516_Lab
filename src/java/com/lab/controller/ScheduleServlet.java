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
            s.setScheduleId("SCH-" + UUID.randomUUID().toString().substring(0, 8));
            s.setAdvisorId(request.getParameter("advisorId"));
            s.setAjkId(request.getParameter("ajkId"));
            s.setDutyRole(request.getParameter("dutyRole"));
            s.setShiftDate(Date.valueOf(request.getParameter("shiftDate")));
            s.setIsAssigned(1); 

            if (dao.addSchedule(s)) {
                // UPDATE: Guna rolesAdvisor dan hantar success=1
                response.sendRedirect("rolesAdvisor/dashboardAdvisor.jsp?success=1");
            } else {
                // UPDATE: Guna rolesAdvisor dan hantar error=1
                response.sendRedirect("rolesAdvisor/addSchedule.jsp?error=1");
            }
        } 
        else if ("delete".equals(action)) {
            String id = request.getParameter("scheduleId");
            dao.deleteSchedule(id);
            // UPDATE: Guna rolesAdvisor
            response.sendRedirect("rolesAdvisor/dashboardAdvisor.jsp?deleted=1");
        }
        else if ("update".equals(action)) {
            StaffSchedule s = new StaffSchedule();
            s.setScheduleId(request.getParameter("scheduleId"));
            s.setAjkId(request.getParameter("ajkId"));
            s.setDutyRole(request.getParameter("dutyRole"));
            s.setShiftDate(Date.valueOf(request.getParameter("shiftDate")));
            s.setIsAssigned(Integer.parseInt(request.getParameter("isAssigned")));

            if (dao.updateSchedule(s)) {
                // UPDATE: Guna rolesAdvisor
                response.sendRedirect("rolesAdvisor/dashboardAdvisor.jsp?updated=1");
            } else {
                // UPDATE: Guna rolesAdvisor
                response.sendRedirect("rolesAdvisor/dashboardAdvisor.jsp?error=update_failed");
            }
        }
    }
}