package com.AafnoSpace.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.AafnoSpace.service.ProductService;
import com.AafnoSpace.utils.FileUploadUtil;

/**
 * Servlet implementation class AdminAddProductServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/add-product" })

@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,
	    maxFileSize = 1024 * 1024 * 10,
	    maxRequestSize = 1024 * 1024 * 50
	)
public class AdminAddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String UPLOAD_DIR = System.getProperty("user.home") + File.separator + "AafnoSpace" + File.separator + "products";
     
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
			String productName = request.getParameter("productName");
			String description = request.getParameter("description");
			String category = request.getParameter("category");
			double price = Double.parseDouble(request.getParameter("price"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));

			//getting image file
			Part filePart = request.getPart("productImage");
	
			//validating image
			if (filePart == null || filePart.getSize() == 0) {
				response.sendRedirect("add-product?error=ImageRequired");
				return;
			}
	
			//filename
			String originalFileName = filePart.getSubmittedFileName();
			String extension = FileUploadUtil.getFileExtension(originalFileName);
	
			//creating unique image name
			String imageName = "product_" + System.currentTimeMillis() + extension;
	
			//checking folder existence
			File uploadPath = new File(UPLOAD_DIR);
			if (!uploadPath.exists()) {
				uploadPath.mkdirs();
			}
	
			//saving image
			FileUploadUtil.saveFile(filePart, UPLOAD_DIR, imageName);
			
			//calling service to add product
			ProductService service = new ProductService();
			int result = service.addProduct(productName, description, category, price, quantity, imageName);

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
