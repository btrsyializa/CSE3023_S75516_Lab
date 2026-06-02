<%-- 
    Document   : carList
    Created on : Jun 2, 2026, 3:07:44 PM
    Author     : batrisyia aliza
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Car Shop Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #007bff">
            <div><a href="<%=request.getContextPath()%>/list" class="navbar-brand">Car Shop App</a></div>
            <ul class="navbar-nav">
                <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Car Inventory</a></li>
            </ul>
        </nav>
    </header>
    <br>

    <div class="row">
        <div class="container">
            <h3 class="text-center">Car Inventory Pricelist</h3>
            <hr>
            
            <div class="container text-left">
                <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add New Car</a>
            </div>
            <br>
            
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Brand</th>
                        <th>Model</th>
                        <th>Cylinders</th>
                        <th>Price (RM)</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="car" items="${listCar}">
                        <tr>
                            <td><c:out value="${car.carId}" /></td>
                            <td><c:out value="${car.brand}" /></td>
                            <td><c:out value="${car.model}" /></td>
                            <td><c:out value="${car.cylinder}" /></td>
                            <td><c:out value="${car.price}" /></td>
                            <td>
                                <a href="edit?id=<c:out value='${car.carId}' />" class="btn btn-sm btn-primary">Edit</a>
                                &nbsp;&nbsp;
                                <a href="delete?id=<c:out value='${car.carId}' />" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this car?');">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>