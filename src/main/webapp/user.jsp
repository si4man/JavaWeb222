<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User · JavaWeb Demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="WEB-INF/header.jsp"/>
        <section class="bg-dark text-light py-4">
            <div class="container">
                <h1 class="h3 mb-0">Сторінка користувача</h1>
                <p class="text-white-50 mb-0">Демонстрація передачі даних від сервлета до JSP</p>
            </div>
        </section>
        <div class="container py-4">
            <%
                String userName = (String) request.getAttribute("userName");
                if (userName == null) {
            %>
            <div class="alert alert-danger">Нелегальний запит в обхід сервлету</div>
            <%
                } else {
            %>
            <div class="card shadow-sm border-0">
                <div class="card-body p-4">
                    <h3 class="h4 mb-2">Привіт, <span class="text-primary"><%= userName %></span>!</h3>
                    <p class="mb-3 text-muted">Доступ легальний. Дані передані від сервлета.</p>
                    <div class="row g-3 align-items-center">
                        <div class="col-auto">
                            <span class="badge text-bg-primary">Online</span>
                        </div>
                        <div class="col-auto">
                            <small class="text-muted">Поточний час сервера:</small>
                        </div>
                        <div class="col-auto">
                            <code><%= new java.util.Date() %></code>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <jsp:include page="WEB-INF/footer.jsp"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
