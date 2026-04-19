<%-- 
    Document   : memberDirectory
    Created on : Apr 14, 2026, 4:17:23 PM
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

        <%@ page import="java.util.ArrayList" %>

        <h3>Club Committee Member Directory</h3>

        <%
            ArrayList<String> members = (ArrayList<String>) session.getAttribute("members");

            if (members == null){
            
                members.add("Aina");
                members.add("Isyraf");
                members.add("Maisarah");
                members.add("Murni");
                members.add("Nurbatrisyia");
                
            }
        %>

        <table>
            <tr>
                <th>No</th>
                <th>Member Name</th>
            </tr>

        <%
            for (int i = 0; i < members.size(); i++) {
        %>
            <tr>
                <td><%= (i + 1) %></td>
                <td><%= members.get(i) %></td>
            </tr>
        <%
            }
        %>

        </table>

        <%@ include file="footer.jsp" %>
    </body>
</html>