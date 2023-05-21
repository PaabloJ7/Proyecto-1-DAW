<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
  // Obtén el nombre de usuario del logueado
  String firstname = (String) session.getAttribute("login");

  // Verifica si se ha enviado el formulario de modificación
  if (request.getMethod().equalsIgnoreCase("post")) {
    // Obtén los nuevos datos del usuario desde el formulario
    String nuevoNombre = request.getParameter("nuevoNombre");
    String nuevocontrasena = request.getParameter("nuevocontrasena");
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
      String query = "UPDATE login SET firstname = ?, password = ?, habilidad = ? WHERE firstname = ?";
      statement = connection.prepareStatement(query);
      statement.setString(1, nuevoNombre);
      statement.setString(2, nuevocontrasena);
      statement.setString(3, nuevoHabilidad);
      statement.setString(4, firstname);
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

<form method="post" action="perfil.jsp">
  <input type="hidden" name="firstname" value="<%=firstname%>">

  <label>Nuevo Nombre:</label>
  <input type="text" name="nuevoNombre">
  <br>

  <label>Nueva Contraseña:</label>
  <input type="password" name="nuevocontrasena">
  <br>

  <label>Nueva Habilidad:</label>
  <input type="text" name="nuevoHabilidad">
  <br>

  <input type="submit" value="Modificar Usuario">
</form>
<a href="../welcome.jsp">Volver a la pagina del Admin</a>
</body>
</html>