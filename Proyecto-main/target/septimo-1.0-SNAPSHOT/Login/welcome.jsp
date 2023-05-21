<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../css/welcome.css">
	<title>ShareSkills</title>
</head>
<body>

<!-- NAVBAR -->

<div class="navbar">
	<div class="logo">
		<a href="#">ShareSkills</a>
	</div>
	<div class="links">
		<ul>
			<li><a href="#">Inicio</a></li>
			<li><a href="#">Sobre Nosotros</a></li>
			<li><a href="../Perfil/usuario.jsp">Perfil</a></li>
			<li><a href="../Ayudas/mensajes.jsp">Foro Ayudas</a></li>
		</ul>
	</div>
	<div class="login">
		<ul>
			<li>
				(<a href="logout.jsp">Salir</a>)
			</li>
		</ul>
	</div>
</div>

<!-- PRIMER CONTENEDOR -->

<div class="container1">
	<div class="titulo">
		<h1>¡Bienvenido a ShareSkillz!</h1>
	</div>
	<div class="boton">
		<a href="../Ayudas/mensajes.jsp">Anuncios</a>
	</div>
</div>

<!-- SEGUNDO CONTENEDOR -->

<div class="container2">
	<div class="titulo_container2">
		<h2>¿Que habilidades necesitas?</h2>
	</div>
	<div class="tarjetas">
		<div class="tarjeta1">
			<p>Electricidad</p>
		</div>
		<div class="tarjeta2">
			<p>Albañileria</p>
		</div>
		<div class="tarjeta3">
			<p>Fontaneria</p>
		</div>
		<div class="tarjeta4">
			<p>Jardineria</p>
		</div>
	</div>
</div>

<!-- FOOTER -->

<footer>
	<div class="footer-wrapper">
		<div class="footer-section">
			<h3>Acerca de nosotros</h3>
			<p>Somos una compañía de soluciones de software personalizadas y de alta calidad para nuestros clientes.</p>
		</div>
		<div class="footer-section">
			<h3>Nuestros Usuarios</h3>
			<ul>
				<li><a href="#">Investigadores</a></li>
				<li><a href="#">Contribuyentes</a></li>
			</ul>
		</div>
		<div class="footer-section">
			<h3>Contacto</h3>
			<ul>
				<li><i class="fas fa-map-marker-alt"></i> Dirección: Baker Street, London</li>
				<li><i class="fas fa-phone"></i> Teléfono: +442045771101</li>
				<li><i class="fas fa-envelope"></i> Correo electrónico: info@shareskillz.com</li>
			</ul>
		</div>
	</div>
	<div class="footer-bottom">
		<p>Derechos de autor © 2023 ShareSkillz. Todos los derechos reservados.</p>
	</div>
</footer>
</body>
</html>