<%-- 
    Document   : processAuthor
    Created on : May 12, 2026, 3:30:25 PM
    Author     : Nurbatrisyia Aliza Binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>

<%-- 1. Create the Author object using the JavaBean --%>
<jsp:useBean id="myAuthor" class="lab6.com.Author" scope="request"/>

<%-- 2. Assign data from insertAuthor.jsp into the bean --%>
<jsp:setProperty name="myAuthor" property="*"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Process Author</title>
</head>
<body>

<h1>Lab 6 - Task 1 - Perform creating and retrieving records via JSP page</h1>

<%
int result = 0;

try {
    // 3. Load the database driver
    Class.forName("com.mysql.cj.jdbc.Driver");

    // 4. Create connection
    String myURL = "jdbc:mysql://localhost/cse3023";
    Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");

    // 5. Create PreparedStatement
    String sInsertQry = "INSERT INTO Author (authno, name, address, city, state, zip) VALUES (?, ?, ?, ?, ?, ?)";
    PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);

    myPS.setString(1, myAuthor.getAuthno());
    myPS.setString(2, myAuthor.getName());
    myPS.setString(3, myAuthor.getAddress());
    myPS.setString(4, myAuthor.getCity());
    myPS.setString(5, myAuthor.getState());
    myPS.setString(6, myAuthor.getZip());

    // 6. Execute the query
    result = myPS.executeUpdate();

    if (result > 0) {
        out.println("Record successfully added into Author table...!<br><br>");
        
        // Applying the specific blue styling to match the image
        out.print("<div style=\"color:blue; font-family:'Comic Sans MS', cursive, sans-serif;\">");
        out.print("<p>Record with author no " + myAuthor.getAuthno() + " successfully created..!</p>");
        out.print("<p>Details of record are;</p>");
        out.print("<p>Name : " + myAuthor.getName() + "</p>");
        out.print("<p>Address : " + myAuthor.getAddress() + "</p>");
        out.print("<p>City : " + myAuthor.getCity() + "</p>");
        out.print("<p>State : " + myAuthor.getState() + "</p>");
        out.print("<p>Zip : " + myAuthor.getZip() + "</p>");
        out.print("</div>");
    }

    // 7. Close database connection
    myConnection.close();
    System.out.println("Step 5: Close database connection ...! ");
    System.out.println("Database connection is closed ...! ");

} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>

</body>
</html>