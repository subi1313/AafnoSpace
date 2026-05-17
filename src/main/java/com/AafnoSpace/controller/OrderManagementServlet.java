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

/**
 * Servlet implementation class OrderManagementServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/orderManagement" })
public class OrderManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderManagementServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("activeMenu", "order");
        try {
            OrderDAO orderDAO = new OrderDAO();
            List<OrderModel> orders = orderDAO.getAllOrders();
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("/WEB-INF/pages/orderManagement.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error in database!", e);
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			response.sendRedirect(request.getContextPath() + "/orderManagement");
		    } catch (Exception e) {
		        throw new ServletException("Error updating status", e);
		    }
		}
	}

