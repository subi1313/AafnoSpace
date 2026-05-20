package com.AafnoSpace.filter;

import com.AafnoSpace.model.UserModel;
import com.AafnoSpace.utils.SessionUtil;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter(urlPatterns = {
		"/admin", "/admin-dashboard", "/admin-profile", "/add-product", "/product-list", "/update-product", "/delete-product", "/editAdminProfile", 
	    "/userManagement, /orderManagement"
})
/*
 * This filter restricts access to admin-only pages
 * such as dashboard, product management, and user management.
 * Only users with the "Admin" role are allowed access.
 * Unauthorized users are redirected to login or home page.
 */
public class AdminFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,FilterChain chain)throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        UserModel user = (UserModel) SessionUtil.getAttribute(httpRequest, "user");

        // not logged in
        if (user == null) {
        	httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
        	return;
        }

        // role check
        if (user.getRole() == null || !"Admin".equals(user.getRole())) {
        	httpResponse.sendRedirect(httpRequest.getContextPath() + "/home");
            return;
        }

        chain.doFilter(request, response);
    }
}