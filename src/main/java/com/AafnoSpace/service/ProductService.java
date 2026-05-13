package com.AafnoSpace.service;

import com.AafnoSpace.dao.ProductDAO;

public class ProductService {
	ProductDAO dao = new ProductDAO();

    public int addProduct(int productId, String productName, String description, String category, double price, int quantity) throws Exception {
    	return dao.insertProduct(productId, productName, description, category, price, quantity);
    }
    
    public void updateProduct(int productId, String productName, String description, String category, double price, int quantity) throws Exception {
    	dao.updateProduct(productId, productName, description, category, price, quantity);
	}
}
