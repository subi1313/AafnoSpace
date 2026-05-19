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
import com.AafnoSpace.utils.SessionUtil;

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
	
	// Directory where uploaded product images will be stored
	private static final String UPLOAD_DIR = System.getProperty("user.home") + File.separator + "AafnoSpace" + File.separator + "products";
     
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAddProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    /**
     * method to return user back to form with error message
     * and previously entered values
     */
    private void returnToForm(HttpServletRequest request, HttpServletResponse response, String message, String productName, String description,
            String category, String price, String quantity) throws ServletException, IOException {

        request.setAttribute("error", message);
        
        // preserve previously entered form values
        request.setAttribute("productName", productName);
        request.setAttribute("description", description);
        request.setAttribute("category", category);
        request.setAttribute("price", price);
        request.setAttribute("quantity", quantity);

        request.getRequestDispatcher("/WEB-INF/pages/adminAddProduct.jsp").forward(request, response);
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
			String priceStr = request.getParameter("price");
			String quantityStr = request.getParameter("quantity");
			
			// Validate product name
			if (productName == null || productName.trim().isEmpty()) {
				returnToForm(request, response, "Product name is required!", productName, description, category, priceStr, quantityStr);
				return;
			}
			
			// Validate description
			if (description == null || description.trim().isEmpty()) {
				returnToForm(request, response, "Description is required!", productName, description, category, priceStr, quantityStr);
				return;
			}

			// Validate category selection
			if (category == null || category.trim().isEmpty() || category.equals("Select product category")) {
			    returnToForm(request, response, "Category is required!", productName, description, category, priceStr, quantityStr);
				return;
			}

			// Validate price input
			if (priceStr == null || priceStr.trim().isEmpty()) {
				returnToForm(request, response, "Price is required!", productName, description, category, priceStr, quantityStr);
				return;
			}

			// Validate quantity input
			if (quantityStr == null || quantityStr.trim().isEmpty()) {
				returnToForm(request, response, "Quantity is required!", productName, description, category, priceStr, quantityStr);
				return;
			}
			
			double price;
			int quantity;
			
			// Convert price from string to double
			try {
			    price = Double.parseDouble(priceStr);
			} catch (NumberFormatException e) {
				returnToForm(request, response, "Price must be a valid number!", productName, description, category, priceStr, quantityStr);
				return;
			}
			
			// Convert quantity string to integer
			try {
			    quantity = Integer.parseInt(quantityStr);
			} catch (NumberFormatException e) {
				returnToForm(request, response, "Quantity must be a valid number!", productName, description, category, priceStr, quantityStr);
				return;
			}

			//price validation
			if (price <= 0) {
				returnToForm(request, response, "Price can not be negative or zero!", productName, description, category, priceStr, quantityStr);
				return;
			}

			//quantity validation
			if (quantity < 0) {
				returnToForm(request, response, "Quantity can not be negative!", productName, description, category, priceStr, quantityStr);
				return;
			}
			
			//getting image file
			Part filePart = request.getPart("productImage");
	
			//validating image
			if (filePart == null || filePart.getSize() == 0) {
				returnToForm(request, response, "Please upload a product image!", productName, description, category, priceStr, quantityStr);
				return;
			}
	
			//extracting original filename and extension
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
			
			//handle service response
			if (result > 0) {
				SessionUtil.setAttribute(request, "success", "Product added successfully!", 3600);
				response.sendRedirect(request.getContextPath() + "/product-list");
			} else {
				request.setAttribute("error", "Failed to add product!");
				request.getRequestDispatcher("/WEB-INF/pages/adminAddProduct.jsp").forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
	}
	
}
