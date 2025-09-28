package learning.itstep.javaweb222.servlets;

import com.google.gson.Gson;
import com.google.inject.Singleton;
import jakarta.servlet.ServletException;
// import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Base64;
import java.util.UUID;
import learning.itstep.javaweb222.data.dto.User;

@Singleton
public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Gson gson = new Gson();
        // Автентифікація за RFC 7617
        String authHeader = req.getHeader("Authorization");
        if(authHeader == null || "".equals(authHeader)) {
            resp.setStatus(401);
            resp.getWriter().print(
                    gson.toJson("Missing 'Authorization' header")
            );
            return;
        }
        String authScheme = "Basic ";
        if( ! authHeader.startsWith(authScheme) ) {
            resp.setStatus(401);
            resp.getWriter().print(
                    gson.toJson("Invalid Authorization scheme. Must be " + authScheme)
            );
            return;
        }
        String credentials = authHeader.substring(authScheme.length());
        String userPass = new String (Base64.getDecoder().decode(credentials));
        String[] parts = userPass.split(":", 2);
        User user = new User()
                .setId(UUID.randomUUID())
                .setName("Петрович")
                .setEmail("user@i.ua");
        resp.setHeader("Content-Type", "application/json");
        resp.getWriter().print(
                gson.toJson(user)
        );
    }
}

