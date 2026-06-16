<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%  String user = request.getParameter("username");
    String pass = request.getParameter("password");

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/lab7_db", "root", "");
        
        // Accurate table lookup pattern
        String sql = "SELECT * FROM students WHERE matric_no=? AND password=?";
        ps = conn.prepareStatement(sql);
        ps.setString(1, user);
        ps.setString(2, pass);
        
        rs = ps.executeQuery();
        
        if (rs.next()) {
            session.setAttribute("sess_user", rs.getString("matric_no")); // Set context variable
            session.setAttribute("sess_fname", rs.getString("fullname"));
            
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("login.jsp?msg=Invalid username or password..!");
        }
    } catch (Exception e) {
        out.println("Database Error: " + e.getMessage());
    } finally {
        if (rs != null) try { rs.close(); } catch(Exception e) {}
        if (ps != null) try { ps.close(); } catch(Exception e) {}
        if (conn != null) try { conn.close(); } catch(Exception e) {}
    }
%>