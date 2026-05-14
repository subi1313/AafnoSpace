package com.AafnoSpace.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.sql.Date;
import com.AafnoSpace.model.PaymentModel;
import com.AafnoSpace.utils.DBconfig;

import com.AafnoSpace.utils.DBconfig;

public class PaymentDAO {

    public int insertPayment(double paymentAmount, String paymentDate, String paymentMethod) throws Exception {

        LocalDate localDate = LocalDate.parse(paymentDate);
        Date sqlDate = Date.valueOf(localDate);

        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO Payment (PaymentAmount, PaymentDate, PaymentMethod) VALUES (?, ?, ?)";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setDouble(1, paymentAmount);
        pst.setDate(2, sqlDate);
        pst.setString(3, paymentMethod);

        pst.executeUpdate();

        String latestPayment= "SELECT MAX(PaymentID) AS PaymentID FROM Payment";

        PreparedStatement pst2 = con.prepareStatement(latestPayment);

        ResultSet rs = pst2.executeQuery();

        rs.next();

        int paymentId = rs.getInt("PaymentID");

        rs.close();
        pst.close();
        pst2.close();
        con.close();

        return paymentId;
    }
} 
