<%-- 
    Document   : index.jsp
    Created on : 16 Jun 2026, 3:43:58 PM
    Author     : Nurbatrisyia Aliza Binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DriveSmart Integrated Academy - Home</title>
    </head>
    <body>
        <%@include file= "header.html" %>
        
        <div style ="text-align: center; margin: 50px;">
            <h2>Main Menu</h2>
            <p><a href="book_session.jsp" style="font-size: 18px;">1. Book a New Training Session</a></p>
            <p><a href="ScheduleServlet" style="font-size: 18px;">2. View Centralized Schedule</a></p>
        </div>
        
        <%@include file="footer.jsp" %>
    </body>
</html>