<%-- 
    Document   : bmiCalculator
    Created on : Apr 21, 2026, 4:16:51 PM
    Author     : Nurbatrisyiia Aliza binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>BMI Calculator</h2>
<p>Enter your details below to calculate your Body Mass Index.</p>

<form action="processBMI.jsp" method="POST">
    <div class="form-group">
        <label for="weight">Weight (kg)</label>
        <input type="number" id="weight" name="weight" step="0.01" min="1" placeholder="e.g., 65.5" required>
    </div>

    <div class="form-group">
        <label for="height">Height (m)</label>
        <input type="number" id="height" name="height" step="0.01" min="0.01" placeholder="e.g., 1.75" required>
    </div>

    <button type="submit">Calculate BMI</button>
</form>

<%@ include file="footer.jsp" %>