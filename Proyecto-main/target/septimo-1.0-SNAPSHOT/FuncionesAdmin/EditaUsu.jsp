<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.Objects" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%

  Statement s = HelloServlet.conectarBD();
  Connection conexion = HelloServlet.nombradorBD();
  String nuevoNombre = request.getParameter("Nombre");
  String nuevoApellidos = request.getParameter("Apellidos");
  String nuevoTelefono = request.getParameter("Telefono");
  String nuevaEspecialidad = request.getParameter("Especialidad");

  Usuarios usu = new Usuarios();

  if(usu.BuscaUsuarios(request.getParameter("Usuario"))){

    ResultSet listado = s.executeQuery("SELECT * FROM Contribuyentes WHERE Usuario ='" + request.getParameter("Usuario") + "'");

    if(Objects.equals(request.getParameter("Nombre"), "")){
      nuevoNombre = listado.getString("Nombre");
    }
    if(Objects.equals(request.getParameter("Apellidos"), "")){
      nuevoApellidos = listado.getString("Apellidos");
    }
    if(Objects.equals(request.getParameter("Telefono"), "")){
      nuevoTelefono = listado.getString("Telefono");
    }
    if(Objects.equals(request.getParameter("Especialidad"), "")){
      nuevaEspecialidad = listado.getString("Especialidad");
    }
    s.executeUpdate("UPDATE Contribuyentes SET Nombre='" + nuevoNombre
            + "',Apellidos='" + nuevoApellidos + "',Telefono='" + nuevoTelefono
            + "',Especialidad='" + nuevaEspecialidad + "' WHERE Usuario='"
            + request.getParameter("Usuario") + "'");

    listado.close();
    conexion.close();
  }else{
    ResultSet listado2 = s.executeQuery("SELECT * FROM Solicitantes WHERE Usuario ='" + request.getParameter("Usuario") + "'");

    if(Objects.equals(request.getParameter("Nombre"), "")){
      nuevoNombre = listado2.getString("Nombre");
    }
    if(Objects.equals(request.getParameter("Apellidos"), "")){
      nuevoApellidos = listado2.getString("Apellidos");
    }
    if(Objects.equals(request.getParameter("Telefono"), "")){
      nuevoTelefono = listado2.getString("Telefono");
    }
    if(Objects.equals(request.getParameter("Ayuda"), "")){
      nuevaEspecialidad = listado2.getString("Ayuda");
    }
    s.executeUpdate("UPDATE Solicitantes SET Nombre='" + nuevoNombre
            + "',Apellidos='" + nuevoApellidos + "',Telefono='" + nuevoTelefono
            + "',Ayuda='" + nuevaEspecialidad + "' WHERE Usuario='"
            + request.getParameter("Usuario") + "'");

    listado2.close();
    conexion.close();
  }
%>
<script>document.location = "BorraEditaAdmin.jsp"</script>
</body>
</html>