package com.AafnoSpace.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.AafnoSpace.service.RegisterService;
import com.AafnoSpace.utils.SessionUtil;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet(
		asyncSupported = true, 
		urlPatterns = { 
				"/register", 
				"/registration"
		})
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//Fetching data from form:
		try {
            // Fetch Form data
            String firstName = request.getParameter("firstname");
            String lastName = request.getParameter("lastname");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String address = request.getParameter("address");
            String phoneNo = request.getParameter("phoneNo");
            
            //calling register service
            RegisterService service = new RegisterService();
            String status = service.addUser(firstName, lastName, username, email, password, address, phoneNo);

            if ("Success".equals(status)) {
            	//if registration is successful, a temporary session to retrieve username is created
            	 SessionUtil.setAttribute(request, "username", username, 3600);
                response.sendRedirect(request.getContextPath() + "/uploadpfp");
            } else {
            	//sending typed values to frontend for better user experience
                request.setAttribute("error", status);
                request.setAttribute("typedUser", username);
                request.setAttribute("firstname", firstName);
                request.setAttribute("lastname", lastName);
                request.setAttribute("email", email);
                request.setAttribute("address", address);
                request.setAttribute("phone", phoneNo);
                request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
            }
        }
		 catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("Error: " + e.getMessage());
	        }
}
}