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
    ResultSet resultSet = null;
    try {
      Class.forName("com.mysql.jdbc.Driver");
      connection = DriverManager.getConnection(connectionString, username, password);

      // Consulta los datos actuales del usuario
      String selectQuery = "SELECT * FROM login WHERE firstname = ?";
      statement = connection.prepareStatement(selectQuery);
      statement.setString(1, firstname);
      resultSet = statement.executeQuery();

      if (resultSet.next()) {
        // Obtén los datos del usuario de la base de datos
        String usernameDB = resultSet.getString("firstname");
        String passwordDB = resultSet.getString("password");
        String habilidadDB = resultSet.getString("habilidad");

        // Muestra los datos del usuario antes de la modificación
        out.println("Datos actuales del usuario:");
        out.println("<br>");
        out.println("Nombre de usuario: " + usernameDB);
        out.println("<br>");
        out.println("Contraseña: " + passwordDB);
        out.println("<br>");
        out.println("Habilidad: " + habilidadDB);
        out.println("<br>");

        // Realiza la consulta para modificar los datos del usuario con el ID proporcionado
        String updateQuery = "UPDATE login SET password = ?, habilidad = ? WHERE firstname = ?";
        statement = connection.prepareStatement(updateQuery);
        statement.setString(1, nuevocontrasena);
        statement.setString(2, nuevoHabilidad);
        statement.setString(3, firstname);
        statement.executeUpdate();

        out.println("Datos del usuario modificados exitosamente.");
      }
    } catch (Exception e) {
      out.println("Error al modificar los datos del usuario: " + e.getMessage());
    } finally {
      // Cierre de recursos
      if (resultSet != null) {
        resultSet.close();
      }
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
  <link rel="stylesheet" href="../css/mensajes.css">

</head>
<body>
<h1>Modificar Usuario</h1>

<form method="post" action="perfil.jsp">
  <input type="hidden" name="firstname" value="<%=firstname%>">

  <label>Nueva Contraseña:</label>
  <input type="password" name="nuevocontrasena">
  <br>

  <label>Nueva Habilidad:</label>
  <input type="text" name="nuevoHabilidad">
  <br>

  <input type="submit" value="Modificar Usuario">
</form>
<a href="../Login/welcome.jsp">Volver a la página de inicio</a>
</body>
</html>

