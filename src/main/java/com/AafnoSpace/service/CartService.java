package com.AafnoSpace.service;

import java.util.List;
import com.AafnoSpace.dao.CartDAO;
import com.AafnoSpace.model.CartModel;

public class CartService {

    private final CartDAO dao = new CartDAO();

    public boolean addCart(String userId, String productId) throws Exception {
        return dao.addCart(userId, productId);
    }

    public List<CartModel> getCartItems(int userId) throws Exception {
        return dao.getCartItems(userId);
    }

    public boolean increaseQuantity(int cartItemId) throws Exception {
        return dao.increaseQuantity(cartItemId);
    }

    public boolean decreaseQuantity(int cartItemId) throws Exception {
        return dao.decreaseQuantity(cartItemId);
    }

    public boolean deleteCartItem(int cartItemId) throws Exception {
        return dao.deleteCartItem(cartItemId);
    }
}