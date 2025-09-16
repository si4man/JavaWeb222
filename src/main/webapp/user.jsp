<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <h1>Hello, user</h1>
                <%
            String fromServlet = (String) request.getAttribute("UserServlet");
            if (fromServlet == null) { %>

        <b>Нелегальний запит в обхід сервлету</b>

        <% } else {%>
        <h3>Передача даних від серверу (контроллера)</h3>
<%= request.getAttribute("UserServlet")%>

<% }%>
    </body>
</html>
