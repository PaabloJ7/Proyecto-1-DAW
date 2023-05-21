<%@ page import="java.sql.*" %>
<%

    // Obtener el ID del mensaje de los parámetros de la URL
    int messageId = Integer.parseInt(request.getParameter("id"));

    // Establecer la conexión a la base de datos
    String url = "jdbc:mysql://localhost:3306/dbuser";
    String user = "root";
    String password = "";
    Connection conn = DriverManager.getConnection(url, user, password);

    // Obtener los detalles del mensaje
    PreparedStatement stmt = conn.prepareStatement("SELECT * FROM messages WHERE id = ?");
    stmt.setInt(1, messageId);
    ResultSet rs = stmt.executeQuery();
    rs.next();
    String firstname = rs.getString("firstname");
    String message = rs.getString("message");
    String createdAt = rs.getString("created_at");

    // Obtener las respuestas del mensaje
    stmt = conn.prepareStatement("SELECT * FROM replies WHERE message_id = ? ORDER BY created_at ASC");
    stmt.setInt(1, messageId);
    rs = stmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalles del mensaje</title>
    <link rel="stylesheet" href="../css/mensajes.css">
</head>
<body>

<h1>Detalles del mensaje</h1>

<table>
    <tr>
        <td><strong>firstname:</strong></td>
        <td><%= firstname %></td>
    </tr>
    <tr>
        <td><strong>Message:</strong></td>
        <td><%= message %></td>
    </tr>
    <tr>
        <td><strong>Created at:</strong></td>
        <td><%= createdAt %></td>
    </tr>
</table>

<h2>Responder al mensaje</h2>
<form action="agregarrespuesta.jsp" method="post">
    <input type="hidden" name="message_id" value="<%= messageId %>">
    <label>Reply:</label>
    <textarea name="reply"></textarea><br>
    <input type="submit" value="Send">
</form>
<h2>Respuestas:</h2>
<%
    // Mostrar los datos del mensaje y las respuestas en la página
    while (rs.next()) {
        String replyfirstname = rs.getString("firstname");
        String reply = rs.getString("reply");
        String replyCreatedAt = rs.getString("created_at");
%>

<div class="reply">
    <a><strong>firstname:</strong> <%= replyfirstname%></a>
    <br>
    <a><strong>Message:</strong> <%= reply%></a>
    <br>
    <a><strong>Created at:</strong> <%= replyCreatedAt%></a>
    <br>

</div>
<%
    }

    // Cerrar la conexión a la base de datos
    rs.close();
    stmt.close();
    conn.close();
%>


<a href="mensajes.jsp">Volver a la lista de mensajes</a>

</body>
</html>