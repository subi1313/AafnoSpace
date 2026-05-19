package com.AafnoSpace.filter;

import com.AafnoSpace.utils.SessionUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = { "/login", "/register", "/regisration", "/uploadpfp" })
/*
 * This filter prevents already logged-in users
 * from accessing login and registration pages again.
 * Logged-in users are automatically redirected
 * to the home page.
 */
public class AuthenticatedUserFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
            throws IOException, ServletException {
        
    	// Cast the generic request/response to HTTP-specific versions
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		//Check if the session exists and contains your login identifier
		boolean isLoggedIn = SessionUtil.getAttribute(httpRequest, "user") != null;

        if (isLoggedIn) {
            // User is already logged in, redirect them to the dashboard
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/home");
            return;
        } else {
            //User is a guest, let them proceed to login/register/home
            chain.doFilter(request, response);
        }
    }
}
