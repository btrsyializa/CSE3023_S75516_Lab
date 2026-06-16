<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register New Subject</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background-color: #f4f7f6; }
        .form-container { width: 400px; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.05); border-top: 5px solid #2ecc71; }
        h2 { color: #2c3e50; margin-top: 0; }
        input[type="text"] { width: 100%; padding: 8px; margin: 10px 0 20px 0; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        input[type="submit"] { background-color: #2ecc71; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; font-weight: bold; }
        input[type="button"] { background-color: #95a5a6; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; margin-left: 10px; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Register New Subject</h2>
        <form action="../SubjectServlet?action=insert" method="post">
            <label>Subject Code:</label>
            <input type="text" name="subject_code" placeholder="e.g., CSE3023" required>
            
            <label>Subject Name:</label>
            <input type="text" name="subject_name" placeholder="e.g., Web Application Development" required>
            
            <input type="submit" value="Register">
            <input type="button" value="Cancel" onclick="window.location.href='../SubjectServlet?action=list'">
        </form>
    </div>
</body>
</html>