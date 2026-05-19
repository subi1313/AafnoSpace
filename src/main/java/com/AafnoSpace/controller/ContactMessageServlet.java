package com.AafnoSpace.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.AafnoSpace.model.ContactModel;
import com.AafnoSpace.service.ContactService;

/**
 * Servlet implementation class ContactMessageServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/contact-message" })
public class ContactMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ContactService service = new ContactService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            List<ContactModel> contacts = service.getAllContacts();

            //send data to JSP
            request.setAttribute("contacts", contacts);

            //active menu highlight
            request.setAttribute("activeMenu", "message");

            //forward to JSP
            request.getRequestDispatcher("/WEB-INF/pages/contactMessage.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
