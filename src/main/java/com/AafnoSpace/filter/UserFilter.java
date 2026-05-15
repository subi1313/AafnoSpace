package com.AafnoSpace.filter;

import com.AafnoSpace.model.UserModel;
import com.AafnoSpace.utils.SessionUtil;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter(urlPatterns = {
		"/cart", "/checkout", "/editUserProfile", "/orderHistory", "/order-success", "/userProfile"
})
public class UserFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        UserModel user = (UserModel) SessionUtil.getAttribute(httpRequest, "user");

        // not logged in
        if (user == null) {
        	httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
            return;
        }

        // role check (safe even if null)
        if (user.getRole() == null || !"Customer".equals(user.getRole())) {
        	httpResponse.sendRedirect(httpRequest.getContextPath() + "/home");
            return;
        }

        chain.doFilter(request, response);
    }
}