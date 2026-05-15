package com.AafnoSpace.service;
import java.util.ArrayList;
import java.util.List;

import com.AafnoSpace.model.CartModel;

public class CheckoutService {

    private CartService cartService = new CartService();

    public List<CartModel> getCheckoutItems(int userId, String[] selectedItems) throws Exception {

        List<CartModel> allItems = cartService.getCartItems(userId);

        List<Integer> selectedIds = new ArrayList<>();

        for (String id : selectedItems) {
            selectedIds.add(Integer.parseInt(id));
        }

        List<CartModel> selected = new ArrayList<>();

        for (CartModel item : allItems) {
            if (selectedIds.contains(item.getProductId())) {
                selected.add(item);
            }
        }

        return selected;
    }

    public double calculateSubtotal(List<CartModel> items) {
        double subtotal = 0;

        for (CartModel item : items) {
            subtotal += item.getPrice() * item.getQuantity();
        }

        return subtotal;
    }

    public double calculateTotal(double subtotal) {
        return subtotal + 100;
    }
}