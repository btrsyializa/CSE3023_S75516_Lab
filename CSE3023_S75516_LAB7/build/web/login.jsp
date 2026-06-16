<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Portal Login</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f7f6; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .login-container { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); width: 350px; border-top: 5px solid #2ecc71; }
        h2 { text-align: center; color: #2c3e50; margin-bottom: 20px; }
        label { font-weight: bold; color: #34495e; }
        input[type="text"], input[type="password"] { width: 100%; padding: 10px; margin: 8px 0 20px 0; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        input[type="submit"] { width: 100%; background-color: #2ecc71; color: white; padding: 12px; border: none; border-radius: 4px; cursor: pointer; font-weight: bold; font-size: 16px; }
        .msg { color: #e74c3c; text-align: center; font-weight: bold; margin-bottom: 15px; }
        .register-prompt { text-align: center; margin-top: 20px; font-size: 14px; color: #7f8c8d; border-top: 1px solid #eee; padding-top: 15px; }
        .register-prompt a { color: #2ecc71; text-decoration: none; font-weight: bold; }
        .register-prompt a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Student Login</h2>
        
        <%-- Displays status alerts (e.g., success message after registering successfully) --%>
        <% 
            String msg = request.getParameter("msg");
            if(msg != null) { 
        %>
            <div class="msg" style="color: #27ae60;"><%= msg %></div>
        <% } %>
        
        <form action="doLogin.jsp" method="post">
            <label>Matric No:</label>
            <input type="text" name="username" placeholder="Enter your Matric No" required>
            
            <label>Password:</label>
            <input type="password" name="password" placeholder="Enter your Password" required>
            
            <input type="submit" value="Login">
        </form>

        <div class="register-prompt">
            Don't have an account yet? <a href="register.html">Register here</a>
        </div>
    </div>
</body>
</html>