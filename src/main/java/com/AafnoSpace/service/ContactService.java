package com.AafnoSpace.service;

import java.util.List;

import com.AafnoSpace.dao.ContactDAO;
import com.AafnoSpace.model.ContactModel;

public class ContactService {
	ContactDAO dao = new ContactDAO();

    public int addContact(String name, String email, String subject, String message) throws Exception {
    	return dao.insertContact(name, email, subject, message);
    }
    
    public List<ContactModel> getAllContacts() throws Exception {
        return dao.getAllContacts();
    }
}
