package com.AafnoSpace.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.AafnoSpace.utils.DBconfig;

public class CartDAO {

    public boolean addCart(String UserID, String ProductID)
    throws Exception {

        // Establish connection

        Connection con =
        DBconfig.getConnection();

        int CartID = 0;

        // check if user has already cart

        String checkCart =
        "SELECT * FROM Cart WHERE UserID=?";

        PreparedStatement cartPst =
        con.prepareStatement(checkCart);

        cartPst.setString(1, UserID);

        ResultSet rs =
        cartPst.executeQuery();

        // if user has cart

        if(rs.next()) {

            CartID =
            rs.getInt("CartID");
        }

        // CREATE NEW CART

        else {

            String createCart =
            "INSERT INTO Cart(UserID) VALUES(?)";

            PreparedStatement createPst =
            con.prepareStatement(
            createCart,
            Statement.RETURN_GENERATED_KEYS
            );

            createPst.setString(1, UserID);

            createPst.executeUpdate();

            ResultSet keys =
            createPst.getGeneratedKeys();

            if(keys.next()) {

                CartID =
                keys.getInt(1);
            }
        }

        // CHECK PRODUCT ALREADY EXISTS

        String checkProduct =
        "SELECT * FROM User_Product_Cart " +
        "WHERE CartID=? AND ProductID=?";

        PreparedStatement checkPst =
        con.prepareStatement(checkProduct);

        checkPst.setInt(1, CartID);

        checkPst.setString(2, ProductID);

        ResultSet checkRs =
        checkPst.executeQuery();

        // PRODUCT EXISTS → INCREASE QUANTITY

        if(checkRs.next()) {

            String updateQty =
            "UPDATE User_Product_Cart " +
            "SET Quantity = Quantity + 1 " +
            "WHERE CartID=? AND ProductID=?";

            PreparedStatement updatePst =
            con.prepareStatement(updateQty);

            updatePst.setInt(1, CartID);

            updatePst.setString(2, ProductID);

            int rows =
            updatePst.executeUpdate();

            updatePst.close();
            con.close();

            return rows > 0;
        }

        // INSERT NEW PRODUCT

        else {

            String insertProduct =
            "INSERT INTO User_Product_Cart(ProductID, CartID, Quantity) " +
            "VALUES(?,?,1)";

            PreparedStatement pst =
            con.prepareStatement(insertProduct);

            pst.setString(1, ProductID);

            pst.setInt(2, CartID);

            int rows =
            pst.executeUpdate();

            pst.close();
            con.close();

            return rows > 0;
        }
    }
}