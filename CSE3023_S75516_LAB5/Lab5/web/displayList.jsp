<%-- 
    Document   : displayList
    Created on : Apr 29, 2026, 3:17:27 PM
    Author     : Nurbatrisyia Aliza Binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL Loop Collection</title>
    </head>
    <body>
        <h2>Registered Students List</h2>

        <table border="1" cellpadding="8">
            <thead>
                <tr style="background-color: lightgray;">
                    <th>No.</th>
                    <th>Name</th>
                    <th>Matric Number</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listData}" var="student" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${student.name}</td>
                        <td>${student.matricNo}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>