package com.AafnoSpace.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.AafnoSpace.model.UserModel;
import com.AafnoSpace.utils.DBconfig;
import com.AafnoSpace.model.UserModel;

public class UserDAO {
	public boolean registerUser(String firstName, String lastName, String username, String email, String password, String address, String phoneNo) throws Exception {

	Connection con = DBconfig.getConnection();

	String sql = "INSERT INTO Users (firstName, lastName, username, email, password, address, phoneNo, role, status) "
  + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

	PreparedStatement pst = con.prepareStatement(sql);

	pst.setString(1, firstName);
	pst.setString(2, lastName);
	pst.setString(3, username);
	pst.setString(4, email);
	pst.setString(5, password);
	pst.setString(6, address);
	pst.setString(7, phoneNo);
	pst.setString(8, "Customer");
	pst.setString(9, "Inactive");

	int rows=pst.executeUpdate();

	pst.close();
	con.close();
	return rows > 0;
}
	
	 public static UserModel getUserByUsername(String username) throws Exception {
	        UserModel user = null;
	        Connection con = DBconfig.getConnection();
	        
	        String sql = "SELECT * FROM Users WHERE username = ?";
	        PreparedStatement pst = con.prepareStatement(sql);
	        pst.setString(1, username);
	        
	        ResultSet rs = pst.executeQuery();

	        if (rs.next()) {
	            user = new UserModel();
	            user.setuserId(rs.getInt("UserID")); 
	            user.setFirstName(rs.getString("firstName"));
	            user.setLastName(rs.getString("lastName"));
	            user.setUserName(rs.getString("username"));
	            user.setEmail(rs.getString("email"));
	            user.setPassword(rs.getString("password")); 
	            user.setaddress(rs.getString("address"));
	            user.setNumber(rs.getString("phoneNo"));
	            user.setRole(rs.getString("role"));
	            user.setStatus(rs.getString("status"));
	        }
	        rs.close();
	        pst.close();
	        con.close();
	        return user;
	        // returns user OBJECT to user model
	 }
	   public List<UserModel> getAllUsers() throws Exception {
	        List<UserModel> users = new ArrayList<>();
	        Connection con = DBconfig.getConnection();
	        
	        String sql = "SELECT * FROM users WHERE role = ?;";
	        PreparedStatement pst = con.prepareStatement(sql);
	        pst.setString(1, "Customer");
	        ResultSet rs = pst.executeQuery();

	        while (rs.next()) {
	            UserModel u = new UserModel();
	            u.setuserId(rs.getInt("UserID")); 
	            u.setFirstName(rs.getString("firstName"));
	            u.setLastName(rs.getString("lastName"));
	            u.setUserName(rs.getString("username"));
	            u.setEmail(rs.getString("email"));
	            u.setPassword(rs.getString("password")); 
	            u.setaddress(rs.getString("address"));
	            u.setNumber(rs.getString("phoneNo"));
	            u.setStatus(rs.getString("status"));
	            users.add(u);
	        }
	        
	        rs.close();
	        pst.close();
	        con.close();
	        return users;
	    }
}
