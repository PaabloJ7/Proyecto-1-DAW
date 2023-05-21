<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
  // Obtén el ID del usuario a modificar desde el formulario
  String idModificar = request.getParameter("idModificar");

  // Verifica si se ha enviado el formulario de modificación
  if (request.getMethod().equalsIgnoreCase("post")) {
    // Obtén los nuevos datos del usuario desde el formulario
    String nuevoNombre = request.getParameter("nuevoNombre");
    String nuevoEmail = request.getParameter("nuevoEmail");
    String nuevoHabilidad = request.getParameter("nuevoHabilidad");

    // Realiza las operaciones de modificación en la base de datos
    // Aquí debes reemplazar "tu_cadena_de_conexión", "usuario" y "contraseña" con los valores correctos
    String connectionString = "jdbc:mysql://localhost:3306/dbuser";
    String username = "root";
    String password = "";

    Connection connection = null;
    PreparedStatement statement = null;
    try {
      Class.forName("com.mysql.jdbc.Driver");
      connection = DriverManager.getConnection(connectionString, username, password);

      // Realiza la consulta para modificar los datos del usuario con el ID proporcionado
      String query = "UPDATE login SET firstname = ?, password = ?, habilidad = ? WHERE id = ?";
      statement = connection.prepareStatement(query);
      statement.setString(1, nuevoNombre);
      statement.setString(2, nuevoEmail);
      statement.setString(3, nuevoHabilidad);
      statement.setString(4, idModificar);
      statement.executeUpdate();

      out.println("Datos del usuario modificados exitosamente.");
    } catch (Exception e) {
      out.println("Error al modificar los datos del usuario: " + e.getMessage());
    } finally {
      // Cierre de recursos
      if (statement != null) {
        statement.close();
      }
      if (connection != null) {
        connection.close();
      }
    }
  }
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Modificar Usuario</title>
  <link rel="stylesheet" href="../css/modificarUsuario.css">

</head>
<body>
<h1>Modificar Usuario</h1>

<form method="post" action="modificarUsuario.jsp">
  <input type="hidden" name="idModificar" value="<%=idModificar%>">

  <label>Nuevo Nombre:</label>
  <input type="text" name="nuevoNombre">
  <br>

  <label>Nueva Contraseña:</label>
  <input type="password" name="nuevoEmail">
  <br>

  <label>Nueva Habilidad:</label>
  <input type="text" name="nuevoHabilidad">
  <br>

  <input type="submit" value="Modificar Usuario">
</form>
<a href="admin.jsp">Volver a la pagina del Admin</a>
</body>
</html>