package com.AafnoSpace.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.AafnoSpace.dao.UserDAO;
import com.AafnoSpace.model.UserModel;
import com.AafnoSpace.service.LoginService;
import com.AafnoSpace.utils.CookieUtil;
import com.AafnoSpace.utils.SessionUtil;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Call LoginService
        LoginService service= new LoginService();
        String status = service.authenticate(username, password);
        System.out.println("LOGIN STATUS = " + status);

        // Handle the response status
        if ("Success".equals(status)) {
            try {
            	// Student data is stored in studentdata object after DAO operation
            	UserModel userdata = UserDAO.getUserByUsername(username);
            	
            	// Used Session's setAttribute method to store userdata object in server memory
            	// No need to set and pass data to jsp when used with session
            	// Just use EL and JSTL to show data in dashboard.jsp 
            	SessionUtil.setAttribute(request, "user", userdata, 3600);
            	
            	// Capture and format the current time
            	LocalDateTime now = LocalDateTime.now();
            	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd_HH:mm:ss");
            	String loginTime = now.format(formatter);
            	
            	// Cookie is created to record last login time
            	// look at browser cookie section to verify it
            	CookieUtil.addCookie(response, "last_login", loginTime, 3600);
            	 // Goto home page
	           
			} catch (Exception e) {
				// Print error in console of server
				e.printStackTrace();
			}
            response.sendRedirect(request.getContextPath() + "/home");
        }
        else {
        	// Set error and forward it to login page
            request.setAttribute("error", status);
            // To keep the username in the box
            request.setAttribute("typedUser", username); 
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        }
}
}


