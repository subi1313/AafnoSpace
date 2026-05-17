package com.AafnoSpace.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.AafnoSpace.model.UserModel;
import com.AafnoSpace.service.ContactService;
import com.AafnoSpace.utils.SessionUtil;

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
			UserModel user = (UserModel) SessionUtil.getAttribute(request, "user");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String subject = request.getParameter("subject");
            String message = request.getParameter("message");
            
            String role = user.getRole();
            if ("Admin".equalsIgnoreCase(role)) {
                request.setAttribute("error", "Admins are not allowed to send contact messages!");
                request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
                return;
            }
            
            if (name == null || name.trim().isEmpty()) {
                request.setAttribute("error", "Name is required!");
                request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
                return;
            }

            if (email == null || email.trim().isEmpty()) {
                request.setAttribute("error", "Email is required!");
                request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
                return;
            }

            if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
                request.setAttribute("error", "Invalid email format!");
                request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
                return;
            }

            if (subject == null || subject.trim().isEmpty()) {
                request.setAttribute("error", "Subject is required!");
                request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
                return;
            }

            if (message == null || message.trim().isEmpty()) {
                request.setAttribute("error", "Message is required!");
                request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
                return;
            }
            
            int result = service.addContact(name, email, subject, message);

            if (result > 0) {
            	request.setAttribute("success", "Message sent successfully!");
            	request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
            } else {
            	request.setAttribute("error", "Failed to send message!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/contact");
        }
	}

}
