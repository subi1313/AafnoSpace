package com.AafnoSpace.filter;

import com.AafnoSpace.utils.SessionUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = { "/login", "/register" })
public class AuthenticatedUserFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest  req  = (HttpServletRequest)  request;
        HttpServletResponse resp = (HttpServletResponse) response;

        Object user = SessionUtil.getAttribute(req, "user");

        if (user != null) {
            //already logged in, send away from login/register
            resp.sendRedirect(req.getContextPath() + "/home");
        } else {
            //not logged in, allow access to login/register
            chain.doFilter(request, response);
        }
    }
}