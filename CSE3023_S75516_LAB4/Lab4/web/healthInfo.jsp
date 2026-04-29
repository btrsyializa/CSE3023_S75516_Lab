<%-- 
    Document   : healthInfo
    Created on : Apr 21, 2026, 4:21:45 PM
    Author     : Nurbatrisyia Aliza binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ include file="header.jsp" %>

<h2>Health Information</h2>
<p>Understanding your Body Mass Index (BMI) categories according to standard guidelines:</p>

<%
    ArrayList<String[]> categoriesList = new ArrayList<>();
    
    categoriesList.add(new String[]{"BMI < 18.5", "Underweight"});
    categoriesList.add(new String[]{"18.5 &le; BMI &le; 25", "Normal"});
    categoriesList.add(new String[]{"BMI > 25", "Overweight"});
%>

<table>
    <thead>
        <tr>
            <th>Condition</th>
            <th>Health Category</th>
        </tr>
    </thead>
    <tbody>
        <%
            for (String[] cat : categoriesList) {
        %>
            <tr>
                <td><%= cat[0] %></td>
                <td><strong><%= cat[1] %></strong></td>
            </tr>
        <%
            }
        %>
    </tbody>
</table>

<%@ include file="footer.jsp" %>