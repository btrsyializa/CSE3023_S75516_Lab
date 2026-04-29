<%-- 
    Document   : processCustomer.jsp
    Created on : Apr 21, 2026, 2:42:37 PM
    Author     : Nurbatrisyia Aliza binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Fixed price
    final double price = 10.0;

    // Retrieve form data
    String cust_no = request.getParameter("customerCode");
    String cust_type = request.getParameter("customerType");
    int quantity = 0;

    try {
        quantity = Integer.parseInt(request.getParameter("quantity"));
    } catch (Exception e) {
        quantity = 0;
    }
            
    // Business logic
    double total = 0;
    String message = "";
        
    if (cust_type.equals("1") && quantity > 100) {
        message = "You're entitled to 10% discount";
        total = quantity * price * 0.9;

    } else if (cust_type.equals("2") && quantity > 100) {
        message = "You're entitled to 25% discount";
        total = quantity * price * 0.75;

    } else {
        message = "You're not entitled to any discount";
        total = quantity * price;
    }

    // Display customer type
    String custTypeDisplay = cust_type.equals("1") ?
        "Normal Customer" : "Privilege Customer";
    
    String formattedTotal = String.format("%.2f", total);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f4f6f8;
                color: #333;
                display: flex;
                flex-direction: column;
                align-items: center;
                padding-top: 50px;
            }

            .header-container {
                width: 100%;
                max-width: 600px;
                margin-bottom: 20px;
            }

            .header-container h2 {
                font-size: 22px;
                color: #333;
                border-left: 5px solid #7d59b4;
                padding-left: 15px;
                margin: 0;
            }

            .card {
                background-color: #ffffff;
                width: 100%;
                max-width: 540px;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
                box-sizing: border-box;
            }

            .card h3 {
                color: #7d59b4;
                font-size: 22px;
                margin-top: 0;
                margin-bottom: 25px;
                font-weight: 600;
            }

            .data-group {
                margin-bottom: 15px;
            }

            .data-label {
                font-weight: bold;
                font-size: 14px;
                color: #444;
                display: block;
                margin-bottom: 8px;
            }

            .data-value {
                font-size: 14px;
                color: #333;
                display: block;
                margin-bottom: 10px;
            }

            .btn-back {
                margin-top: 20px;
                padding: 6px 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                background-color: #e9ecef;
                color: #333;
                font-size: 12px;
                text-decoration: none;
                display: inline-block;
                cursor: pointer;
                box-shadow: inset 0 1px 0 rgba(255,255,255,0.2), 0 1px 2px rgba(0,0,0,0.05);
            }

            .btn-back:hover {
                background-color: #dcdcdc;
            }
        </style>
        
    </head>
    <body>
        
        <div class="header-container">
            <h2>Customer Discount Result</h2>
        </div>

        <div class="card">
            <h3>Transaction Summary</h3>
        
            <div class="data-group">
                <span class="data-label">Customer Code:</span>
                <span class="data-value"><%= cust_no %></span>
            </div>

            <div class="data-group">
                <span class="data-label">Quantity:</span>
                <span class="data-value"><%= quantity %></span>
            </div>

            <div class="data-group">
                <span class="data-label">Customer Type:</span>
                <span class="data-value"><%= custTypeDisplay %></span> 
            </div>

            <div class="data-group">
                <span class="data-label">Status:</span>
                <span class="data-value"><%= message %></span>
            </div>

            <div class="data-group">
                <span class="data-label">Total Amount:</span>
                <span class="data-value">RM <%= formattedTotal %></span>
            </div>

            <a href="customer.html" class="btn-back">Back</a>
        </div>
        
    </body>
</html>