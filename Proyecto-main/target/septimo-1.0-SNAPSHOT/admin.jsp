<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestión de Usuarios</title>
    <link rel="stylesheet" href="css/admin.css">
</head>
<body>
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


</body>
</html>