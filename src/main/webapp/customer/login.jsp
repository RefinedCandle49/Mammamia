<%-- 
    Document   : login
    Created on : 11 ene. 2024, 11:55:16
    Author     : daiko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Cliente" %>
<%@page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de Sesión | Mammamía</title>
    </head>
    <body>
        <!-- Declarar variable de mensaje de error -->
        <% String error = (String) session.getAttribute("error"); %>
        <header>
            <ul>
                <li>
                    <a href="${pageContext.request.contextPath}/index.jsp">
                        <img src="..." alt="logo"/> | Inicio
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/menu.jsp">Menú</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/nosotros.jsp">Nosotros</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/customer/login.jsp">Iniciar Sesión</a>
                </li>
            </ul>
        </header>

        <main>
            <article class="...">
                <h1>Iniciar Sesión</h1>
                <section>
                    <form action="${pageContext.request.contextPath}/controlLogin" method="POST">
                        <label>Email: </label>
                        <input type="text" name="email" required/><br>

                        <label>Contraseña: </label>
                        <input type="password" name="password" required/><br>

                        <input type="submit" value="Ingresar" />
                    </form>
                        
                    <!-- Mensaje de Credenciales Inválidas-->
                    <% if (error !=null) { %>
                    <p style="color: red;"><%= error %></p>
                    <% } %>
                    <br><br>
                </section>

                <section>
                    <a href="...">Crear Cuenta</a><br>

                    <p>Inicia sesión también a través de:</p>
                    <a href="...">Inicia con Google</a><br>
                    <a href="...">Inicia con Facebook</a>
                </section>
            </article>
        </main>

        <footer>
            <ul>
                <li>
                    <img src="..." alt="logo"/>
                    <a href="...">Facebook</a>
                </li>
                <li>
                    <img src="..." alt="logo"/>
                    <a href="...">Instagram</a>
                </li>
                <li>
                    <img src="..." alt="logo"/>
                    <a href="...">Twitter</a>
                </li>
            </ul>

            <ul>
                <li>
                    <a href="${pageContext.request.contextPath}/terminos-condiciones.jsp">Terminos y Condiciones</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/contacto.jsp">Atención al Cliente</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/preguntas-frecuentes.jsp">Preguntas Frecuentes</a>
                </li>
            </ul>
        </footer>
    </body>
</html>