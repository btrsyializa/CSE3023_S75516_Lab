<%-- 
    Document   : processCurrency
    Created on : Apr 21, 2026, 3:22:18 PM
    Author     : Nurbatrisyia Aliza binti Aliza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
    // Define constant exchange rates
    final double USD = 0.25;
    final double EURO = 0.21;
    final double JPY = 40;
    final double SGD = 0.32;

    // Method to calculate conversion
    private double calculateRate(String currency, double amount) {
        double currencyChange = 0.0;

        if (currency != null) {
            if (currency.equals("1")) {
                currencyChange = amount * USD;
        
            } else if (currency.equals("2")) {
                currencyChange = amount * EURO;

            } else if (currency.equals("3")) {
                currencyChange = amount * JPY;

            } else {
                currencyChange = amount * SGD;
            }
        }
        return currencyChange;
    }
%>

<%
    String currencyType = request.getParameter("currencyType");
    String amountRaw = request.getParameter("amount");
    double amount = 0;
    double total = 0;

    try {
        if (amountRaw != null) {
            amount = Double.parseDouble(amountRaw);
            total = calculateRate(currencyType, amount);
        }
    } catch (Exception e) {
        amount = 0;
    }

    // Determine currency name for display
    String currencyName = "N/A";
    
    if ("1".equals(currencyType)) currencyName = "USD";
    else if ("2".equals(currencyType)) currencyName = "EURO";
    else if ("3".equals(currencyType)) currencyName = "JPY";
    else if ("4".equals(currencyType)) currencyName = "SGD";
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            /* Basic Settings */
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f4f7f6;
                margin: 0;
                padding: 20px;
                display: block;
            }
        
            .container {
                width: 100%;
                max-width: 900px;
                margin: 0 auto;
            }
        
            h1 {
                font-size: 1.5rem;
                color: #333;
                margin-bottom: 20px;
                border-left: 5px solid #6f42c1;
                padding-left: 10px;
            }
        
            .card {
                background: #ffffff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            }
        
            .form-title {
                color: #6f42c1;
                font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
                font-size: 1.8rem;
                font-weight: 600;
                letter-spacing: -0.5px;
                margin-top: 0;
                margin-bottom: 25px;
                text-transform: capitalize;
            }
        
            /* ===== RESULT PAGE STYLES (TWO-COLUMN LAYOUT) ===== */
            .result-grid {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 20px;
                margin-bottom: 25px;
            }
        
            .result-box {
                background: #f9f9fb;
                padding: 20px;
                border-radius: 8px;
                border: 1px solid #e0e0e0;
            }
        
            .result-box h3 {
                margin-top: 0;
                margin-bottom: 20px;
                color: #6f42c1;
                font-size: 1.3rem;
                border-bottom: 2px solid #6f42c1;
                padding-bottom: 10px;
            }
        
            .result-group {
                margin-bottom: 15px;
                padding: 8px 0;
                border-bottom: 1px dashed #e0e0e0;
            }
        
            .result-group:last-child {
                border-bottom: none;
            }
        
            .result-group label {
                display: inline-block;
                font-weight: 600;
                color: #555;
                min-width: 140px;
            }
        
            .result-group p {
                display: inline-block;
                margin: 0;
                color: #333;
                font-weight: 500;
            }
        
            .btn-back {
                background-color: #6f42c1;
                color: white;
                border: none;
                padding: 10px 25px;
                border-radius: 4px;
                cursor: pointer;
                font-weight: bold;
                transition: 0.3s;
                text-decoration: none;
                display: inline-block;
            }
        
            .btn-back:hover {
                background-color: #5a32a3;
            }
        
            @media (max-width: 768px) {
                .result-grid {
                    grid-template-columns: 1fr;
                    gap: 15px;
                }
            
                .result-group label {
                    display: block;
                    margin-bottom: 5px;
                }
            
                .result-group p {
                    display: block;
                    margin-left: 0;
                }
            }
        </style>
    </head>
    <body>
        
        <div class="container">
            <h1>Use JSP Declaration Tag, JSP Scriplet and JSP Expression in Application</h1>
        
            <div class="card">
                <h2 class="form-title">Conversion Result</h2>
            
                <div class="result-grid">
                    <div class="result-box">
                        <h3>Input Details</h3>
                        <div class="result-group">
                            <label>Original Amount:</label>
                            <p>RM <%= String.format("%.2f", amount) %></p>
                        </div>
                    </div>

                    <div class="result-box">
                        <h3>Converted Details</h3>
                        <div class="result-group">
                            <label>Converted to:</label>
                            <p><%= currencyName %></p>
                        </div>
                        <div class="result-group">
                            <label>Total Amount:</label>
                            <p><%= String.format("%.2f", total) %></p>
                        </div>
                    </div>
                </div>

                <a href="currencyConversion.html" class="btn-back">Back to Form</a>
            </div>
        </div>

    </body>
</html>