package com.AafnoSpace.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.sql.Date;
import com.AafnoSpace.model.OrderModel;
import com.AafnoSpace.utils.DBconfig;

public class OrderDAO {

    public int insertOrder(int userId, String orderDate, int paymentId) throws Exception {

        LocalDate localDate = LocalDate.parse(orderDate);
        Date sqlDate = Date.valueOf(localDate);

        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO Orders (UserID, OrderDate, PaymentID) VALUES (?, ?, ?)";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, userId);
        pst.setDate(2, sqlDate);
        pst.setInt(3, paymentId);

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
        String sql = "SELECT COUNT(*) AS total FROM Orders";
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
        String sql = "SELECT COUNT(*) AS total FROM Users";
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
        String sql = "SELECT SUM(LineTotal) AS revenue FROM Order_Details";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql);
             ResultSet rs = pst.executeQuery()) {
            if (rs.next()) return rs.getDouble("revenue");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
} 
