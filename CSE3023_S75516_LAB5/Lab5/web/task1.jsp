<%-- 
    Document   : task1
    Created on : Apr 29, 2026, 2:25:34 PM
    Author     : Nurbatrisyia Aliza Binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.lab.bean.StudentBean"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task 1: Scriplet & Bean</title>
    </head>
    <body>
        <h2>Student Information (Using Scriplet)</h2>
        
        <%
            // instantiating the bean
            StudentBean student = new StudentBean();
            student.setName("Ahamd Ali");
            student.setMatricNo("S123456");
        %>
        
        <p><strong>Name:</strong> <%= student.getName() %></p>
        <p><strong>Matric No.:</strong> <%= student.getMatricNo() %></p>
    </body>
</html>