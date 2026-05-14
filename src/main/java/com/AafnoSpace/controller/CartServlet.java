package com.AafnoSpace.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.AafnoSpace.model.UserModel;
import com.AafnoSpace.service.CartService;
import com.AafnoSpace.utils.SessionUtil;
import com.AafnoSpace.model.*;
/**
 * Servlet implementation class CartServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/cart" })
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //Read Operation (View Cart)
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.getRequestDispatcher("/WEB-INF/pages/cart.jsp")
		.forward(request, response);
	}
	
	//Add to Cart
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	
//	UserModel user=(UserModel) request.getAttribute("user");
	
	//user not logged in
//	if(user==null) {
//		response.sendRedirect(
//		request.getContextPath() + "/login");
//		return;
//	}	
//	
//	String UserID = String.valueOf(user.getuserId());
	
	
	String UserID = request.getParameter("UserID"); //getting user id from front end 
	String ProductID = request.getParameter("ProductID");
	
	CartService service = new CartService();

    try {

        boolean result =
        service.addCart(UserID, ProductID);

        if(result) {

            response.sendRedirect(
            request.getContextPath() + "/cart");
        }

        else {

            response.getWriter().println(
            "Failed To Add Cart"
            );
        }

    }

    catch(Exception e) {

        e.printStackTrace();
    }
}
}
