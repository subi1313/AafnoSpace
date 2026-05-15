package com.AafnoSpace.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.AafnoSpace.dao.OrderDAO;

/**
 * Servlet implementation class AdminDashboardServlet
 */
@WebServlet(
		asyncSupported = true, 
		urlPatterns = { 
				"/adminDashboard"
		})
public class AdminDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderDAO dao = new OrderDAO();
	    request.setAttribute("totalOrders",dao.getTotalOrders());
	    request.setAttribute("totalCustomers",dao.getTotalCustomers());
	    request.setAttribute("totalRevenue",dao.getTotalRevenue());

		// TODO Auto-generated method stub
		request.setAttribute("activeMenu", "dashboard");
		request.getRequestDispatcher("/WEB-INF/pages/adminDashboard.jsp")
        .forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
