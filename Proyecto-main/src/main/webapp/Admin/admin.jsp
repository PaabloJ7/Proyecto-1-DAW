<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestión de Usuarios</title>
    <link rel="stylesheet" href="../css/admin.css      ">
</head>
<body>
<h1>Pagina del Admin</h1>
<div class="container">
<div class="g_usuarios">
<h1>Gestión de Usuarios</h1>

<form method="post" action="borrarUsuario.jsp">
    <label>ID del Usuario a Borrar:</label>
    <input type="text" name="idBorrar">
    <input type="submit" value="Borrar Usuario">
</form>

<br>

<form method="post" action="modificarUsuario.jsp">
    <label>ID del Usuario a Modificar:</label>
    <input type="text" name="idModificar">
    <input type="submit" value="Modificar Usuario">
</form>


<a href="mostrarUsuario.jsp">Ver todos los usuarios</a>
</div>
<div class="g_ayudas">
<h1>Gestión de Ayudas</h1>

<form method="post" action="borrarAyudas.jsp">
    <label>ID de la Ayuda:</label>
    <input type="text" name="idBorrar">
    <input type="submit" value="Borrar Ayuda">
</form>

<br>

<form method="post" action="modificarAyuda.jsp">
    <label>ID de la Ayuda:</label>
    <input type="text" name="idModificar">
    <input type="submit" value="Modificar Ayuda">
</form>


<a href="../Ayudas/mensajes.jsp">Ver todas las ayudas</a>
</div>
    </div>
</body>
</html>
<%@ page import="java.sql.*" %>

<%
    if(session.getAttribute("login") == null) {
        response.sendRedirect("../Login/index.jsp");
    }
%>

<%
    try {
        Class.forName("com.mysql.jdbc.Driver"); // load driver

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser", "root", ""); // create connection

        PreparedStatement pstmt = con.prepareStatement("select * from login"); // SQL query to retrieve all user data
        ResultSet rs = pstmt.executeQuery(); // execute query

        con.close(); // close connection
    } catch(Exception e) {
        out.println(e);
    }
%>