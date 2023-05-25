<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mensajes del foro</title>
    <link rel="stylesheet" href="../css/mensajes.css">
</head>
<body>

<!-- Formulario para buscar mensajes -->
<div class="container">
    <h1>Todas las ayudas:</h1>
    <div class="buscar">
        <form class="form" method="get" action="">
            <input class="form-control" type="text" name="txtbuscar">
            <input class="btn btn" type="submit" value="Buscar">
        </form>
    </div>
    <table>
        <tr>
            <th>Nombre</th>
            <th>Habilidad</th>
            <th>Mensaje</th>
            <th>Fecha</th>
        </tr>
        <%
            // Establecer la conexión a la base de datos
            String url = "jdbc:mysql://localhost:3306/dbuser";
            String user = "root";
            String password = "";
            Connection conn = DriverManager.getConnection(url, user, password);

            // Actualizar la columna "habilidad" en los mensajes si es NULL
            Statement updateStmt = conn.createStatement();
            updateStmt.executeUpdate("UPDATE messages m JOIN login l ON m.firstname = l.firstname SET m.habilidad = l.habilidad WHERE m.habilidad IS NULL");

            // Obtener los mensajes del foro
            String nombuscar = request.getParameter("txtbuscar");
            String query = "SELECT * FROM messages";
            if (nombuscar != null && !nombuscar.isEmpty()) {
                query += " WHERE message LIKE '%" + nombuscar + "%' OR habilidad LIKE '%" + nombuscar + "%'";
            }
            query += " ORDER BY created_at DESC";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            // Mostrar los mensajes en una tabla
            while (rs.next()) {
                String firstname = rs.getString("firstname");
                String habilidad = rs.getString("habilidad");
                String message = rs.getString("message");
                String createdAt = rs.getString("created_at");
                int messageId = rs.getInt("id");
        %>
        <tr>
            <td><%= firstname %></td>
            <td><%= habilidad %></td>
            <td>
                <a href="detalles.jsp?id=<%= messageId %>"><%= message %></a>
            </td>
            <td><%= createdAt %></td>
        </tr>
        <% } %>
    </table>

    <h2>Crear ayuda</h2>
    <form action="agregarmensaje.jsp" method="post">
        <label>Mensaje:</label>
        <textarea name="message"></textarea><br>
        <input type="submit" value="Enviar">
    </form>

    <a href="../Login/welcome.jsp">Volver al inicio</a>
</div>
</body>
</html>
