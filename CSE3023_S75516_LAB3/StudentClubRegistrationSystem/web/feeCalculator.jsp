<%-- 
    Document   : feeCalculator
    Created on : Apr 14, 2026, 4:14:35 PM
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

        <h3>Fee Calculator</h3>

        <form method="post">
            Number of Activities Joined: <br>
            <input type="number" name="activities" min="0" required>
            <br><br>
            <input type="submit" value="Calculate">
        </form>

        <%
            String input = request.getParameter("activities");

            if (input != null) {
                int activities = Integer.parseInt(input);
                double totalFee = activities * 10.0;
        %>

        <h4>Total Fee: RM <%= String.format("%.2f", totalFee) %></h4>

        <%
            }
        %>

        <%@ include file="footer.jsp" %>
    </body>
</html>