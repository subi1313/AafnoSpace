package com.AafnoSpace.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.AafnoSpace.service.ContactService;

/**
 * Servlet implementation class ContactServlet
 */
@WebServlet(
		asyncSupported = true, 
		urlPatterns = { 
				"/contact", 
				"/contactus"
		})
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ContactService service = new ContactService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String subject = request.getParameter("subject");
            String message = request.getParameter("message");
            
            int result = service.addContact(name, email, subject, message);

            if (result > 0) {
                response.sendRedirect(request.getContextPath() + "/contact?success=true");
            } else {
                response.sendRedirect(request.getContextPath() + "/contact?error=true");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/contact?error=true");
        }
	}

}
