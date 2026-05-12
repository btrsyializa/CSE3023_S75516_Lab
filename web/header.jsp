<%@ page import="com.lab.model.User" %>
<%
    // Check session kat sini terus supaya tak payah tulis kat setiap page
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<style>
    .navbar-global {
        background: rgba(255, 255, 255, 0.05);
        backdrop-filter: blur(10px);
        padding: 15px 40px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        position: sticky;
        top: 0;
        z-index: 1000;
    }
    .nav-brand { color: #e0aaff; font-size: 1.5rem; font-weight: 800; }
    .logout-link { color: #f87171; text-decoration: none; font-weight: bold; transition: 0.3s; }
    .logout-link:hover { text-shadow: 0 0 10px rgba(248, 113, 113, 0.5); }
</style>

<nav class="navbar-global">
    <div class="nav-brand">UMT Gaming Lounge</div>
    <div style="display: flex; gap: 20px; align-items: center;">
        <span style="font-size: 0.9rem; color: #adb5bd;">Role: <strong><%= user.getRole().toUpperCase() %></strong></span>
        <a href="<%= request.getContextPath() %>/LoginServlet?action=logout" class="logout-link">Logout</a>
    </div>
</nav>