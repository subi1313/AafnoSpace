package com.AafnoSpace.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.AafnoSpace.model.ProductModel;
import com.AafnoSpace.utils.DBconfig;

public class ProductDAO {
	public int insertProduct(String productName, String description, String category, double price, int quantity, String imageName) throws Exception {

		Connection con = DBconfig.getConnection();

		String sql = "INSERT INTO product(ProductName, Description, Category, Price, Quantity, ImageName) VALUES (?, ?, ?, ?, ?, ?)";
		
		PreparedStatement pst = con.prepareStatement(sql);
		
		pst.setString(1, productName);
		pst.setString(2, description);
		pst.setString(3, category);
		pst.setDouble(4, price);
		pst.setInt(5, quantity);
		pst.setString(6, imageName);
		
		int rowsAffected = pst.executeUpdate();
		
		pst.close();
		con.close();
		
		return rowsAffected;
	}
	
	public List<ProductModel> getAllProducts() throws Exception {

        List<ProductModel> products = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        String sql = "SELECT * FROM product";

        PreparedStatement pst = con.prepareStatement(sql);

        ResultSet rs = pst.executeQuery();

        while (rs.next()) {

            ProductModel p = new ProductModel();

            p.setProductId(rs.getInt("ProductID"));
            p.setProductName(rs.getString("ProductName"));
            p.setDescription(rs.getString("Description"));
            p.setCategory(rs.getString("Category"));
            p.setPrice(rs.getDouble("Price"));
            p.setQuantity(rs.getInt("Quantity"));
            p.setImageName(rs.getString("ImageName"));

            products.add(p);
        }

        rs.close();
        pst.close();
        con.close();

        return products;
    }
	
	public ProductModel getProductById(int id) throws Exception {

	    Connection con = DBconfig.getConnection();

	    String sql = "SELECT * FROM product WHERE ProductID=?";

	    PreparedStatement pst = con.prepareStatement(sql);
	    pst.setInt(1, id);

	    ResultSet rs = pst.executeQuery();

	    ProductModel p = null;

	    if (rs.next()) {
	        p = new ProductModel();
	        p.setProductId(rs.getInt("ProductID"));
	        p.setProductName(rs.getString("ProductName"));
	        p.setDescription(rs.getString("Description"));
	        p.setCategory(rs.getString("Category"));
	        p.setPrice(rs.getDouble("Price"));
	        p.setQuantity(rs.getInt("Quantity"));
	        p.setImageName(rs.getString("ImageName"));
	    }

	    rs.close();
	    pst.close();
	    con.close();

	    return p;
	}
	
	public int updateProduct(int productId, String productName,
            String description, String category,
            double price, int quantity, String imageName) throws Exception {

		Connection con = DBconfig.getConnection();
		
		String sql = "UPDATE product SET ProductName=?, Description=?, Category=?, Price=?, Quantity=?, ImageName=? WHERE ProductID=?";
		
		PreparedStatement pst = con.prepareStatement(sql);
		
		pst.setString(1, productName);
		pst.setString(2, description);
		pst.setString(3, category);
		pst.setDouble(4, price);
		pst.setInt(5, quantity);
		pst.setString(6, imageName);
        pst.setInt(7, productId);
		
		int rowsAffected = pst.executeUpdate();
		
		pst.close();
		con.close();
		
		return rowsAffected;
	}
}
