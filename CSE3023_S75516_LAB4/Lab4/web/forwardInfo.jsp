<%-- 
    Document   : forwardInfo
    Created on : Apr 21, 2026, 3:49:12 PM
    Author     : Nurbatrisyia Aliza binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String name = request.getParameter("uname");
    String email = request.getParameter("email");
    String nationality = request.getParameter("nationality");
    String background = request.getParameter("background");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

<p>Name: <%= name %></p>
<p>Email: <%= email %></p>
<p>Nationality: <%= nationality %></p>
<p>Background: <%= background %></p>