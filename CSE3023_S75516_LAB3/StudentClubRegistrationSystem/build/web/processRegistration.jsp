<%-- 
    Document   : processRegistration
    Created on : Apr 14, 2026, 4:12:01 PM
    Author     : Nurbatrisyia Aliza binti Alias
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        
        <h3>Registration Result</h3>
        
        <%
            String name = request.getParameter("studentName");
            String matric = request.getParameter("matricNumber");
            String club = request.getParameter("club");
            
            ArrayList<String> members = (ArrayList<String>) session.getAttribute("members");
            
            if (members == null) {
                members = new ArrayList<String>();
            }
            
            members.add(name);
            
            session.setAttribute("members",members);
        %>
        
        <table>
            <tr>
                <th>Student Name</th>
                <td><%= name %></td>
            </tr>
            <tr>
                <th>Matric Number</th>
                <td><%= matric %></td>
            </tr>
            <tr>
                <th>Selected Club</th>
                <td><%= club %></td>
            </tr>
        </table>

        <%@ include file="footer.jsp" %>
    </body>
</html>