<%@ page import="java.sql.*" %>
<%
    // Obtener los datos del formulario
    int messageId = Integer.parseInt(request.getParameter("message_id"));
    String username = request.getParameter("username");
    String reply = request.getParameter("reply");

    // Establecer la conexión a la base de datos
    String url = "jdbc:mysql://localhost:3306/dbuser";
    String user = "root";
    String password = "";
    Connection conn = DriverManager.getConnection(url, user, password);

    // Insertar la respuesta en la tabla de respuestas
    PreparedStatement stmt = conn.prepareStatement("INSERT INTO replies (message_id, username, reply) VALUES (?, ?, ?)");
    stmt.setInt(1, messageId);
    stmt.setString(2, username);
    stmt.setString(3, reply);
    stmt.executeUpdate();

    // Cerrar la conexión a la base de datos
    stmt.close();
    conn.close();

    // Redirigir al usuario de vuelta a la página de detalles del mensaje
    response.sendRedirect("detalles.jsp?id=" + messageId);
%>