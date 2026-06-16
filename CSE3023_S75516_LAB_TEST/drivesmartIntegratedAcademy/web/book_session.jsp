<%-- 
    Document   : book_session
    Created on : 16 Jun 2026, 3:24:38 PM
    Author     : Nurbatrisyia Aliza Binti Alias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking a Session</title>
    </head>
    <body>
        <%@include file= "header.html" %>
        
        <div style="margin: 30px;">
            <h2>Register New Driving Lesson</h2>
            <<form action="BookSessionServlet" method="POST">
                <label>Student Name:</label><br>
                <input type="text" name="student_name" required><br><br>
                
                <label>Brach Location:</label><br>
                <select name="branch_location">
                    <option value="Kuala Lumpur">Kuala Lumpur</option>
                    <option value="Penang">Penang</option>
                    <option value="Johor">Johor</option>
                </select><br><br>
                
                <label>Lesson Type:</label><br>
                <select name="lesson_type">
                    <option value="Manual Car">Manual Car</option>
                    <option value="Automatic Car">Automatic Car</option>
                    <option value="Motorcycle">Motorcyle</option>
                </select><br><br>
                
                <button type="submit">Book Session</button>
            </form>
            <br>
            <a href="index.jsp">Back to Home</a>
        </div>
        
        <%@include file="footer.jsp" %>
</body>
</html>