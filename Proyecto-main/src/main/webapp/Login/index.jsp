<%@ page import="java.sql.*" %>  

<%
if(session.getAttribute("login")!=null) //check login session user not access or back to inicio.jsp page
{
	response.sendRedirect("welcome.jsp");
}
%>

<%
try
{
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser","root",""); //create connection

	if(request.getParameter("btn_login")!=null) //check login button click event not null
	{
		String dbfirstname,dbpassword;
		
		String firstname,password;
		
		firstname=request.getParameter("txt_firstname"); //txt_firstname
		password=request.getParameter("txt_password"); //txt_password
		
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("select * from login where firstname=? AND password=?"); //sql select query
		pstmt.setString(1,firstname);
		pstmt.setString(2,password);
		
		ResultSet rs=pstmt.executeQuery(); //execute query and store in resultset object rs.
		
		if(rs.next())
		{
			dbfirstname=rs.getString("firstname");
			dbpassword=rs.getString("password");
			if(firstname.equals("admin") && password.equals("admin")) {
				response.sendRedirect("../Admin/admin.jsp"); // redirigir al usuario admin a admin.jsp
			}
			if(firstname.equals(dbfirstname) && password.equals(dbpassword))
			{
				session.setAttribute("login", dbfirstname);
					response.sendRedirect("welcome.jsp"); // redirigir al usuario
				} else {
					session.setAttribute("login", dbfirstname);
					response.sendRedirect("index.jsp");
				}
			} else {
				request.setAttribute("errorMsg", "Error de usuario o contraseña ");
			}

		}

		con.close(); //close connection	


}
catch(Exception e)
{
	out.println(e);
}
%>

<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Login</title>

	<link rel="stylesheet" href="../css/login-register.css">
	
	<script>
		
		function validate()
		{
			var firstname = document.myform.txt_firstname;
			var password = document.myform.txt_password;
				
			if (firstname.value == null || firstname.value == "") //check firstname textbox not blank
			{
				window.alert("porfavor ingrese nombre de usuario ?"); //alert message
				firstname.style.background = '#f08080';
				firstname.focus();
				return false;
			}
			if (password.value == null || password.value == "") //check password textbox not blank
			{
				window.alert("porfavor ingrese contraseña ?"); //alert message
				password.style.background = '#f08080'; 
				password.focus();
				return false;
			}
		}
			
	</script>
	
</head>

<body>


    <div class="main-content">

        <form class="form-register" method="post" name="myform" onsubmit="return validate();">

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Iniciar sesion</h1>
                    </div>
					
					<p style="color:red">				   		
					<%
					if(request.getAttribute("errorMsg")!=null)
					{
						out.println(request.getAttribute("errorMsg")); //error message for firstname or password 
					}
					%>
					</p>
				   
				   </br>

                    <div class="form-row">
                        <label>
                            <span>Usuario</span>
                            <input type="text" name="txt_firstname" id="firstname" placeholder="Ingresar usuario">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Contraseña</span>
                            <input type="password" name="txt_password" id="password" placeholder="Ingresar contraseña">
                        </label>
                    </div>
					<div class="login">
					<input type="submit" name="btn_login" value="Inicir sesion">
					</div>
                </div>

				<a href="register.jsp" class="form-log-in-with-existing">No tienes cuenta? <b> Registrate aqui </b></a>

            </div>

        </form>

    </div>

</body>

</html>
