<%-- 
    Document   : addressbook
    Created on : 14 ene. 2024, 18:00:59
    Author     : daiko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Cliente"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="w<idth=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Dirección | Mammamía</title>
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Ropa+Sans&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        
        <link rel="stylesheet" href="<%=request.getContextPath()%>/estilos/index.css">
    </head>
    <body>
        <%
            // Obtener la sesión
            HttpSession sesion = request.getSession(false);
            
            // Obtener la sesion para cliente
            Boolean isLoggedIn = (sesion != null && sesion.getAttribute("isLoggedIn") != null && (Boolean) sesion.getAttribute("isLoggedIn"));
            
            // Obtener la sesion para invitado
            Boolean isGuest = (sesion != null && sesion.getAttribute("isGuest") != null && (Boolean) sesion.getAttribute("isGuest"));
            
            //Declarar variable para nombre del cliente
            int idCliente = -1;
            String nombreCliente = null;
            String apellidoCliente = null;
            String emailCliente = null;
            
            if(isLoggedIn){
                Cliente cliente = (Cliente) sesion.getAttribute("cliente");
                idCliente = cliente.getIdCliente();
                nombreCliente = cliente.getNombre();
                apellidoCliente = cliente.getApellido();
                emailCliente = cliente.getEmail();
            }
        %>

        <header>
            <nav class="navbar navbar-expand-lg navbar-dark">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">
                    <span><img src="${pageContext.request.contextPath}/img/inicio/logo.png" alt="logo" width="30"
                               height="30"></span>
                    Mammamia
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/menu.jsp">Menú <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/nosotros.jsp">Nosotros <span
                                    class="sr-only">(current)</span></a>
                        </li>
                        <!-- Menú para cliente -->
                        <%
                            if (isLoggedIn) {
                        %>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/customer/logout.jsp">Cerrar Sesión
                                <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/customer/account/panel.jsp">Mi cuenta
                                <span class="sr-only">(current)</span></a>
                        </li>
                        <!-- Menú para invitado-->
                        <%
                        } else if (isGuest) {
                        %>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/customer/logout.jsp">Iniciar Sesión<span class="sr-only">(current)</span></a>
                        </li>
                        <%
                        } else {
                        %>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/customer/login.jsp">Iniciar Sesión</a>
                        </li>
                        <%
                            }
                        %>
                    </ul>

                </div>
            </nav>
        </header>

        <main class="text-center">
            
            <h1 class="mt-2">Agregar Dirección</h1>

            <%-- Impresion de Errores --%>
            <c:if test="${not empty errorRegistrarDire}">
                <div class="text-danger">
                    <p>${errorRegistrarDire}</p>
                </div>
            </c:if>
            <%-- --%>
            
            <article class="...">
                <section>
                    <div class="container">
                        <ul class="nav nav-tabs nav-justified">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/customer/account/panel.jsp">Panel de mi Cuenta</a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/controlCliente?action=editarCliente&id=<%= idCliente %>">Editar Información</a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/customer/account/addressbook.jsp">Mis Direcciones</a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/customer/account/wallet.jsp">Mis Tarjetas</a>
                            </li>
                        </ul>
                    </div>
                </section>

