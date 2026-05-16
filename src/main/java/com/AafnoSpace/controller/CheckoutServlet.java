package com.AafnoSpace.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.AafnoSpace.model.CartModel;
import com.AafnoSpace.model.UserModel;
import com.AafnoSpace.service.CheckoutService;
import com.AafnoSpace.service.CartService;
import com.AafnoSpace.utils.SessionUtil;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/checkout" })
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/pages/checkout.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    try {

	        UserModel user = (UserModel) SessionUtil.getAttribute(request, "user");

	        String[] selectedItems = request.getParameterValues("selectedItems");

	        if (selectedItems == null || selectedItems.length == 0) {
	            response.sendRedirect(request.getContextPath() + "/cart");
	            return;
	        }
	        CheckoutService service = new CheckoutService();
	        List<CartModel> items =service.getCheckoutItems(user.getuserId(), selectedItems);
	        double subtotal = service.calculateSubtotal(items);
	        double total = service.calculateTotal(subtotal);
	        request.setAttribute("items", items);
	        request.setAttribute("subtotal", subtotal);
	        request.setAttribute("delivery", 100);
	        request.setAttribute("total", total);
	        request.getRequestDispatcher("/WEB-INF/pages/checkout.jsp")
	                .forward(request, response);

	    } catch (Exception e) {
	        throw new ServletException("Checkout error", e);
	    }
	}
}