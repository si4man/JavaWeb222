package learning.itstep.javaweb222.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("HomeServlet::doGet");
        req.setAttribute("HomeServlet", "Hello from HomeServlet");
        // return View()
        req.getRequestDispatcher("index.jsp").forward(req, resp);
        
        // return Json()
        resp.setHeader("Content-Type", "application/json");
        resp.getWriter().print("\"This is JSON string\"");
    }
    
}
