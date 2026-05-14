package com.AafnoSpace.filter;

import com.AafnoSpace.utils.SessionUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = {
    "/home",
    "/about",
    "/product",
    "/product-detail",
    "/contact",
    "/user-dashboard",
    "/admin-profile",
    "/logout"
})
public class AuthenticationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest  req  = (HttpServletRequest)  request;
        HttpServletResponse resp = (HttpServletResponse) response;

        Object user = SessionUtil.getAttribute(req, "user");

        if (user != null) {
            // Logged in — let through
            chain.doFilter(request, response);
        } else {
            // Not logged in — block and redirect to login
            resp.sendRedirect(req.getContextPath() + "/login");
        }
    }
}