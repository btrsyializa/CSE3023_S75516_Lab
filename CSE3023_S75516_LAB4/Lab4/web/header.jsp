<%-- 
    Document   : header
    Created on : Apr 21, 2026, 4:05:38 PM
    Author     : Nurbatrisyia Aliza binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(to bottom, #fff5f7, #fffde7);
                color: #5a4a42;
                margin: 0;
                display: flex;
                flex-direction: column;
                align-items: center;
                min-height: 100vh;
            }

            nav {
                background: linear-gradient(to right, #ff9aa2, #ffd3b6);
                width: 100%;
                padding: 15px 0;
                text-align: center;
                box-shadow: 0 3px 8px rgba(0,0,0,0.1);
            }

            nav a {
                color: #5a3e36;
                text-decoration: none;
                margin: 0 15px;
                font-weight: bold;
                font-size: 16px;
            }

            nav a:hover {
                text-decoration: underline;
            }

            .container {
                width: 100%;
                max-width: 600px;
                margin-top: 40px;
                background-color: #fffaf3;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 6px 15px rgba(0, 0, 0, 0.08);
                box-sizing: border-box;
            }

            h2 {
                border-left: 6px solid #ff9aa2;
                padding-left: 15px;
                margin-top: 0;
                color: #d36b6b;
            }

            .form-group {
                margin-bottom: 20px;
            }

            label {
                display: block;
                font-weight: bold;
                margin-bottom: 8px;
                color: #6b4f4f;
            }

            input[type="number"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #f3c6c6;
                border-radius: 6px;
                box-sizing: border-box;
                background-color: #fff;
            }

            input:focus {
                border-color: #ff9aa2;
                outline: none;
            }

            button {
                padding: 10px 20px;
                background: linear-gradient(to right, #ffd166, #ff9aa2);
                color: #5a3e36;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                font-weight: bold;
            }

            button:hover {
                opacity: 0.85;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                padding: 12px;
                border: 1px solid #f3d1d1;
                text-align: left;
            }

            th {
                background-color: #ffe4e1;
                color: #d36b6b;
            }
        </style>
    </head>
    <body>
        <nav>
            <a href="bmiCalculator.jsp">BMI Calculator</a>
            <a href="healthInfo.jsp">Health Information</a>
        </nav>
        
        <div class="container">