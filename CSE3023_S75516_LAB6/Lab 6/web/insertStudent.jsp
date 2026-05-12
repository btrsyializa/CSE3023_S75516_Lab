<%-- 
    Document   : insertStudent
    Created on : May 12, 2026, 3:48:34 PM
    Author     : Nurbatrisyia Aliza Binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert Student</title>
    <style>
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
            width: 150px;
        }
        input[type="text"] {
            width: 250px;
        }
        select {
            width: 150px;
        }
        fieldset {
            width: 60%;
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

    <fieldset>
        <legend>Student Registration</legend>
        <form action="processStudent.jsp" method="POST">
            <table>
                <tr>
                    <td>Student No</td>
                    <td><input type="text" name="stuno" placeholder="E.g.: UKXXXXX" required></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" placeholder="Enter your name" required></td>
                </tr>
                <tr>
                    <td>Program</td>
                    <td>
                        <select name="program">
                            <option value="BSc. Soft. Eng.">BSc. Soft. Eng.</option>
                            <option value="BSc. with IM">BSc. with IM</option>
                            <option value="BSc. in Networking">BSc. in Networking</option>
                            <option value="BSc. in Robotics">BSc. in Robotics</option>
                        </select>
                    </td>
                </tr>
            </table>
            
            <input type="submit" value="Submit">
            <input type="reset" value="Cancel">
        </form>
    </fieldset>

    <p>&copy;2016-Mohamad Nor</p>

</body>
</html>