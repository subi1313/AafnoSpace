package com.AafnoSpace.service;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.AafnoSpace.dao.OrderDAO;
import com.AafnoSpace.dao.OrderDetailDAO;
import com.AafnoSpace.dao.PaymentDAO;
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
            if (selectedIds.contains(item.getCartItemId())) {
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
    
    public int placeOrder(int userId, List<CartModel> items, String payment, double total) throws Exception {
    	 LocalDateTime now = LocalDateTime.now();
      	String orderDate = now.toLocalDate().toString();
          
    	PaymentDAO paymentDAO = new PaymentDAO();
    	int paymentId = paymentDAO.insertPayment(total, orderDate, payment);
     
        OrderDAO orderDAO = new OrderDAO();
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        
        // inserting into orders and getting back orderId
        int orderId = orderDAO.insertOrder(userId, orderDate, paymentId, total);
        
        // inserting each item into OrderDetails
        for (CartModel item : items) {
            double lineTotal = item.getPrice() * item.getQuantity();
            orderDetailDAO.insertOrderDetail(item.getProductId(), orderId, item.getQuantity(), lineTotal);
        }
        return orderId;
    }
}