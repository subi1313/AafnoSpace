package com.AafnoSpace.controller;

import com.AafnoSpace.model.ProductModel;
import com.AafnoSpace.service.ProductService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(
        asyncSupported = true,
        urlPatterns = {"/product-detail", "/product-details"}
)
public class ProductDetailServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // Get product ID from URL
            String idParam = request.getParameter("id");

            if (idParam == null || idParam.isEmpty()) {
                response.sendRedirect("product-list");
                return;
            }

            int productId = Integer.parseInt(idParam);

            // Fetch product from service
            ProductModel product = productService.getProductById(productId);

            // If product not found
            if (product == null) {
                response.sendRedirect("product-list");
                return;
            }

            // Send product to JSP
            request.setAttribute("product", product);

            // Forward to JSP
            request.getRequestDispatcher("/WEB-INF/pages/productDetail.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("product-list");
        }
    }
}