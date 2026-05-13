package com.AafnoSpace.service;

import com.AafnoSpace.dao.ProductDAO;

public class ProductService {
	ProductDAO dao = new ProductDAO();

    public int addProduct(String productName, String description, String category, double price, int quantity, String imageName) throws Exception {
    	return dao.insertProduct(productName, description, category, price, quantity, imageName);
    }
    
    public void updateProduct(int productId, String productName, String description, String category, double price, int quantity) throws Exception {
    	dao.updateProduct(productId, productName, description, category, price, quantity);
	}
}
