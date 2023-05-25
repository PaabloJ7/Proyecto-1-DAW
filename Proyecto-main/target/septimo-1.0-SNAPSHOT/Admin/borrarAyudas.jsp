<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    // Obtén el ID del usuario a borrar desde el formulario
    String idBorrar = request.getParameter("idBorrar");

    // Realiza las operaciones de borrado en la base de datos
    // Aquí debes reemplazar "tu_cadena_de_conexión", "usuario" y "contraseña" con los valores correctos
    String connectionString = "jdbc:mysql://localhost:3306/dbuser";
    String username = "root";
    String password = "";

    Connection connection = null;
    PreparedStatement statement = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(connectionString, username, password);

        String query = "DELETE FROM replies WHERE message_id = ?";
        statement = connection.prepareStatement(query);
        statement.setString(1, idBorrar);
        statement.executeUpdate();


        // Realiza la consulta para borrar el usuario con el ID proporcionado
        String query1 = "DELETE FROM messages WHERE id = ?";
        statement = connection.prepareStatement(query1);
        statement.setString(1, idBorrar);
        statement.executeUpdate();



        out.println("Ayuda borrada exitosamente.");
    } catch (Exception e) {
        out.println("Error al borrar la ayuda: " + e.getMessage());
    } finally {
        // Cierre de recursos
        if (statement != null) {
            statement.close();
        }
        if (connection != null) {
            connection.close();
        }
    }
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Borrar Ayuda</title>
    <link rel="stylesheet" href="../css/modificarUsuario.css">
</head>
<html>
<a href="admin.jsp">Volver a la pagina del Admin</a>
</html>