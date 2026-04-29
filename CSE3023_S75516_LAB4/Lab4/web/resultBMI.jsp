<%-- 
    Document   : resultBMI
    Created on : Apr 21, 2026, 4:20:05 PM
    Author     : Nurbatrisyia Aliza binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>Your Health Result</h2>

<%
    String finalBmi = request.getParameter("calculatedBmi");
    String finalCategory = request.getParameter("bmiCategory");
%>

<div style="background-color: #f9f9fb; padding: 20px; border-radius: 8px; border: 1px solid #eee; text-align: center; margin-top: 20px;">
    <h3 style="margin: 0; color: #555;">Body Mass Index</h3>
    <p style="font-size: 36px; font-weight: bold; color: #ff9aa2; margin: 10px 0;"><%= finalBmi %></p>
    
    <h3 style="margin: 0; color: #555;">Category</h3>
    <p style="font-size: 24px; font-weight: bold; margin: 10px 0; color: <%= "Normal".equals(finalCategory) ? "#28a745" : "#dc3545" %>;">
        <%= finalCategory %>
    </p>
</div>

<div style="margin-top: 30px; text-align: center;">
    <a href="bmiCalculator.jsp" style="display: inline-block; padding: 10px 20px; background-color: #e9ecef; color: #333; text-decoration: none; border-radius: 4px; font-weight: bold;">Recalculate</a>
</div>

<%@ include file="footer.jsp" %>