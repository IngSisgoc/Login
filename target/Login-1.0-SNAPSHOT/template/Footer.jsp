<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- footer.jsp --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
<footer class="mt-4 py-4 bg-dark text-white text-center">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h5>Atención al Cliente</h5>
                <ul class="list-unstyled">
                    <li>Teléfono: +51 987 654 321</li>
                    <li>Email: info@tudominio.com</li>
                    <li>Horario: Lunes a Viernes, 9:00 AM - 6:00 PM</li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5>Nuestra Ubicación</h5>
                <p>
                    Chorrillos, Lima, Perú<br>
                    Av. Ingenieros 123
                </p>
            </div>
            <div class="col-md-4">
                <h5>Enlaces Rápidos</h5>
                <ul class="list-unstyled">
                    <li><a href="${pageContext.request.contextPath}/template/EnlacesFooter/preguntasFrecuentes.jsp" class="text-white">Preguntas Frecuentes</a></li>
                    <li><a href="${pageContext.request.contextPath}/template/EnlacesFooter/terminosCondiciones.jsp" class="text-white">Términos y Condiciones</a></li>
                    <li><a href="${pageContext.request.contextPath}/template/EnlacesFooter/politicaPrivacidad.jsp" class="text-white">Política de Privacidad</a></li>
                </ul>
            </div>
        </div>
        <hr class="bg-light">
        <p class="mb-0">&copy; <%= java.time.Year.now()%>. Tu Empresa. Todos los derechos reservados.</p>
    </div>
</footer>