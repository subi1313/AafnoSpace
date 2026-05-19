package com.AafnoSpace.service;

import java.util.List;

import com.AafnoSpace.dao.ProductDAO;
import com.AafnoSpace.model.ProductModel;

public class ProductService {
	ProductDAO dao = new ProductDAO();

    public int addProduct(String productName, String description, String category, double price, int quantity, String imageName) 
    		throws Exception {
    	return dao.insertProduct(productName, description, category, price, quantity, imageName);
    }
    
    public List <ProductModel> getAllProducts() throws Exception {
        return dao.getAllProducts();
    }
    
    public ProductModel getProductById(int id) throws Exception {
        return dao.getProductById(id);
    }
    
    public int updateProduct(int productId, String productName, String description, String category, double price, int quantity, 
    		String imageName) throws Exception {
    	return dao.updateProduct(productId, productName, description, category, price, quantity, imageName);
    }
    
    public List<ProductModel> getFilteredProducts(String search, List<String> categories, List<String> priceRanges) throws Exception {
        ProductDAO dao = new ProductDAO();
        return dao.getFilteredProducts(search, categories, priceRanges);
    }
    
    public int deleteProduct(int productId) throws Exception {
        return dao.deleteProduct(productId);
    }
    
    public int decreaseQuantity(int productId, int purchasedQty) throws Exception {
        return dao.decreaseQuantity(productId, purchasedQty);
    }
}
