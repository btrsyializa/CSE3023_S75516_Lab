<%-- 
    Document   : insuranceQuotation
    Created on : Apr 21, 2026, 3:50:51 PM
    Author     : Nurbatrisyia Aliza binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insurance Quotation</title>
        
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
                font-size: 24px;
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

            fieldset {
                border: 1px solid #ccc;
                border-radius: 4px;
                padding: 20px;
                margin: 0;
            }

            legend {
                color: #555;
                padding: 0 10px;
                font-weight: 500;
                font-size: 14px;
            }

            .form-group {
                margin-bottom: 15px;
            }

            label {
                display: block;
                font-weight: bold;
                margin-bottom: 8px;
                font-size: 14px;
                color: #555;
            }

            input[type="text"],
            input[type="number"],
            select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 14px;
                box-sizing: border-box;
                outline: none;
                background-color: #fff;
            }

            input:focus, select:focus {
                border-color: #7d59b4;
            }

            .button-group {
                margin-top: 25px;
                display: flex;
                gap: 10px;
            }

            button {
                padding: 8px 20px;
                border: 1px solid #ccc;
                border-radius: 4px;
                background-color: #e9ecef;
                color: #333;
                font-size: 14px;
                cursor: pointer;
                transition: background-color 0.2s;
            }

            button:hover {
                background-color: #dcdcdc;
            }
        </style>
        
    </head>
    
    <body>
        
        <div class="header-container">
            <h2>Insurance Quotation</h2>
        </div>

        <div class="card">
            <form action="processInsuranceQuo.jsp" method="POST">
                <fieldset>
                    <legend>Insurance Calculation</legend>
                
                    <div class="form-group">
                        <label for="icno">IC No*</label>
                        <input type="text" id="icno" name="icno" placeholder="E.g. 821210-05-3478" required>
                    </div>

                    <div class="form-group">
                        <label for="name">Name*</label>
                        <input type="text" id="name" name="name" placeholder="Enter name" required>
                    </div>

                    <div class="form-group">
                        <label for="price">Market Price*</label>
                        <input type="number" id="price" name="price" placeholder="Price" step="0.01" min="0" required>
                    </div>

                    <div class="form-group">
                        <label for="coverage">Coverage Type</label>
                        <select id="coverage" name="coverage">
                            <option value="third_party">Third Party</option>
                            <option value="comprehensive">Comprehensive</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="ncd">No Claims Discount (NCD)</label>
                        <select id="ncd" name="ncd">
                            <option value="0">0%</option>
                            <option value="0.10" selected>10%</option>
                            <option value="0.25">25%</option>
                            <option value="0.30">30%</option>
                            <option value="0.3833">38.33%</option>
                            <option value="0.45">45%</option>
                            <option value="0.55">55%</option>
                        </select>
                    </div>

                    <div class="button-group">
                        <button type="submit">Submit</button>
                        <button type="reset">Cancel</button>
                    </div>
                </fieldset>
            </form>
        </div>
        
    </body>
</html>