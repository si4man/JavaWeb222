<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home · JavaWeb Demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="WEB-INF/header.jsp"/>
        <section class="bg-primary text-light py-5 mb-0">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-8">
                        <h1 class="display-5 fw-semibold mb-2">Вітаємо у демо Java Web</h1>
                        <p class="lead mb-0">Приклад JSP + Servlet зі стилями Bootstrap 5. Оновлений, охайний дизайн зберігає функціонал.</p>
                    </div>
                </div>
            </div>
        </section>
        <div class="container py-4">
            <%
                String fromServlet = (String) request.getAttribute("HomeServlet");
                if (fromServlet == null) {
            %>
            <div class="alert alert-danger mb-4">Нелегальний запит в обхід сервлету</div>
            <%
                } else {
            %>
            <div class="row g-4">
                <div class="col-lg-8">
                    <div class="card shadow-sm h-100">
                        <div class="card-body">
                            <h2 class="h4 mb-3">Java EE</h2>
                            <p class="mb-3">
                                Java Enterprise Edition — це Java плюс додаткові модулі для роботи з мережею.
                                До складу входить сервер застосунків (App Server). Може знадобитися встановити окремо:
                            </p>
                            <div class="d-flex gap-3 flex-wrap">
                                <a class="btn btn-outline-primary btn-sm" href="https://tomcat.apache.org/">Apache Tomcat</a>
                                <a class="btn btn-outline-primary btn-sm" href="https://glassfish.org/">Eclipse GlassFish</a>
                                <a class="btn btn-outline-primary btn-sm" href="https://www.wildfly.org/">WildFly</a>
                            </div>
                            <hr class="my-4">
                            <h2 class="h4 mb-2">JSP</h2>
                            <p class="mb-0">Java Server Pages — технологія створення веб-сторінок.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card border-0 bg-light h-100">
                        <div class="card-body">
                            <h3 class="h5 mb-3">Вирази</h3>
            <p>
                Інструкції (дії без результату) задаються спецтегом
                <code>&lt;% String str = "Hello World!";%&gt;</code>
                <% String str = "Hello World!";%>
                <br>
                Вирази (дії з результатом, що виводиться) задаються спецтегом
                <code>&lt;%= str + "!" %&gt; &rarr; <%= str + "!"%></code> 
            </p>
                        </div>
                    </div>
                </div>
            </div>
            <h3 class="mt-5 mb-3">Приклад з масивом</h3>
            <% String[] arr = {"Item 1", "Item 2", "Item 3", "Item 4", "Item 5"}; %>
            <p class="text-muted mb-2">Вивести парні індекси курсивом, непарні — жирним (0 вважати парним):</p>
            <ul class="mt-2 list-group list-group-flush">
                <% for (int i = 0; i < arr.length; i++) { %>
                <li class="list-group-item">
                    <% if (i % 2 == 0) { %>
                    <i><%= arr[i]%></i>
                    <% } else { %>
                    <b><%= arr[i]%></b>
                    <% } %>
                </li>    
                <% }%>
            </ul>
            <h3 class="mt-5 mb-3">Шаблонізація, підключення компонентів</h3>
            <jsp:include page="WEB-INF/fragment.jsp">
                <jsp:param name="key" value="Value"/>
            </jsp:include>
            <h3 class="mt-5 mb-3">Передача даних від серверу (контролера)</h3>
            <div class="alert alert-info"><%= request.getAttribute("HomeServlet") %></div>
            <% } %>
        </div>
        <jsp:include page="WEB-INF/footer.jsp"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
