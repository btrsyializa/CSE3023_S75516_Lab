<%-- 
    Document   : forward
    Created on : Apr 21, 2026, 3:47:27 PM
    Author     : Nurbatrisyia Aliza binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Using JSP Standard Action (Forward)</title>
    </head>
    <body>
        <h1>Using jsp : forward to display user information</h1>
    </body>
</html>

<jsp:forward page="forwardInfo.jsp">
    <jsp:param name="uname" value="Wan Nural Jawahir Hj Wan Yussof" />
    <jsp:param name="email" value="wannurwy@umt.edu.my" />
    <jsp:param name="nationality" value="Malaysia" />
    <jsp:param name="background" value="Lecturer" />
</jsp:forward>