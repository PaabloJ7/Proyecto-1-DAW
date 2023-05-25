<%@ page import="java.sql.*" %>

<%
    if(session.getAttribute("login") == null) {
        response.sendRedirect("../Login/index.jsp");
    }
%>

<%
    try {
        Class.forName("com.mysql.jdbc.Driver"); // load driver

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser", "root", ""); // create connection

        PreparedStatement pstmt = con.prepareStatement("select * from messages"); // SQL query to retrieve all user data
        ResultSet rs = pstmt.executeQuery(); // execute query

%>
<!DOCTYPE html>
<html lang = "es">
<html>
<head>
    <meta charset="UTF-8">
    <title>Mostrar Ayudas</title>
    <link rel="stylesheet" href="../css/mensajes.css">

</head>
<body>
<div class="main-content">
    <h1>Todas las ayudas</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Habilidad</th>
            <th>Mensaje</th>
            <th>Fecha</th>
        </tr>
        <% while(rs.next()) { %>
        <tr>
            <td><%= rs.getString("id") %></td>
            <td><%= rs.getString("firstname") %></td>
            <td><%= rs.getString("habilidad") %></td>
            <td><%= rs.getString("message") %></td>
            <td><%= rs.getString("created_at")%></td>
        </tr>
        <% } %>
    </table>

</div>
<li><a href="admin.jsp">Volver a la pagina Admin</a></li>
</body>
</html>
<%
        con.close(); // close connection
    } catch(Exception e) {
        out.println(e);
    }
%>