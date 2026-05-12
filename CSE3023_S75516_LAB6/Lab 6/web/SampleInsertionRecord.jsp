<%-- 
    Document   : SampleInsertionRecord
    Created on : May 12, 2026, 2:44:56 PM
    Author     : Nurbatrisyia Aliza Binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sample Insertion Record</title>
</head>

<body>

<h1>Lab 6 - Task 1 - Sample Insertion records into MySQL through JSP's page</h1>

<%
int result = 0;

// Step 1: Load JDBC driver
Class.forName("com.mysql.cj.jdbc.Driver");
out.println("Step 1: MySQL driver loaded...!<br>");

// Step 2: Establish connection
String myURL = "jdbc:mysql://localhost/cse3023";
Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");
out.println("Step 2: Database is connected...!<br>");

// Step 3: Create PreparedStatement
out.println("Step 3: Prepared Statements created...!<br>");
String sInsertQry = "INSERT INTO FirstTable VALUE (?)";
PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);

// Step 4: Perform insertion
out.println("Step 4: Perform insertion of record...!<br>");
String name = "Welcome to access MySQL database with JSP. ...!";
myPS.setString(1, name);
result = myPS.executeUpdate();

// Step 5: Close database connection
out.print("Step 5: Close database connection...! ");
myConnection.close();
out.println("Database connection is closed...!<br><br>");

// Final Output
if(result > 0)
{
    out.print("<p style=\"color:blue; font-family:'Comic Sans MS', cursive, sans-serif;\">The record : (" + name + ") is successfully created..!</p>");
}
%>

</body>
</html>