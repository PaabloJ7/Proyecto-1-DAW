<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.example.proyecto.Usuarios" %>
<%@ page import="com.example.proyecto.HelloServlet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - MENU</title>
    <link rel="stylesheet" type="text/css" href="../CSS/menu.css">
</head>
<body id="contenedor">

<%
    Statement s = HelloServlet.conectarBD();
    Connection conexion = HelloServlet.nombradorBD();

    ResultSet listado = s.executeQuery ("SELECT * FROM Contribuyentes");

%>
<div class="edicion">
    <ul>
        <li><a class="inicio" href="../RegistradoIni/perfilAdmin.jsp">Salir de Edición de Usuarios</a></li>
    </ul>
</div>

<table border="1" class="tabla1">
    <caption>Lista de los Contribuyentes</caption>
    <tr><th>Usuario</th><th>Nombre</th><th>Apellidos</th><th>Telefono</th><th>Especialidad</th><th></th></tr>
    <%
        while (listado.next()) {
            out.println("<td>" + listado.getString("Usuario") + "</td>");
            out.println("<td>" + listado.getString("Nombre") + "</td>");
            out.println("<td>" + listado.getString("Apellidos") + "</td>");
            out.println("<td>" + listado.getString("Telefono") + "</td>");
            out.println("<td>" + listado.getString("Especialidad") + "</td>");

    %>
    <td>
        <form method="get" action="BorraUsu.jsp">
            <input type="hidden" name="Usuario" value="<%=listado.getString("Usuario") %>"/>
            <input type="submit" value="Borrar" class="boton2">
        </form>
    </td>
    <td>
        <form method="get" action="FormularioEditaUsuContri.jsp">
            <input type="hidden" name="Usuario" value="<%=listado.getString("Usuario") %>"/>
            <input type="submit" value="Editar" class="boton2">
        </form>
    </td></tr>
    <%
        }
        listado.close();

        ResultSet listado2 = s.executeQuery ("SELECT * FROM Solicitantes");
    %>

</table>


<table border="1" class="tabla2">
    <caption>Lista de los Solicitantes</caption>
    <tr><th>Usuario</th><th>Nombre</th><th>Apellidos</th><th>Telefono</th><th>Ayuda</th></tr>
    <%
        while (listado2.next()) {
            out.println("<td>" + listado2.getString("Usuario") + "</td>");
            out.println("<td>" + listado2.getString("Nombre") + "</td>");
            out.println("<td>" + listado2.getString("Apellidos") + "</td>");
            out.println("<td>" + listado2.getString("Telefono") + "</td>");
            out.println("<td>" + listado2.getString("Ayuda") + "</td>");
    %>
    <td>
        <form method="get" action="BorraUsu.jsp">
            <input type="hidden" name="Usuario" value="<%=listado2.getString("Usuario") %>"/>
            <input type="submit" value="Borrar" class="boton2">
        </form>
    </td>
    <td>
        <form method="get" action="FormularioEditaUsuSoli.jsp">
            <input type="hidden" name="Usuario" value="<%=listado2.getString("Usuario") %>"/>
            <input type="submit" value="Editar" class="boton2">
        </form>
    </td></tr>
    <%
        }
        listado2.close();
        conexion.close();
    %>
</table>

</body>
</html>
