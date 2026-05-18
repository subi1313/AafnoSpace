package com.AafnoSpace.dao;

import com.AafnoSpace.model.ContactModel;
import com.AafnoSpace.utils.DBconfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * ContactDAO handles all database operations related to Contact messages.
 *
 */
public class ContactDAO {
	
	/**
     * Inserts a new contact message into the database.
     *
     * This method stores user-submitted contact form data into the
     * "contact" table.
     */
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
	
	/**
     * Retrieves all contact messages from the database.
     *
     * This method fetches all records from the "contact" table and
     * converts them into a list of ContactModel objects.
     */
	public List<ContactModel> getAllContacts() throws Exception {

        List<ContactModel> list = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        String sql = "SELECT * FROM contact";

        PreparedStatement pst = con.prepareStatement(sql);

        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            ContactModel c = new ContactModel();

            c.setId(rs.getInt("ContactId"));
            c.setName(rs.getString("ContactName"));
            c.setEmail(rs.getString("ContactEmail"));
            c.setSubject(rs.getString("Subject"));
            c.setMessage(rs.getString("Message"));

            list.add(c);
        }

        rs.close();
        pst.close();
        con.close();

        return list;
    }
}