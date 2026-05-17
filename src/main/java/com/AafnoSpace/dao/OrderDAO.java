package com.AafnoSpace.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.sql.Date;
import com.AafnoSpace.model.OrderModel;
import com.AafnoSpace.utils.DBconfig;
import java.util.List;
import java.util.ArrayList;

public class OrderDAO {

    public int insertOrder(int userId, String orderDate, int paymentId, double totalAmount) throws Exception {

        LocalDate localDate = LocalDate.parse(orderDate);
        Date sqlDate = Date.valueOf(localDate);
        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO Orders (UserID, OrderDate, PaymentID, TotalAmount) VALUES (?, ?, ?, ?)";

        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, userId);
        pst.setDate(2, sqlDate);
        pst.setInt(3, paymentId);
        pst.setDouble(4, totalAmount);
        
        pst.executeUpdate();
        
        String latestOrder= "SELECT MAX(OrderID) AS OrderID FROM Orders";
        PreparedStatement pst2 = con.prepareStatement(latestOrder);
        ResultSet rs = pst2.executeQuery();
        rs.next();
        int orderId = rs.getInt("OrderID");
        rs.close();
        pst.close();
        pst2.close();
        con.close();
        return orderId;
    }
    public int getTotalOrders() {
        String sql="SELECT COUNT(*) AS total FROM Orders";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql);
             ResultSet rs = pst.executeQuery()) {
            if (rs.next()) return rs.getInt("total");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    public int getTotalCustomers() {
        String sql="SELECT COUNT(*) AS total FROM Users WHERE role = 'Customer'";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql);
             ResultSet rs = pst.executeQuery()) {
            if (rs.next()) return rs.getInt("total");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    public double getTotalRevenue() {
        String sql="SELECT SUM(LineTotal) AS revenue FROM Order_Details";
        try (Connection conn= DBconfig.getConnection();
             PreparedStatement pst= conn.prepareStatement(sql);
             ResultSet rs= pst.executeQuery()) {
            if (rs.next()) return rs.getDouble("revenue");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getTotalCategories() {
    	String sql="SELECT COUNT(DISTINCT Category) AS TotalCategory FROM Product";
    	try(Connection conn=DBconfig.getConnection();
    			PreparedStatement pst=conn.prepareStatement(sql);
    			ResultSet rs=pst.executeQuery())
    	{
    		if(rs.next()) return rs.getInt("TotalCategory");
    	}
    	catch(SQLException e)
    	{
    		e.printStackTrace();
    	} 
    	return 0;
    }

    public int getLatestOrderId(int userId) {

        // SQL query to get latest OrderID of logged-in user
        String sql = "SELECT OrderID FROM Orders WHERE UserID = ? ORDER BY OrderID DESC LIMIT 1";

        try (
            Connection conn = DBconfig.getConnection();
            PreparedStatement pst = conn.prepareStatement(sql)
        ) {

            pst.setInt(1, userId);

            // Execute query
            ResultSet rs = pst.executeQuery();

            // Check if order exists
            if (rs.next()) {

                // Return latest OrderID
                return rs.getInt("OrderID");
            }

            // Close ResultSet
            rs.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Return -1 if no order found
        return -1;
    }
    
    public List<OrderModel> getOrdersByUser(int userId) {

        // Create list to store orders
        List<OrderModel> orders = new ArrayList<>();

        // SQL query
        String sql = "SELECT * FROM Orders WHERE UserID = ? ORDER BY OrderID DESC";

        try (
            Connection conn = DBconfig.getConnection();
            PreparedStatement pst = conn.prepareStatement(sql)
        ) {

            // Set user ID
            pst.setInt(1, userId);

            // Execute query
            ResultSet rs = pst.executeQuery();

            // Loop through all orders
            while (rs.next()) {

                OrderModel order = new OrderModel(
                    rs.getInt("OrderID"),
                    rs.getInt("UserID"),
                    rs.getDate("OrderDate"),
                    rs.getInt("PaymentID"),
                    rs.getDouble("TotalAmount")
                );

                // Add order to list
                orders.add(order);
            }

            rs.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }
} 