<section class="container mt-4 text-center">
  <form action="${pageContext.request.contextPath}/controlCliente?action=registrarDireccion" method="post" class="mx-auto">

    <input type="hidden" name="idCliente" value="<%= idCliente %>"><br>

    <div class="form-group row">
      <label for="nombreDireccion" class="col-sm-2 col-form-label">¿Cómo te gustaría guardar esta dirección?</label>
      <div class="col-sm-6">
        <input type="text" class="form-control form-control-sm" id="nombreDireccion" name="nombreDireccion" required>
      </div>
    </div>

    <div class="form-group row">
      <label for="direccion" class="col-sm-2 col-form-label">Dirección:</label>
      <div class="col-sm-6">
        <input type="text" class="form-control form-control-sm" id="direccion" name="direccion" required>
      </div>
    </div>

    <div class="form-group row">
      <label for="tipoVivienda" class="col-sm-2 col-form-label">Tipo de Vivienda:</label>
      <div class="col-sm-6">
        <select class="form-control form-control-sm" id="tipoVivienda" name="tipoVivienda" required>
          <option disabled selected value="">Seleccionar opción</option>
          <option value="1">Departamento</option>
          <option value="2">Casa</option>
          <option value="3">Condominio</option>
          <option value="4">Empresa</option>
          <option value="5">Hotel</option>
        </select>
      </div>
    </div>

    <div class="form-group row">
      <label for="referencia" class="col-sm-2 col-form-label">Referencia:</label>
      <div class="col-sm-6">
        <input type="text" class="form-control form-control-sm" id="referencia" name="referencia" required>
      </div>
    </div>

    <div class="form-group row">
      <label for="telefono" class="col-sm-2 col-form-label">Teléfono:</label>
      <div class="col-sm-6">
        <input type="text" class="form-control form-control-sm" id="telefono" name="telefono" required>
      </div>
    </div>

    <div class="form-group row">
      <div class="col-sm-6 offset-sm-2">
        <button type="submit" class="btn btn-success btn">Agregar</button>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/customer/account/addressbook.jsp">Regresar</a>
      </div>
    </div>
  </form>
</section>
            </article>
        </main>
          <br>            
          <footer>
            <div class="container-fluid mt-3">
                <div class="social-icons">
                    <i class="fa-brands fa-facebook-f fa-2x" style="color: #ffffff; margin-right: 10px;"></i>
                    <i class="fa-brands fa-instagram fa-2x" style="margin-right: 10px;"></i>
                    <i class="fa-brands fa-tiktok fa-2x"></i>
                </div>
            </div>
            
            
            <div class="container mt-5">
                <div class="row g-4">
                    <div class="col-lg-3 col-md-6">
                        <h4>Enlaces</h4>
                        <div class="footer-links">
                            <a href="#">Local</a><br>
                            <a href="#">Zona reparto</a><br>
                            <a href="${pageContext.request.contextPath}/nosotros.jsp">Nosotros</a><br>
                            <a href="">Atención al
                                cliente</a><br>
                            <a href="${pageContext.request.contextPath}/preguntas-frecuentes.jsp">Preguntas Frecuentes</a><br>
                            <a href="#">Mapa de sitio</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4>Políticas</h4>
                        <div class="footer-links">
                            <a href="#">Políticas de Datos Personales</a><br>
                            <a href="${pageContext.request.contextPath}/terminos-condiciones.jsp">Términos y condiciones de Promociones</a><br>
                            <a href="#">Derechos ARCO</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4>Formas de pago</h4>
                        <i class="fa-brands fa-cc-visa fa-3x" style="color: #ffffff;"></i>
                        <i class="fa-brands fa-cc-mastercard fa-3x" style="color: #ffffff;"></i>
                        <i class="fa-brands fa-cc-amex fa-3x" style="color: #ffffff;"></i>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <form class="small-form">
                            <div class="mb-2">
                                <input type="text" class="form-control" placeholder="Ingrese su correo" name="email">
                            </div>
                            <div class="mb-2 form-check">
                                <input class="form-check-input" type="checkbox" name="remember">
                                <label class="form-check-label">
                                    He leído y revisado los <a class="text-white"
                                                               href="${pageContext.request.contextPath}/terminos-condiciones.jsp">términos
                                    y condiciones</a>
                                </label>
                            </div>
                            <button type="submit" class="btn btn-primary mb-2">ENVIAR</button>
                        </form>
                    </div>
                </div>
            </div>
            <img src="${pageContext.request.contextPath}/img/inicio/logo.png" alt="" class="mx-auto d-block img-logo p-3">
            <div class="text-center">
                <hr>
                <span class="text-white">Todos los derechos reservados © <script>document.write(new Date().getFullYear())</script> </span>
            </div>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>
    </body>
</html>
