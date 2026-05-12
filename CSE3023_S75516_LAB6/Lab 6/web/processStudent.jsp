<%-- 
    Document   : processStudent
    Created on : May 12, 2026, 3:49:11 PM
    Author     : Nurbatrisyia Aliza Binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%-- Define the error page routing --%>
<%@page errorPage="errorStudent.jsp" %>

<%-- Create the Student object using the JavaBean --%>
<jsp:useBean id="myStudent" class="lab6.com.Student" scope="request"/>
<jsp:setProperty name="myStudent" property="*"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Process Student</title>
</head>
<body>

<%
int result = 0;

// Step 1: Load JDBC driver
Class.forName("com.mysql.cj.jdbc.Driver");

// Step 2: Establish the connection
String myURL = "jdbc:mysql://localhost/cse3023";
Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");

// Step 3: Create PreparedStatement
String sInsertQry = "INSERT INTO Student (stuno, stuname, stuprogram) VALUES (?, ?, ?)";
PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);

// Assign values (Calling getStuno() here will trigger the Regex check!)
myPS.setString(1, myStudent.getStuno());
myPS.setString(2, myStudent.getName());
myPS.setString(3, myStudent.getProgram());

// Step 4: Execute the query
result = myPS.executeUpdate();

if (result > 0) {
    // Applying the specific blue styling to match your 3rd image
    out.print("<div style=\"color:blue; font-family:'Comic Sans MS', cursive, sans-serif;\">");
    out.print("<p>Record with student no " + myStudent.getStuno() + " successfully created..!</p>");
    out.print("<p>Details of record are;</p>");
    out.print("<p>Student ID : " + myStudent.getStuno() + "</p>");
    out.print("<p>Name : " + myStudent.getName() + "</p>");
    out.print("<p>Program : " + myStudent.getProgram() + "</p>");
    out.print("</div>");
}

// Step 5: Close database connection
myConnection.close();
%>

</body>
</html>