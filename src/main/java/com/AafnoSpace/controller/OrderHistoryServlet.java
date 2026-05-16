package com.AafnoSpace.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.AafnoSpace.dao.OrderDAO;
import com.AafnoSpace.model.OrderModel;
import com.AafnoSpace.model.UserModel;
import com.AafnoSpace.utils.SessionUtil;

/**
 * Servlet implementation class OrderHistory
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/order-history" })
public class OrderHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private OrderDAO orderDAO = new OrderDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderHistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		  // Check login
        UserModel user = (UserModel) SessionUtil.getAttribute(request, "user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Get logged-in user ID
        int userId = user.getuserId();

        // Fetch orders
        List<OrderModel> orders = orderDAO.getOrdersByUser(userId);

        // Send to JSP
        request.setAttribute("orders", orders);

		request.getRequestDispatcher("/WEB-INF/pages/orderHistory.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
