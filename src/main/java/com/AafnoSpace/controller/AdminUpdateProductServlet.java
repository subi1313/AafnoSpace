package com.AafnoSpace.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.AafnoSpace.model.ProductModel;
import com.AafnoSpace.service.ProductService;

/**
 * Servlet implementation class AdminUpdateProductServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/update-product" })
public class AdminUpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
	        int id = Integer.parseInt(request.getParameter("id"));

	        ProductService service = new ProductService();
	        ProductModel product = service.getProductById(id);

	        request.setAttribute("product", product);

	        request.getRequestDispatcher("/WEB-INF/pages/adminUpdateProduct.jsp")
	               .forward(request, response);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
	        int id = Integer.parseInt(request.getParameter("productId"));
	        String name = request.getParameter("productName");
	        String desc = request.getParameter("description");
	        String category = request.getParameter("category");
	        double price = Double.parseDouble(request.getParameter("price"));
	        int quantity = Integer.parseInt(request.getParameter("quantity"));

	        ProductService service = new ProductService();

	        service.updateProduct(id, name, desc, category, price, quantity);

	        response.sendRedirect("product-list");

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

}
