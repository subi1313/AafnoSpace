package com.AafnoSpace.service;

import com.AafnoSpace.dao.UserDAO;
import com.AafnoSpace.utils.PasswordUtil;
import com.AafnoSpace.model.UserModel;

public class LoginService {
	public String authenticate(String username, String password) {

	// Basic input fields validation
	if (username == null || username.trim().isEmpty()) {
        return "Username is required";
    }
    if (password == null || password.isEmpty()) {
        return "Password is required";
    }
    
    try {
        // Fetching the user by username from DAO
        UserModel user = UserDAO.getUserByUsername(username);

        // Checking if user exists
        if (user == null) {
            return "User does not exist";
        }

        // Verifying the password
        if (PasswordUtil.checkPassword(password, user.getPassword())) {
            return "Success";
        } 
        else {
            return "Password is incorrect";
        }

    } catch (Exception e) {
        e.printStackTrace();
        return "Error: " + e.getMessage();
    }
}
}