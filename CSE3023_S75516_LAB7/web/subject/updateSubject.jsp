<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.lab.bean.SubjectBean"%>
<!DOCTYPE html>
<html>
<head>
    <title>Modify Subject Details</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background-color: #f4f7f6; }
        .form-container { width: 400px; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.05); border-top: 5px solid #3498db; }
        h2 { color: #2c3e50; margin-top: 0; }
        input[type="text"] { width: 100%; padding: 8px; margin: 10px 0 20px 0; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        input[type="submit"] { background-color: #3498db; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; font-weight: bold; }
        input[type="button"] { background-color: #95a5a6; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; margin-left: 10px; }
    </style>
</head>
<body>
    <%
        SubjectBean subject = (SubjectBean) request.getAttribute("subject");
        if(subject != null) {
    %>
    <div class="form-container">
        <h2>Modify Subject</h2>
        <form action="SubjectServlet?action=update" method="post">
            <input type="hidden" name="id" value="<%= subject.getId() %>">
            
            <label>Subject Code:</label>
            <input type="text" name="subject_code" value="<%= subject.getSubject_code() %>" required>
            
            <label>Subject Name:</label>
            <input type="text" name="subject_name" value="<%= subject.getSubject_name() %>" required>
            
            <input type="submit" value="Save Changes">
            <input type="button" value="Cancel" onclick="window.location.href='SubjectServlet?action=list'">
        </form>
    </div>
    <% } else { %>
        <p style="color:red; font-weight:bold;">Error: Unable to load the requested subject data record.</p>
    <% } %>
</body>
</html>