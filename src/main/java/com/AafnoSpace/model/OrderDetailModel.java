package com.AafnoSpace.model;
public class OrderDetailModel {

    private int productId;
    private int orderId;
    private int orderQuantity;
    private double lineTotal;
    
    public OrderDetailModel(int productId, int orderId, int orderQuantity, double lineTotal) {
        this.productId = productId;
        this.orderId = orderId;
        this.orderQuantity = orderQuantity;
        this.lineTotal = lineTotal;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getOrderQuantity() {
        return orderQuantity;
    }

    public void setOrderQuantity(int orderQuantity) {
        this.orderQuantity = orderQuantity;
    }

    public double getLineTotal() {
        return lineTotal;
    }

    public void setLineTotal(double lineTotal) {
        this.lineTotal = lineTotal;
    }
}