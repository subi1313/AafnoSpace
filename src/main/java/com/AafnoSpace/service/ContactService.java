package com.AafnoSpace.service;

import com.AafnoSpace.dao.ContactDAO;

public class ContactService {
	ContactDAO dao = new ContactDAO();

    public int addContact(String name, String email, String subject, String message) throws Exception {
    	return dao.insertContact(name, email, subject, message);
    }
}
