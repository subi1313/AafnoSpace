package com.AafnoSpace.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.AafnoSpace.service.ProductService;

/**
 * Servlet implementation class AdminAddProductServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/add-product" })
public class AdminAddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAddProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("activeMenu", "product");
		request.getRequestDispatcher("/WEB-INF/pages/adminAddProduct.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//getting data from the adminAddProduct page
			int productId = Integer.parseInt(request.getParameter("productId"));
			String productName = request.getParameter("productName");
			String description = request.getParameter("description");
			String category = request.getParameter("category");
			double price = Double.parseDouble(request.getParameter("price"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));

			//calling service to add product
			ProductService service = new ProductService();
			int result = service.addProduct(productId, productName, description, category, price, quantity);

			if (result > 0) {
				response.sendRedirect("add-product?success=true");
			} else {
				response.sendRedirect("add-product?error=true");
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
	}
	
}
