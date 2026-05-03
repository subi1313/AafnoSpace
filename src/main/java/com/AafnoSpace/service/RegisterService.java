package com.AafnoSpace.service;

import com.AafnoSpace.dao.UserDAO;
import com.AafnoSpace.utils.PasswordUtil;

public class RegisterService {
	UserDAO Userdao = new UserDAO();

	    public boolean addUser(String firstName, String lastName, String username,
	                           String email, String password,
	                           String address, String phoneNo) throws Exception {
    	// For hashing password
    	password=PasswordUtil.getHashPassword(password); 
    	
        return Userdao.registerUser(firstName, lastName, username, email, password, address, phoneNo);
    }
}