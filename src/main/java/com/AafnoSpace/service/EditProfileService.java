package com.AafnoSpace.service;

import com.AafnoSpace.dao.UserDAO;

public class EditProfileService {

    public String validateUser(String firstName, String lastName, String address, String email, String phoneNo)
    {
    	if (firstName == null || firstName.trim().isEmpty()) 
            return "First name is required";
    	if (lastName == null || lastName.trim().isEmpty()) 
            return "Last name is required";
        if (address == null || address.trim().isEmpty())
	        return "Address is required";
	    if (email == null || email.trim().isEmpty())
	        return "Email is required";
	    if (!email.contains("@"))
	    	return "Email must contain '@'";
	    if (phoneNo.length() != 10)
            return "Phone number must be 10 digits";
	    return "Validated";
    }
 }