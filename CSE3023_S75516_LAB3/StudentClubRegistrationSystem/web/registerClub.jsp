<%-- 
    Document   : registerClub
    Created on : Apr 14, 2026, 4:08:03 PM
    Author     : Nurbatrisyia Aliza binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        
        <h3>Club Registration Form</h3>
        
        <form action="processRegistration.jsp" method="post">
            Student Name: <br>
            <input type="text" name="studentName" required><br><br>

            Matric Number: <br>
            <input type="text" name="matricNumber" required><br><br>

            Select Club: <br>
            <select name="club">
                <option>eMAC Club</option>
                <option>COMTECH Club</option>
                <option>e-SPORT Club</option>
                <option>Penyayang Club</option>
            </select>
            <br><br>

            <input type="submit" value="Register">
        </form>

        <%@ include file="footer.jsp" %>
    </body>
</html>