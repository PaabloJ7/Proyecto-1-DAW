<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/welcome.css">
    <link rel="stylesheet" href="css/index.css">
    <title>ShareSkillz</title>
</head>
<body>
<!-- NAVBAR -->
<nav class="navbar">
    <div class="logo">
        <a href="" class="logo">ShareSkillz</a>
    </div>

    <ul class="nav-links">
        <li><a href="inicio.jsp">Inicio</a></li>
        <li><a href="jsp/sobrenosotros.jsp">Sobre nosotros</a></li>
        <li><a href="jsp/contacto.jsp">Contacto</a></li>
        <li><a href="index.jsp">Login</a></li>
    </ul>

</nav>
<!-- HOME -->
<section class="home">
    <div class="text">
        <h1>¡Bienvenido a ShareSkillz!</h1>
    </div>
    <div class="btn">
        <a href="index.jsp" class="btn">Anuncios</a>
    </div>
</section>
<!-- CARDS -->
<section class="skill">
    <h2>Que puedes encontrar?</h2>
    <div class="container">
        <div class="card1">
            <p>Electricidad</p>
        </div>
        <div class="card2">
            <p>Albañileria</p>
        </div>
        <div class="card3">
            <p>Fontaneria</p>
        </div>
        <div class="card4">
            <p>Jardineria</p>
        </div>
    </div>
</section>
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