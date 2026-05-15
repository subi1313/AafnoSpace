package com.AafnoSpace.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.AafnoSpace.model.CartModel;
import com.AafnoSpace.utils.DBconfig;

public class CartDAO {

    // ADD TO CART
    public boolean addCart(String userId, String productId) throws Exception {
        try (Connection con = DBconfig.getConnection()) {

            // 1. Get or create cart for this user
            int cartId = 0;

            String checkCart = "SELECT CartID FROM cart WHERE UserID = ?";
            try (PreparedStatement pst = con.prepareStatement(checkCart)) {
                pst.setString(1, userId);
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    cartId = rs.getInt("CartID");
                }
            }

            if (cartId == 0) {
                String createCart = "INSERT INTO cart (UserID) VALUES (?)";
                try (PreparedStatement pst = con.prepareStatement(createCart, Statement.RETURN_GENERATED_KEYS)) {
                    pst.setString(1, userId);
                    pst.executeUpdate();
                    ResultSet keys = pst.getGeneratedKeys();
                    if (keys.next()) {
                        cartId = keys.getInt(1);
                    }
                }
            }

            // 2. Check if product already in cart → increase qty, else insert
            String checkProduct = "SELECT CartItemID FROM user_product_cart WHERE CartID = ? AND ProductID = ?";
            try (PreparedStatement pst = con.prepareStatement(checkProduct)) {
                pst.setInt(1, cartId);
                pst.setString(2, productId);
                ResultSet rs = pst.executeQuery();

                if (rs.next()) {
                    // Already exists → increase quantity
                    String updateQty = "UPDATE user_product_cart SET Quantity = Quantity + 1 WHERE CartID = ? AND ProductID = ?";
                    try (PreparedStatement updatePst = con.prepareStatement(updateQty)) {
                        updatePst.setInt(1, cartId);
                        updatePst.setString(2, productId);
                        return updatePst.executeUpdate() > 0;
                    }
                } else {
                    // New product → insert with quantity 1
                    String insert = "INSERT INTO user_product_cart (ProductID, CartID, Quantity) VALUES (?, ?, 1)";
                    try (PreparedStatement insertPst = con.prepareStatement(insert)) {
                        insertPst.setString(1, productId);
                        insertPst.setInt(2, cartId);
                        return insertPst.executeUpdate() > 0;
                    }
                }
            }
        }
    }


    // GET CART ITEMS BY USER ID

    public List<CartModel> getCartItems(int userId) throws Exception {
        List<CartModel> list = new ArrayList<>();

        String sql =
            "SELECT upc.CartItemID, "
            + "p.ProductID, "
            + "p.ProductName, "
            + "p.Price, "
            + "p.ImageName, "
            + "upc.Quantity " +
            "FROM user_product_cart upc " +
            "JOIN product p ON upc.ProductID = p.ProductID " +
            "JOIN cart c ON c.CartID = upc.CartID " +
            "WHERE c.UserID = ?";

        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setInt(1, userId);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                CartModel item = new CartModel();
                item.setCartItemId(rs.getInt("CartItemID"));
                item.setProductId(rs.getInt("ProductID"));
                item.setProductName(rs.getString("ProductName"));
                item.setPrice(rs.getDouble("Price"));
                item.setQuantity(rs.getInt("Quantity"));
                item.setImageName(rs.getString("ImageName"));
                
                list.add(item);
            }
        }

        return list;
    }


    // INCREASE QUANTITY
    public boolean increaseQuantity(int cartItemId) throws Exception {
        String sql = "UPDATE user_product_cart SET Quantity = Quantity + 1 WHERE CartItemID = ?";
        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setInt(1, cartItemId);
            return pst.executeUpdate() > 0;
        }
    }


    // DECREASE QUANTITY (auto-delete if reaches 0)

    public boolean decreaseQuantity(int cartItemId) throws Exception {
        try (Connection con = DBconfig.getConnection()) {

            // Check current quantity first
            String checkSql = "SELECT Quantity FROM user_product_cart WHERE CartItemID = ?";
            try (PreparedStatement checkPst = con.prepareStatement(checkSql)) {
                checkPst.setInt(1, cartItemId);
                ResultSet rs = checkPst.executeQuery();

                if (rs.next() && rs.getInt("Quantity") <= 1) {
                    // Quantity is 1 → delete the item
                    return deleteCartItem(cartItemId);
                }
            }

            // Otherwise just decrease
            String sql = "UPDATE user_product_cart SET Quantity = Quantity - 1 WHERE CartItemID = ?";
            try (PreparedStatement pst = con.prepareStatement(sql)) {
                pst.setInt(1, cartItemId);
                return pst.executeUpdate() > 0;
            }
        }
    }


    // DELETE CART ITEM
    public boolean deleteCartItem(int cartItemId) throws Exception {
        String sql = "DELETE FROM user_product_cart WHERE CartItemID = ?";
        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setInt(1, cartItemId);
            return pst.executeUpdate() > 0;
        }
    }
}