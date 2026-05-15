package com.AafnoSpace.dao;

import com.AafnoSpace.utils.DBconfig;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ContactDAO {
	public int insertContact(String name, String email, String subject, String message) throws Exception {

	    Connection con = DBconfig.getConnection();

	    String sql = "INSERT INTO contact(ContactName, ContactEmail, Subject, Message) VALUES (?, ?, ?, ?)";

	    PreparedStatement pst = con.prepareStatement(sql);

	    pst.setString(1, name);
	    pst.setString(2, email);
	    pst.setString(3, subject);
	    pst.setString(4, message);

	    int rowsAffected = pst.executeUpdate();

	    pst.close();
	    con.close();

	    return rowsAffected;
	}
}