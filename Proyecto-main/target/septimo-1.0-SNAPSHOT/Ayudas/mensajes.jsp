<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mensajes del foro</title>
    <link rel="stylesheet" href="../css/mensajes.css">
</head>
<body>

<h1>Todas las ayudas:</h1>
<%
    // Establecer la conexión a la base de datos
    String url = "jdbc:mysql://localhost:3306/dbuser";
    String user = "root";
    String password = "";
    Connection conn = DriverManager.getConnection(url, user, password);

    // Obtener los mensajes del foro
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM messages ORDER BY created_at DESC");

    // Mostrar los mensajes en una tabla
    out.println("<table>");
    while (rs.next()) {
        String firstname = rs.getString("firstname");
        String message = rs.getString("message");
        String createdAt = rs.getString("created_at");
        int messageId = rs.getInt("id");
        out.println("<tr><td>" + firstname + "</td><td><a href=\"detalles.jsp?id=" + messageId + "\">" + message + "</a></td><td>" + createdAt + "</td></tr>");
    }
    out.println("</table>");

    // Cerrar la conexión a la base de datos
    rs.close();
    stmt.close();
    conn.close();
%>

<h2>Crear ayuda</h2>
<form action="agregarmensaje.jsp" method="post">
    <label>Mensaje:</label>
    <textarea name="message"></textarea><br>
    <input type="submit" value="Send">
</form>

<a href="../Login/welcome.jsp">Volver al inicio</a>
</body>
</html>