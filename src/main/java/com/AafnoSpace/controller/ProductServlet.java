package com.AafnoSpace.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.AafnoSpace.model.ProductModel;
import com.AafnoSpace.service.ProductService;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet(
		asyncSupported = true, 
		urlPatterns = { 
				"/product", 
				"/products"
		})
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		    ProductService service = new ProductService();
		    List<ProductModel> products;
		    

		    // getting search item
		    String searchItem = request.getParameter("searchbar");

		    // getting filter parameters
		    String[] categories = request.getParameterValues("category");
		    String[] prices = request.getParameterValues("price");

		    // converting arrays to lists
		    List<String> categoryList = (categories != null) ? List.of(categories) : new ArrayList<>();
		    List<String> priceList = (prices != null) ? List.of(prices) : new ArrayList<>();
		    
		    request.setAttribute("selectedCategories", categoryList);
		    request.setAttribute("selectedPrices", priceList);
		    request.setAttribute("searchbar", searchItem);

		    // deciding what to fetch
		    if ((searchItem != null && !searchItem.isEmpty()) 
		        && (!categoryList.isEmpty() || !priceList.isEmpty())) {
		        products = service.getFilteredProducts(searchItem, categoryList, priceList);
		    } else if (searchItem != null && !searchItem.isEmpty()) {
		        products = service.getFilteredProducts(searchItem, null, null);
		    } else if (!categoryList.isEmpty() || !priceList.isEmpty()) {
		        products = service.getFilteredProducts(null, categoryList, priceList);
		    } else {
		        products = service.getAllProducts();
		    }

		    request.setAttribute("products", products);

		} catch (Exception e) {
		    e.printStackTrace();
		}
		request.getRequestDispatcher("/WEB-INF/pages/product.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
