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
@WebServlet(asyncSupported = true, urlPatterns = { "/login", ""})
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

        // Calling LoginService
        LoginService service= new LoginService();
        String status = service.authenticate(username, password);
        System.out.println("LOGIN STATUS = " + status);

        // Handle the response status
        if ("Success".equals(status)) {
            try {
            	// User data is stored in userdata object after DAO operation
            	UserModel userdata = UserDAO.getUserByUsername(username);
            	
            	// Using Session's setAttribute method to store userdata object in server memory
            	request.getSession().invalidate(); 	//killing the older registration session
            	//Creating new session after login
            	SessionUtil.setAttribute(request, "user", userdata, 3600);
            	
            	// Capture and format the current time
            	LocalDateTime now = LocalDateTime.now();
            	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd_HH:mm:ss");
            	String loginTime = now.format(formatter);
            	
            	// Cookie is created to record last login time
            	CookieUtil.addCookie(response, "last_login", loginTime, 3600);
                     response.sendRedirect(request.getContextPath() + "/home");
                
			} catch (Exception e) {
				e.printStackTrace();
			}
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