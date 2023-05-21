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

        PreparedStatement pstmt = con.prepareStatement("select * from login"); // SQL query to retrieve all user data
        ResultSet rs = pstmt.executeQuery(); // execute query

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Perfil</title>
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/perfil.css">
</head>
<body>
<div class="main-content">
    <h1>Perfil</h1>
    <table>
        <tr>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>Email</th>
        </tr>
        <% while(rs.next()) { %>
        <tr>
            <td><%= rs.getString("firstname") %></td>
            <td><%= rs.getString("lastname") %></td>
            <td><%= rs.getString("email") %></td>
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