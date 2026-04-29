<%-- 
    Document   : subjectInfo
    Created on : Apr 21, 2026, 3:45:48 PM
    Author     : Nurbatrisyia Aliza binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subject Information</title>
    </head>
    <body>
        <h1>Subject Information</h1>
    </body>
</html>

<p>Code: <%= request.getParameter("code") %></p>
<p>Subject: <%= request.getParameter("subject") %></p>
<p>Credit: <%= request.getParameter("credit") %></p>