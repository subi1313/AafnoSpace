package com.AafnoSpace.filter;

import com.AafnoSpace.utils.SessionUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = {
    "/home",
    "/about", "/aboutus", "/product", "/products", "/product-detail", "/product-details", "/contact", "/contactus",
    "/cart", "/checkout", "/editUserProfile", "/orderHistory", "/order-success", "/userProfile",
    "/admin", "/admin-dashboard", "/admin-profile", "/add-product", "/product-list", "/update-product", "/delete-product", "/editAdminProfile", 
    "/userManagement",
    "/logout"
})
public class AuthenticationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// Cast the generic request/response to HTTP-specific versions
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		// Logic: Check if the session exists and contains your login identifier
		boolean isLoggedIn = SessionUtil.getAttribute(httpRequest, "user") != null;

		if (isLoggedIn) {
			// User is logged in, allow the request to proceed to the destination
			// In my case, now go to that servlet which I have called
			chain.doFilter(request, response);
		} else {
			// User is not logged in, redirect to login page
			// Note: Avoid caching the dashboard so the back button doesn't reveal data
			httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
		}
	}
}
