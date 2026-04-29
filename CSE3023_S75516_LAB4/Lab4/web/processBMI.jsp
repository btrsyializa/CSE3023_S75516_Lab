<%-- 
    Document   : processBMI
    Created on : Apr 21, 2026, 4:18:50 PM
    Author     : Nurbatrisyia Aliza binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String weightStr = request.getParameter("weight");
    String heightStr = request.getParameter("height");
    
    double weight = 0;
    double height = 0;
    double bmi = 0;
    String category = "Unknown";
    String formattedBmi = "0.00";

    try {
        if(weightStr != null && heightStr != null) {
            weight = Double.parseDouble(weightStr);
            height = Double.parseDouble(heightStr);
            
            if (height > 0) {
                bmi = weight / (height * height);
                formattedBmi = String.format("%.2f", bmi);
                
                if (bmi < 18.5) {
                    category = "Underweight";
                } else if (bmi >= 18.5 && bmi < 25) {
                    category = "Normal";
                } else {
                    category = "Overweight";
                }
            }
        }
    } catch (Exception e) {
        category = "Error calculating BMI";
    }
%>

<jsp:forward page="resultBMI.jsp">
    <jsp:param name="calculatedBmi" value="<%= formattedBmi %>" />
    <jsp:param name="bmiCategory" value="<%= category %>" />
</jsp:forward>