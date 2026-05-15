package com.AafnoSpace.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.AafnoSpace.service.ProductService;

/**
 * Servlet implementation class DeleteProductServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/delete-product" })
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect(request.getContextPath() + "/product-list");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            String idStr = request.getParameter("id");
            if (idStr != null) {
                int productId = Integer.parseInt(idStr);

                ProductService service = new ProductService();
                service.deleteProduct(productId);
            }

            response.sendRedirect(request.getContextPath() + "/product-list");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
	}

}
