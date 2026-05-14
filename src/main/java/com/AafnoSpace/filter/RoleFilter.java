package com.AafnoSpace.filter;

import com.AafnoSpace.model.UserModel;
import com.AafnoSpace.utils.SessionUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = {
    "/admin-profile",
    "/user-dashboard"
})
public class RoleFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest  req  = (HttpServletRequest)  request;
        HttpServletResponse resp = (HttpServletResponse) response;

        UserModel user = (UserModel) SessionUtil.getAttribute(req, "user");

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String role       = user.getRole();
        String requestURI = req.getRequestURI();

        if (requestURI.contains("/admin-profile") && !"Admin".equals(role)) {
            // Regular user tried to access admin dashboard
            resp.sendRedirect(req.getContextPath() + "/user-dashboard");

        } else if (requestURI.contains("/user-dashboard") && !"User".equals(role)) {
            // Admin tried to access user dashboard
            resp.sendRedirect(req.getContextPath() + "/admin-profile");

        } else {
            chain.doFilter(request, response);
        }
    }
}