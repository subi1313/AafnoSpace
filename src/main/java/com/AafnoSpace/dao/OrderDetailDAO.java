package com.AafnoSpace.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import com.AafnoSpace.model.OrderDetailModel;
import com.AafnoSpace.utils.DBconfig;

import com.AafnoSpace.utils.DBconfig;

public class OrderDetailDAO {

    public void insertOrderDetail(int productId, int orderId, int quantity, double lineTotal) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO Order_Details (ProductID, OrderID, OrderQuantity, LineTotal) VALUES (?, ?, ?, ?)";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setInt(1, productId);
        pst.setInt(2, orderId);
        pst.setInt(3, quantity);
        pst.setDouble(4, lineTotal);

        pst.executeUpdate();

        pst.close();
        con.close();
    }
}