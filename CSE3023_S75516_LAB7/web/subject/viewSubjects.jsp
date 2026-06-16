<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.lab.bean.SubjectBean"%>
<!DOCTYPE html>
<html>
<head>
    <title>My Registered Subjects</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background-color: #f4f7f6; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; background: white; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #2ecc71; color: white; }
        tr:hover { background-color: #f1f1f1; }
        .btn-add { background-color: #3498db; color: white; padding: 10px 15px; text-decoration: none; border-radius: 4px; display: inline-block; margin-bottom: 15px; font-weight: bold; }
        .btn-edit { color: #3498db; text-decoration: none; margin-right: 15px; font-weight: bold; }
        .btn-delete { color: #e74c3c; text-decoration: none; font-weight: bold; }
    </style>
</head>
<body>

    <h2>Registered Subjects List</h2>
    <p>Logged in User (Matric No): <strong><%= session.getAttribute("sess_user") %></strong></p>
    
    <a href="subject/registerSubject.jsp" class="btn-add">+ Register New Subject</a>

    <table>
        <tr>
            <th>System ID</th>
            <th>Subject Code</th>
            <th>Subject Name</th>
            <th>Actions</th>
        </tr>
        <% 
            List<SubjectBean> listSubject = (List<SubjectBean>) request.getAttribute("listSubject");
            if (listSubject != null && !listSubject.isEmpty()) {
                for (SubjectBean subject : listSubject) {
        %>
        <tr>
            <td><%= subject.getId() %></td>
            <td><%= subject.getSubject_code() %></td>
            <td><%= subject.getSubject_name() %></td>
            <td>
                <a href="SubjectServlet?action=edit&id=<%= subject.getId() %>" class="btn-edit">Edit</a>
                <a href="SubjectServlet?action=delete&id=<%= subject.getId() %>" class="btn-delete" onclick="return confirm('Are you sure you want to drop this subject?')">Delete</a>
            </td>
        </tr>
        <% 
                }
            } else {
        %>
        <tr>
            <td colspan="4" style="text-align: center; color: #7f8c8d; padding: 20px;">No registered subjects found for your account.</td>
        </tr>
        <% 
            } 
        %>
    </table>
    <br>
    <a href="dashboard.jsp" style="text-decoration: none; color: #7f8c8d;">&larr; Return to Dashboard</a>
</body>
</html>