<%-- 
    Document   : insertAuthor
    Created on : May 12, 2026, 3:23:54 PM
    Author     : Nurbatrisyia Aliza Binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lab 6 - Task 2</title>
    <style>
        /* Setting the font and spacing to match the reference image */
        body {
            font-family: "Times New Roman", Times, serif;
        }
        table {
            margin-bottom: 15px;
        }
        td {
            padding: 5px 0;
        }
        td:first-child {
            width: 150px; /* Aligns all the text boxes perfectly */
        }
        input[type="text"] {
            width: 250px; /* Makes all input boxes uniform in length */
        }
        fieldset {
            width: 60%; /* Keeps the box from stretching across the whole screen */
            border: 1px solid #999;
            margin-top: 20px;
            margin-bottom: 30px;
        }
        legend {
            font-size: 16px;
        }
    </style>
</head>
<body>

    <h1>Lab 6 - Task 2 - Perform creating and retrieving records via JSP page</h1>
    <hr>

    <fieldset>
        <legend>Author Registration</legend>
        <form action="processAuthor.jsp" method="POST">
            <table>
                <tr>
                    <td>Author No</td>
                    <td><input type="text" name="authno" placeholder="E.g.: UKXXXXX" required></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" placeholder="Enter your name" required></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="address" placeholder="Enter your address"></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td><input type="text" name="city" placeholder="Enter your city"></td>
                </tr>
                <tr>
                    <td>State</td>
                    <td><input type="text" name="state" placeholder="Enter your state"></td>
                </tr>
                <tr>
                    <td>Zip</td>
                    <td><input type="text" name="zip" placeholder="Enter your zip"></td>
                </tr>
            </table>
            
            <input type="submit" value="Submit">
            <input type="reset" value="Cancel">
        </form>
    </fieldset>

    <hr>
    <p>&copy;2018-Dr.Faizah Binti Aplop</p>

</body>
</html>