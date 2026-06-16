<%-- 
    Document   : schedule
    Created on : 16 Jun 2026, 4:02:52 PM
    Author     : Nurbatrisyia Aliza Binti Alias
--%>

<%@page import="java.util.List"%>
<%@page import="com.lab.model.SessionBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Centralized Schedule</title>
    </head>
    <body>
        <%@include file= "header.html" %>
        
        <div style="margin: 30px;">
            <h2>Real-Time Schedule Dashboard</h2>
            <table border="1" cellpadding="10">
                <tr>
                    <th>Session ID</th>
                    <th>Student Name</th>
                    <th>Branch Location</th>
                    <th>Lesson Type</th>
                    <th>Status</th>
                </tr>
                <%
                    List<SessionBean> sessionList = (List<SessionBean>) request.getAttribute("sessionList");
                    if (sessionList != null) {
                        for (SessionBean sb : sessionList) {
                %>
                <tr>
                    <td><%= sb.getSessionId()%></td>
                    <td><%= sb.getStudentName()%></td>
                    <td><%= sb.getBranchLocation()%></td>
                    <td><%= sb.getLessonType()%></td>
                    <td><%= sb.getStatus()%></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td>colspan="5">No session booked yet.</td>
                </tr>
                <%
                    }
                %>
            </table>
            <br>
            <a href="index.jsp">Back to Home</a>
        </div>
        
        <%@include file="footer.jsp" %>
    </body>
</html>