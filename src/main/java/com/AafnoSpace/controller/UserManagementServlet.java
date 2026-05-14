package com.AafnoSpace.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.AafnoSpace.model.UserModel;
import com.AafnoSpace.service.ListService;

/**
 * Servlet implementation class UserManagement
 */
@WebServlet(asyncSupported = true, urlPatterns = {})
public class UserManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserManagementServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			ListService service = new ListService();
			
            // getting data from service
            List<UserModel> users= service.fetchAll();

            // setting the data
            request.setAttribute("users", users);

            // forward to JSP
            request.getRequestDispatcher("/WEB-INF/pages/userManagement.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error in database!", e);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
