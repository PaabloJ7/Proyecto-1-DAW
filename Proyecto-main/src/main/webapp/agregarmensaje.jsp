<%@ page import="java.sql.*" %>
<%
  // Obtener los datos del formulario
  String username = request.getParameter("username");
  String message = request.getParameter("message");
  Class.forName("com.mysql.cj.jdbc.Driver");
  if (username != null && message != null) {
    // Conectar a la base de datos
    String url = "jdbc:mysql://localhost:3306/dbuser";
    String user = "root";
    String password = "";
    Connection conn = DriverManager.getConnection(url, user, password);

    // Insertar el nuevo mensaje en la base de datos
    PreparedStatement stmt = conn.prepareStatement("INSERT INTO messages (username, message) VALUES (?, ?)");
    stmt.setString(1, username);
    stmt.setString(2, message);
    stmt.executeUpdate();

    // Cerrar la conexión a la base de datos
    stmt.close();
    conn.close();
  }
  response.sendRedirect("mensajes.jsp");
%>