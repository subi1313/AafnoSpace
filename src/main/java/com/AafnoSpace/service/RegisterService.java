package com.AafnoSpace.service;

import com.AafnoSpace.dao.UserDAO;
import com.AafnoSpace.utils.PasswordUtil;

public class RegisterService {
	UserDAO Userdao = new UserDAO();

	    public String addUser(String firstName, String lastName, String username,
	                           String email, String password,
	                           String address, String phoneNo) throws Exception {
	    	// Basic input validation
	        if (firstName == null || firstName.trim().isEmpty())
	        	return "First name is required";
	        if (lastName == null || lastName.trim().isEmpty()) 
	        	return "Last name is required";
	        if (username == null || username.trim().isEmpty())
	        	return "Username is required";
	        if (email == null || email.trim().isEmpty())
	        	return "Email is required";
	        if (password == null || password.isEmpty()) 
	        	return "Password is required";
	        if (address == null || address.trim().isEmpty())
	        	return "Address is required";
	        if (phoneNo == null || phoneNo.trim().isEmpty()) 
	        	return "Phone number is required";
	        try {
	            password = PasswordUtil.getHashPassword(password);
	            boolean success = Userdao.registerUser(firstName, lastName, username, email, password, address, phoneNo);
	            
	            if (success) {
	                return "Success";
	            } else {
	                return "Registration failed";
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            return "Error: " + e.getMessage();
	        }
    }
}