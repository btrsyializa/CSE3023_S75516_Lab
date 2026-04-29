<%-- 
    Document   : jstl_test
    Created on : Apr 29, 2026, 2:48:17 PM
    Author     : Nurbatrisyia Aliza Binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL Core Tags</title>
    </head>
    <body>
        <h2>JSTL Conditional Test</h2>
        
        <c:set var="score" value="85" />
        
        <p>Student Score: <c:out value="${score}" /> marks.</p>

        <c:if test="${score >= 50}">
            <p style="color: green;"><strong>Status: Pass! Congratulations.</strong></p>
        </c:if>

        <c:if test="${score < 50}">
            <p style="color: red;"><strong>Status: Fail. Please try again.</strong></p>
        </c:if>

    </body>
</html>