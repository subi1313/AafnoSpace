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

    // ADD TO CART (WITH STOCK CHECK)
    public boolean addCart(String userId, String productId) throws Exception {

        try (Connection con = DBconfig.getConnection()) {

            int cartId = 0;

            //Get existing cart or create new
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

                try (PreparedStatement pst =
                             con.prepareStatement(createCart, Statement.RETURN_GENERATED_KEYS)) {

                    pst.setString(1, userId);
                    pst.executeUpdate();

                    ResultSet keys = pst.getGeneratedKeys();
                    if (keys.next()) {
                        cartId = keys.getInt(1);
                    }
                }
            }

            // STOCK CHECK (IMPORTANT)
            String stockSql =
                "SELECT p.Quantity AS StockQty, " +
                "COALESCE(upc.Quantity, 0) AS CartQty " +
                "FROM product p " +
                "LEFT JOIN user_product_cart upc " +
                "ON p.ProductID = upc.ProductID AND upc.CartID = ? " +
                "WHERE p.ProductID = ?";

            try (PreparedStatement pst = con.prepareStatement(stockSql)) {

                pst.setInt(1, cartId);
                pst.setString(2, productId);

                ResultSet rs = pst.executeQuery();

                if (rs.next()) {

                    int stockQty = rs.getInt("StockQty");
                    int cartQty = rs.getInt("CartQty");

                    if (cartQty >= stockQty) {
                        return false; // stop adding
                    }
                }
            }

            // CHECK IF PRODUCT EXISTS IN CART
            String checkProduct =
                "SELECT CartItemID FROM user_product_cart WHERE CartID = ? AND ProductID = ?";

            try (PreparedStatement pst = con.prepareStatement(checkProduct)) {

                pst.setInt(1, cartId);
                pst.setString(2, productId);

                ResultSet rs = pst.executeQuery();

                if (rs.next()) {

                    // increase quantity
                    String updateQty =
                        "UPDATE user_product_cart " +
                        "SET Quantity = Quantity + 1 " +
                        "WHERE CartID = ? AND ProductID = ?";

                    try (PreparedStatement updatePst = con.prepareStatement(updateQty)) {

                        updatePst.setInt(1, cartId);
                        updatePst.setString(2, productId);

                        return updatePst.executeUpdate() > 0;
                    }

                } else {

                    // insert new product
                    String insert =
                        "INSERT INTO user_product_cart (ProductID, CartID, Quantity) " +
                        "VALUES (?, ?, 1)";

                    try (PreparedStatement insertPst = con.prepareStatement(insert)) {

                        insertPst.setString(1, productId);
                        insertPst.setInt(2, cartId);

                        return insertPst.executeUpdate() > 0;
                    }
                }
            }
        }
    }
    
    public boolean isProductInCart(int userId, int productId) throws Exception {

        String sql =
            "SELECT 1 FROM user_product_cart upc " +
            "JOIN cart c ON upc.CartID = c.CartID " +
            "WHERE c.UserID = ? AND upc.ProductID = ?";

        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setInt(1, userId);
            pst.setInt(2, productId);

            ResultSet rs = pst.executeQuery();

            return rs.next();
        }
    }
    
    // GET CART ITEMS
    public List<CartModel> getCartItems(int userId) throws Exception {

        List<CartModel> list = new ArrayList<>();

        String sql =
            "SELECT upc.CartItemID, " +
            "p.ProductID, " +
            "p.ProductName, " +
            "p.Price, " +
            "p.ImageName, " +
            "p.Quantity AS StockQty, " +
            "upc.Quantity " +
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

                // IMPORTANT for UI stock control
                item.setStockQty(rs.getInt("StockQty"));

                list.add(item);
            }
        }

        return list;
    }

    // INCREASE QUANTITY (WITH STOCK CHECK)
    public boolean increaseQuantity(int cartItemId) throws Exception {

        String checkSql =
            "SELECT upc.Quantity AS CartQty, p.Quantity AS StockQty " +
            "FROM user_product_cart upc " +
            "JOIN product p ON upc.ProductID = p.ProductID " +
            "WHERE upc.CartItemID = ?";

        try (Connection con = DBconfig.getConnection();
             PreparedStatement checkPst = con.prepareStatement(checkSql)) {

            checkPst.setInt(1, cartItemId);

            ResultSet rs = checkPst.executeQuery();

            if (rs.next()) {

                int cartQty = rs.getInt("CartQty");
                int stockQty = rs.getInt("StockQty");

                if (cartQty >= stockQty) {
                    return false;
                }
            }

            String updateSql =
                "UPDATE user_product_cart " +
                "SET Quantity = Quantity + 1 " +
                "WHERE CartItemID = ?";

            try (PreparedStatement pst = con.prepareStatement(updateSql)) {

                pst.setInt(1, cartItemId);

                return pst.executeUpdate() > 0;
            }
        }
    }

    // DECREASE QUANTITY
    public boolean decreaseQuantity(int cartItemId) throws Exception {

        try (Connection con = DBconfig.getConnection()) {

            String checkSql =
                "SELECT Quantity FROM user_product_cart WHERE CartItemID = ?";

            try (PreparedStatement checkPst = con.prepareStatement(checkSql)) {

                checkPst.setInt(1, cartItemId);
                ResultSet rs = checkPst.executeQuery();

                if (rs.next() && rs.getInt("Quantity") <= 1) {
                    return deleteCartItem(cartItemId);
                }
            }

            String sql =
                "UPDATE user_product_cart " +
                "SET Quantity = Quantity - 1 " +
                "WHERE CartItemID = ?";

            try (PreparedStatement pst = con.prepareStatement(sql)) {

                pst.setInt(1, cartItemId);

                return pst.executeUpdate() > 0;
            }
        }
    }

    // DELETE ITEM
    public boolean deleteCartItem(int cartItemId) throws Exception {

        String sql =
            "DELETE FROM user_product_cart WHERE CartItemID = ?";

        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setInt(1, cartItemId);

            return pst.executeUpdate() > 0;
        }
    }
}