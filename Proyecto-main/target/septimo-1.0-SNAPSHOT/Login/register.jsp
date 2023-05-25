<%@ page import="java.sql.*" %>  

<%
if(session.getAttribute("login")!=null)
{
	response.sendRedirect("welcome.jsp");
}
%>


<%
try
{
	Class.forName("com.mysql.jdbc.Driver"); // Cargar driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser","root",""); // Crear conexion
	
	if(request.getParameter("btn_register")!=null)
	{
		String firstname,lastname,email,habilidad,password;
		
		firstname=request.getParameter("txt_firstname"); //txt_firstname
		lastname=request.getParameter("txt_lastname"); //txt_lastname
		email=request.getParameter("txt_email"); //txt_email
		habilidad=request.getParameter("txt_habilidad"); //txt_habilidad
		password=request.getParameter("txt_password"); //txt_password
		
		PreparedStatement pstmt=null;
		
		pstmt=con.prepareStatement("insert into login(firstname,lastname,email,habilidad,password) values(?,?,?,?,?)"); // Query
		pstmt.setString(1,firstname);
		pstmt.setString(2,lastname);
		pstmt.setString(3,email);
		pstmt.setString(4,habilidad);
		pstmt.setString(5,password);
		
		pstmt.executeUpdate(); // Ejecutar Query
		
		request.setAttribute("successMsg","Registro completado...! Porfavor inicia sesión"); //Mensaje de registro completado

		con.close(); // Cerrar conexion
	}
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
		
	<title>Registro</title>

	<link rel="stylesheet" href="../css/main.css">
	<link rel="stylesheet" href="../css/login-register.css">
	
	<!-- Script javascrip para la validacion de registro-->
	<script>	
	
		function validate()
		{
			var first_name= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
			var last_name= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
			var email_valid= /^[\w\d\.]+\@[a-zA-Z\.]+\.[A-Za-z]{1,4}$/; //pattern valid email validation
			var habilidad_valid= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z
			var password_valid=/^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/; //pattern password allowed A to Z, a to z, 0-9, !@#$%&*()<> charecter 

			var fname = document.getElementById("fname"); //textbox id fname
            var lname = document.getElementById("lname"); //textbox id lname
            var email = document.getElementById("email"); //textbox id email
			var habilidad = document.getElementById("habilidad"); //textbox id habilidad
            var password = document.getElementById("password"); //textbox id password
			
			if(!first_name.test(fname.value) || fname.value=='') 
            {
				alert("Solo letras en nombre de usuario....!");
                fname.focus();
                fname.style.background = '#f08080';
                return false;                    
            }
			if(!last_name.test(lname.value) || lname.value=='') 
            {
				alert("Solo letras en apellido....!");
                lname.focus();
                lname.style.background = '#f08080';
                return false;                    
            }
			if(!email_valid.test(email.value) || email.value=='') 
            {
				alert("Email no valido....!");
                email.focus();
                email.style.background = '#f08080';
                return false;                    
            }
			if(!habilidad_valid.test(habilidad.value) || habilidad.value=='')
			{
				alert("Habilidad no valida....!");
				email.focus();
				email.style.background = '#f08080';
				return false;
			}
			if(!password_valid.test(password.value) || password.value=='') 
            {
				alert("Debe tener entre 1 y 12 caracteres");
                password.focus();
                password.style.background = '#f08080';
                return false;                    
            }
		}
		
	</script>	

</head>

<body>

    <div class="main-content">

        <form class="form-register" method="post" onsubmit="return validate();">

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Registrarse</h1>
                    </div>
				   
					<p style="color:green">				   		
					<%
					if(request.getAttribute("successMsg")!=null)
					{
						out.println(request.getAttribute("successMsg")); //Registro completado
					}
					%>
					</p>
				   
				   </br>
				   
                    <div class="form-row">
                        <label>
                            <span>Nombre de usuario</span>
                            <input type="text" name="txt_firstname" id="fname" placeholder="nombre de usuario">
                        </label>
                    </div>
					<div class="form-row">
                        <label>
                            <span>Apellido</span>
                            <input type="text" name="txt_lastname" id="lname" placeholder="apellido">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Email</span>
                            <input type="text" name="txt_email" id="email" placeholder="email">
                        </label>
                    </div>

					<div class="form-row">
						<label>
							<span>Habilidad</span>
							<input type="text" name="txt_email" id="habilidad" placeholder="habilidad">
						</label>
					</div>

                    <div class="form-row">
                        <label>
                            <span>Contraseña</span>
                            <input type="password" name="txt_password" id="password" placeholder="contraseña">
                        </label>
                    </div>

					<input type="submit" name="btn_register" value="Register">
					
                </div>
				
                <a href="index.jsp" class="form-log-in-with-existing">Ya tienes cuenta? <b> Inicia sesion aqui </b></a>

            </div>

        </form>

    </div>

</body>

</html>
