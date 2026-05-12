<%-- 
    Document   : errorStudent
    Created on : May 12, 2026, 3:49:52 PM
    Author     : Nurbatrisyia Aliza Binti Alias
--%>

<%-- The isErrorPage attribute MUST be set to true here --%>
<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Processing Record</title>
</head>
<body>
    <form action="insertStudent.jsp" method="post">
        <h2 style="color:red;">Error occurred when inserting record...!</h2>
        
        <%-- Prints out the exact exception thrown by our Regex or the Database --%>
        <p><strong>Reason:</strong> <%= exception.getMessage() %></p>
        <br>
        
        <input type="submit" value="Go Back to Registration">
    </form>
</body>
</html>