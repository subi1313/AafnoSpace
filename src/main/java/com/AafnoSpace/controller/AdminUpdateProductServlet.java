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

import com.AafnoSpace.model.ProductModel;
import com.AafnoSpace.service.ProductService;
import com.AafnoSpace.utils.SessionUtil;

/**
 * Servlet implementation class AdminUpdateProductServlet
 */
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,
	    maxFileSize = 1024 * 1024 * 10,
	    maxRequestSize = 1024 * 1024 * 50 
	)
@WebServlet(asyncSupported = true, urlPatterns = { "/update-product" })
public class AdminUpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String UPLOAD_DIR = System.getProperty("user.home") + File.separator + "AafnoSpace" + File.separator + "products";
       
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
		request.setAttribute("activeMenu", "product");
		try {
			// Getting product ID
	        int id = Integer.parseInt(request.getParameter("id"));

	        // Fetch product from database
	        ProductService service = new ProductService();
	        ProductModel product = service.getProductById(id);

	        // Pass product data to JSP
	        request.setAttribute("product", product);

	        request.getRequestDispatcher("/WEB-INF/pages/adminUpdateProduct.jsp").forward(request, response);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// Retrieve form inputs
            int id = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            String category = request.getParameter("category");
            String priceStr = request.getParameter("price");
            String quantityStr = request.getParameter("quantity");
            
            // Load existing product
            ProductService service = new ProductService();
            ProductModel existingProduct = service.getProductById(id);
            
            // field validation
            if (productName == null || productName.trim().isEmpty()) {
                request.setAttribute("error", "Product name is required!");
            }
            else if (description == null || description.trim().isEmpty()) {
                request.setAttribute("error", "Description is required!");
            }
            else if (priceStr == null || priceStr.trim().isEmpty()) {
                request.setAttribute("error", "Price is required!");
            }
            else if (quantityStr == null || quantityStr.trim().isEmpty()) {
                request.setAttribute("error", "Quantity is required!");
            }

            // If validation failed, return to form
            if (request.getAttribute("error") != null) {
                request.setAttribute("product", existingProduct);
                request.getRequestDispatcher("/WEB-INF/pages/adminUpdateProduct.jsp")
                       .forward(request, response);
                return;
            }
			
			double price;
			int quantity;
			
			// Validating and parsing price
			try {
			    price = Double.parseDouble(priceStr);

			    if (price <= 0) {
			        request.setAttribute("error", "Price must be greater than 0!");
			        request.setAttribute("product", existingProduct);
			        request.getRequestDispatcher("/WEB-INF/pages/adminUpdateProduct.jsp")
			               .forward(request, response);
			        return;
			    }

			} catch (NumberFormatException e) {
			    request.setAttribute("error", "Price must be a valid number!");
			    request.setAttribute("product", existingProduct);
			    request.getRequestDispatcher("/WEB-INF/pages/adminUpdateProduct.jsp")
			           .forward(request, response);
			    return;
			}
			
			// Validating and parsing quantity
			try {
			    quantity = Integer.parseInt(quantityStr);

			    if (quantity < 0) {
			        request.setAttribute("error", "Quantity cannot be negative!");
			        request.setAttribute("product", existingProduct);
			        request.getRequestDispatcher("/WEB-INF/pages/adminUpdateProduct.jsp")
			               .forward(request, response);
			        return;
			    }

			} catch (NumberFormatException e) {
			    request.setAttribute("error", "Quantity must be a valid integer!");
			    request.setAttribute("product", existingProduct);
			    request.getRequestDispatcher("/WEB-INF/pages/adminUpdateProduct.jsp")
			           .forward(request, response);
			    return;
			}

			// Ensure product exists before updating
            if (existingProduct == null) {
                throw new ServletException("Product not found with ID: " + id);
            }

            // Handle optional image upload
            Part filePart = request.getPart("productImage");
            
            // Keep old image by default
            String imageName = existingProduct.getImageName();

            // If new image is uploaded, replace old one
            if (filePart != null && filePart.getSize() > 0) {
                String originalFileName = filePart.getSubmittedFileName();
                String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
                imageName = "product_" + System.currentTimeMillis() + extension;

                File uploadPath = new File(UPLOAD_DIR);
                if (!uploadPath.exists()) {
                    uploadPath.mkdirs();
                }

                filePart.write(UPLOAD_DIR + File.separator + imageName);
            }
            
            // Update product in database
            service.updateProduct(id, productName, description, category, price, quantity, imageName);
            
            // Set success message in session
            SessionUtil.setAttribute(request, "success", "Product updated successfully!", 3600);

         // Redirect to product management page
            response.sendRedirect(request.getContextPath() + "/product-list");

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error updating product: " + e.getMessage());
        }
    }
}