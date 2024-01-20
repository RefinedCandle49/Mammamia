<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="model.Usuario, model.Categoria, conexion.Conexion, dao.CategoriaDao, java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>Categorías | Sistema Mammamía</title>
</head>
<body>
<%
    // Obtener la sesión
    HttpSession sesion = request.getSession(false);
    
    // Verificación de inicio de sesión
    if (sesion == null || sesion.getAttribute("usuario") == null) {
        System.out.println("Sesión inválida o usuario no presente");
        response.sendRedirect(request.getContextPath() + "/customer/login.jsp");
        return;
    }
    
    //Variable para el nombre del rol
    String nombreRol = (String) ((Usuario) sesion.getAttribute("usuario")).getRol();
%>

<header>
    <ul>
        <li>
            Sistema Wazaaa
        </li>
        <li>
            Bienvenido, <%= nombreRol %>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/customer/logout.jsp">Cerrar Sesión</a>
        </li>
    </ul>
</header>
<%
    List<Categoria> categoria = CategoriaDao.listarCategorias();
    request.setAttribute("list", categoria);
%>
<main>
    <a href="${pageContext.request.contextPath}/admin/inventario.jsp">Regresar</a>
    <h1>Categorías</h1>
    <article class="...">
        <section>
            <%-- Impresion de Errores --%>
            <c:if test="${empty list}">
                <p>No hay pedidos disponibles.</p>
            </c:if>
            
            <c:if test="${not empty list}">
                <table border="1">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>NOMBRE y DESCRIPCIÓN</th>
                        <th>ESTADO</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="cat">
                        <tr>
                            <td>${cat.getIdCategoria()}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/ControlCategoria" method="post">
                                    <input type="hidden" name="idCategoria" value="${cat.getIdCategoria()}">
                                    <table>
                                        <tr>
                                            <td>
                                                <label for="nombre_${cat.getIdCategoria()}">Nombre:</label>
                                            </td>
                                            <td>
                                                <input type="text" id="nombre_${cat.getIdCategoria()}" name="nombre"
                                                       value="${cat.getNombre()}" required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="descripcion_${cat.getIdCategoria()}">Descripción:</label>
                                            </td>
                                            <td>
                                                <input type="text" id="descripcion_${cat.getIdCategoria()}"
                                                       name="descripcion" value="${cat.getDescripcion()}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="submit" value="Modificar Categoria">
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${cat.getEstado() == 1}">Activo</c:when>
                                    <c:otherwise>Estado Desconocido</c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </section>
    </article>
</main>

<footer>
    <p>Copyright@Todos los derechos reservados</p>
    <p>Sistema Mammamía</p>
</footer>
</body>
</html>
