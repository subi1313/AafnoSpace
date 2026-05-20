package com.AafnoSpace.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;

/**
 * Servlet implementation class ProductImageServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/product-image" })
public class ProductImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// Directory where product images are stored
	private static final String UPLOAD_DIR = System.getProperty("user.home") + "/AafnoSpace/products";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get image filename
		String name = request.getParameter("name");
        if (name == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        
        // Locate file in upload directory
        File file = new File(UPLOAD_DIR, name);
        if (!file.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        response.setContentType(getServletContext().getMimeType(name));
        java.nio.file.Files.copy(file.toPath(), response.getOutputStream());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
