package com.AafnoSpace.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
	
	public int updateProduct(int productId, String productName, String description, String category, double price, int quantity) throws Exception {

		Connection con = DBconfig.getConnection();
		
		String sql = "UPDATE products SET ProductName=?, Description=?, Category=?, Price=?, Quantity=? WHERE ProductID=?";
		
		PreparedStatement pst = con.prepareStatement(sql);
		
		pst.setString(1, productName);
		pst.setString(2, description);
		pst.setString(3, category);
		pst.setDouble(4, price);
		pst.setInt(5, productId);
		pst.setInt(6, productId);
		
		int rowsAffected = pst.executeUpdate();
		
		pst.close();
		con.close();
		
		return rowsAffected;
}
}
