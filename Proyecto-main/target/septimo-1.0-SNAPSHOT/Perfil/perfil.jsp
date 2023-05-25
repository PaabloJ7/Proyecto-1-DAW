<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../css/mensajes.css">
  <title>Mi perfil</title>
</head>
<body>
<%
  // Obtén el nombre de usuario del logueado
  String firstname = (String) session.getAttribute("login");

  // Verifica si se ha enviado el formulario de modificación
  if (request.getMethod().equalsIgnoreCase("post")) {
    // Obtén los nuevos datos del usuario desde el formulario
    String nuevocontrasena = request.getParameter("nuevocontrasena");
    String nuevoHabilidad = request.getParameter("nuevoHabilidad");

    // Verifica que los campos de contraseña y habilidad no estén vacíos
    if (nuevocontrasena != null && !nuevocontrasena.isEmpty() && nuevoHabilidad != null && !nuevoHabilidad.isEmpty()) {

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
          String lastnameDB = resultSet.getString("lastname");
          String passwordDB = resultSet.getString("password");
          String habilidadDB = resultSet.getString("habilidad");

          // Muestra los datos del usuario antes de la modificación
          out.println("Datos actuales del usuario:");
          out.println("<br>");
          out.println("Nombre de usuario: " + usernameDB);
          out.println("<br>");
          out.println("Apellido:" + lastnameDB);
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

          out.println("<br>");
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
    } else {
      // Si algún campo está vacío, muestra un mensaje de error
      out.println("Error: Debes ingresar una nueva contraseña y una nueva habilidad.");
    }
  } else {
    // Si no se ha enviado el formulario de modificación, muestra los datos actuales del usuario
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
        String lastnameDB = resultSet.getString("lastname");
        String passwordDB = resultSet.getString("password");
        String habilidadDB = resultSet.getString("habilidad");

        // Muestra los datos del usuario
        out.println("Datos actuales del usuario:");
        out.println("<br>");
        out.println("Nombre de usuario: " + usernameDB);
        out.println("<br>");
        out.println("Apellido:" + lastnameDB);
        out.println("<br>");
        out.println("Contraseña: " + passwordDB);
        out.println("<br>");
        out.println("Habilidad: " + habilidadDB);
        out.println("<br>");

        // Muestra el formulario para modificar los datos del usuario
        out.println("<br>");
        out.println("<h2>Modificar Usuario</h2>");
        out.println("<form method=\"post\" action=\"perfil.jsp\">");
        out.println("  <input type=\"hidden\" name=\"firstname\" value=\"" + firstname + "\">");
        out.println("  <label>Nueva Contraseña:</label>");
        out.println("  <input type=\"password\" name=\"nuevocontrasena\" required>");
        out.println("  <br>");
        out.println("  <label>Nueva Habilidad:</label>");
        out.println("  <input type=\"text\" name=\"nuevoHabilidad\" required>");
        out.println("  <br>");
        out.println("  <input type=\"submit\" value=\"Modificar Usuario\">");
        out.println("</form>");
      }
    } catch (Exception e) {
      out.println("Error al obtener los datos del usuario: " + e.getMessage());
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

</body>
<a href="../Login/welcome.jsp">Volver a la página de inicio</a>