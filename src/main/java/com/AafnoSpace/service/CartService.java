package com.AafnoSpace.service;

import java.util.List;
import com.AafnoSpace.dao.CartDAO;
import com.AafnoSpace.model.CartModel;

public class CartService {

    private final CartDAO dao = new CartDAO();

    // ADD TO CART (NORMAL ONLY)
    public boolean addCart(String userId, String productId) throws Exception {
        return dao.addCart(userId, productId);
    }

    // CHECK IF PRODUCT EXISTS
    public boolean isProductInCart(int userId, int productId) throws Exception {
        return dao.isProductInCart(userId, productId);
    }

    // GET CART ITEMS
    public List<CartModel> getCartItems(int userId) throws Exception {
        return dao.getCartItems(userId);
    }

    // INCREASE QUANTITY
    public boolean increaseQuantity(int cartItemId) throws Exception {
        return dao.increaseQuantity(cartItemId);
    }

    // DECREASE QUANTITY
    public boolean decreaseQuantity(int cartItemId) throws Exception {
        return dao.decreaseQuantity(cartItemId);
    }

    // DELETE ITEM
    public boolean deleteCartItem(int cartItemId) throws Exception {
        return dao.deleteCartItem(cartItemId);
    }
}