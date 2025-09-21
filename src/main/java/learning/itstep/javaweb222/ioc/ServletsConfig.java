package learning.itstep.javaweb222.ioc;

import com.google.inject.servlet.ServletModule;
import learning.itstep.javaweb222.servlets.HomeServlet;
import learning.itstep.javaweb222.servlets.UserServlet;

public class ServletsConfig extends ServletModule {

    @Override
    protected void configureServlets() {
        serve("/").with(HomeServlet.class);
        serve("/user").with(UserServlet.class);
    }
}
