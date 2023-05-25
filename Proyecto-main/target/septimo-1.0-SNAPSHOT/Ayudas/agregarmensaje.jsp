<%@ page import="java.sql.*" %>
<%
  // Obtener los datos del formulario
  String firstname = (String) session.getAttribute("login");
  String habilidad = (String) session.getAttribute("habilidad");
  String message = request.getParameter("message");
  Class.forName("com.mysql.cj.jdbc.Driver");


  // Conectar a la base de datos
  String url = "jdbc:mysql://localhost:3306/dbuser";
  String user = "root";
  String password = "";
  Connection conn = DriverManager.getConnection(url, user, password);

  // Insertar el nuevo mensaje en la base de datos
  PreparedStatement stmt = conn.prepareStatement("INSERT INTO messages (firstname, habilidad, message) VALUES (?, ?, ?)");
  stmt.setString(1, firstname);
  stmt.setString(2, habilidad);
  stmt.setString(3, message);
  stmt.executeUpdate();



  // Cerrar la conexión a la base de datos
  stmt.close();
  conn.close();

  response.sendRedirect("mensajes.jsp");
%>