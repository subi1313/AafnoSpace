package com.AafnoSpace.model;

import java.util.Date;

public class OrderModel {
    private int orderId;
    private int userId;
    private Date orderDate;
    private int paymentId;
    private double totalAmount;
    //adding for username and payment method in order management
    private String username;
    private String paymentMethod;
    
	    public OrderModel(int orderId, int userId, Date orderDate, int paymentId, double totalAmount) {
	        this.orderId = orderId;
	        this.userId = userId;
	        this.orderDate = orderDate;
	        this.paymentId = paymentId;
	        this.totalAmount = totalAmount;
	    }

	    public int getOrderId() {return orderId;}

	    public void setOrderId(int orderId) {this.orderId = orderId;}

	    public int getUserId() {return userId;}

	    public void setUserId(int userId) {this.userId = userId;}

	    public Date getOrderDate() {return orderDate;}

	    public void setOrderDate(Date orderDate) {this.orderDate = orderDate;}

	    public int getPaymentId() {return paymentId;}

	    public void setPaymentId(int paymentId) {this.paymentId = paymentId;}
	    
	    public double getTotalAmount() {
	        return totalAmount;
	    }

	    public void setTotalAmount(double totalAmount) {
	        this.totalAmount = totalAmount;
	    }
	    public String getUsername() { return username; }
	    
	    public void setUsername(String username) { this.username = username; }
	    
	    public String getPaymentMethod() { return paymentMethod; }
	    
	    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }
}

