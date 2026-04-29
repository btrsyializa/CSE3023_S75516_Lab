<%-- 
    Document   : processInsuranceQuo
    Created on : Apr 21, 2026, 3:59:13 PM
    Author     : Nurbatrisyia Aliza binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String icno = request.getParameter("icno");
    String name = request.getParameter("name");
    String coverage = request.getParameter("coverage");
    String ncdStr = request.getParameter("ncd");
    
    double price = 0;
    double ncd = 0;
    
    try {
        if(request.getParameter("price") != null) {
            price = Double.parseDouble(request.getParameter("price"));
        }
        if(ncdStr != null) {
            ncd = Double.parseDouble(ncdStr);
        }
    } catch (Exception e) {
        price = 0;
        ncd = 0;
    }

    // Business Logic
    double rate = 0;
    String coverageDisplay = "";
    
    if ("comprehensive".equals(coverage)) {
        rate = 0.05; // 5%
        coverageDisplay = "Comprehensive";
    } else {
        rate = 0.03; // 3%
        coverageDisplay = "Third Party";
    }

    // Base insurance calculation
    double insurance = price * rate;
    
    // Apply NCD discount
    double discount = insurance * ncd;
    double afterNCD = insurance - discount;
    
    // Add 8% SST
    double sst = afterNCD * 0.08;
    double finalAmount = afterNCD + sst;
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quotation Result</title>
        
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
        
            .container {
                width: 100%;
                max-width: 600px;
            }
        
            h2 {
                border-left: 5px solid #7d59b4;
                padding-left: 15px;
                color: #333;
            }
        
            .card {
                background-color: #ffffff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
                margin-top: 20px;
            }
        
            .summary-row {
                display: flex;
                justify-content: space-between;
                padding: 10px 0;
                border-bottom: 1px dashed #eee;
            }
        
            .summary-row.total {
                border-top: 2px solid #7d59b4;
                border-bottom: none;
                font-weight: bold;
                font-size: 18px;
                margin-top: 10px;
                padding-top: 15px;
            }
        
            .label {
                color: #555;
                font-weight: 600;
            }
        
            .btn-back {
                display: inline-block;
                margin-top: 25px;
                padding: 10px 20px;
                background-color: #7d59b4;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                font-weight: bold;
            }
        
            .btn-back:hover {
                background-color: #634592;
            }
        </style>
        
    </head>
    <body>
        
        <div class="container">
            <h2>Quotation Result</h2>
        
            <div class="card">
                <h3>Customer Details</h3>
                <div class="summary-row"><span class="label">Name:</span> <span><%= name %></span></div>
                <div class="summary-row"><span class="label">IC No:</span> <span><%= icno %></span></div>
            
                <h3 style="margin-top: 25px;">Calculation Breakdown</h3>
                <div class="summary-row"><span class="label">Market Price:</span> <span>RM <%= String.format("%.2f", price) %></span></div>
                <div class="summary-row"><span class="label">Coverage (<%= coverageDisplay %>):</span> <span>RM <%= String.format("%.2f", insurance) %></span></div>
                <div class="summary-row"><span class="label">Less NCD (<%= String.format("%.0f", ncd * 100) %>%):</span> <span>- RM <%= String.format("%.2f", discount) %></span></div>
                <div class="summary-row"><span class="label">Gross Premium:</span> <span>RM <%= String.format("%.2f", afterNCD) %></span></div>
                <div class="summary-row"><span class="label">Add SST (8%):</span> <span>RM <%= String.format("%.2f", sst) %></span></div>
            
                <div class="summary-row total"><span class="label">Total Amount Payable:</span> <span>RM <%= String.format("%.2f", finalAmount) %></span></div>
            
                <a href="insuranceQuotation.jsp" class="btn-back">Calculate Another</a>
            </div>
        </div>
            
    </body>
</html>