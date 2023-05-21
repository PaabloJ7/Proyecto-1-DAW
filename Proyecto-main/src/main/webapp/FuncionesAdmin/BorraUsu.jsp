<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.example.proyecto.HelloServlet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%

    Statement s = HelloServlet.conectarBD();
    Connection conexion = HelloServlet.nombradorBD();

    s.executeUpdate("DELETE FROM Contribuyentes WHERE Usuario ='" + request.getParameter("Usuario") + "'");
    s.executeUpdate("DELETE FROM Solicitantes WHERE Usuario ='" + request.getParameter("Usuario") + "'");
    s.executeUpdate("DELETE FROM Usuarios WHERE Usuario ='" + request.getParameter("Usuario") + "'");
%>
<script>document.location = "BorraEditaAdmin.jsp"</script>
</body>
</html>
