<%-- 
    Document   : logout
    Created on : 26 May 2026, 11:03:21 pm
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate(); // Destroys session keys
    response.sendRedirect("login.jsp?msg=Logged out successfully.");
%>