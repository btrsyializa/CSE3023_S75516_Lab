<%-- 
    Document   : carForm
    Created on : Jun 2, 2026, 3:05:44 PM
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
    
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                
                <c:if test="${car != null}">
                    <form action="update" method="post">
                </c:if>
                <c:if test="${car == null}">
                    <form action="insert" method="post">
                </c:if>

                <h2>
                    <c:if test="${car != null}">Edit Car Details</c:if>
                    <c:if test="${car == null}">Add New Car</c:if>
                </h2>

                <c:if test="${car != null}">
                    <input type="hidden" name="id" value="<c:out value='${car.carId}' />" />
                </c:if>

                <fieldset class="form-group">
                    <label>Brand</label>
                    <input type="text" value="<c:out value='${car.brand}' />" class="form-control" name="brand" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Model</label>
                    <input type="text" value="<c:out value='${car.model}' />" class="form-control" name="model" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Cylinders</label>
                    <input type="number" value="<c:out value='${car.cylinder}' />" class="form-control" name="cylinder" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Price</label>
                    <input type="number" step="0.01" value="<c:out value='${car.price}' />" class="form-control" name="price" required="required">
                </fieldset>

                <button type="submit" class="btn btn-success">Save</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>