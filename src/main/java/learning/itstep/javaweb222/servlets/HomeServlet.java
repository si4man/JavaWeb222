package learning.itstep.javaweb222.servlets;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import learning.itstep.javaweb222.services.kdf.KdfService;
import learning.itstep.javaweb222.services.timestamp.TimestampService;

@Singleton
public class HomeServlet extends HttpServlet {
    private final KdfService kdfService;
    private final TimestampService timestampService;

    @Inject
    public HomeServlet(KdfService kdfService, TimestampService timestampService) {
        this.kdfService = kdfService;
        this.timestampService = timestampService;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("HomeServlet", "Hello from HomeServlet " + kdfService.dk("123", ""));
        req.setAttribute("UnixTimestampSeconds", String.valueOf(timestampService.nowSeconds()));
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
