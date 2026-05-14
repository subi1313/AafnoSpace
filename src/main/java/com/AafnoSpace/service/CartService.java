package com.AafnoSpace.service;

import com.AafnoSpace.dao.CartDAO;

public class CartService {
	CartDAO dao = new CartDAO();
	public boolean addCart(String UserID, String ProductID) throws Exception {
		 return dao.addCart(UserID, ProductID);
		
	}
}
