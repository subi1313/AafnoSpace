package com.AafnoSpace.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.AafnoSpace.model.UserModel;
import com.AafnoSpace.utils.SessionUtil;

/**
 * Servlet implementation class NavProfileLinkServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/nav-profile" })
public class NavProfileLinkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NavProfileLinkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserModel user =
                (UserModel) SessionUtil.getAttribute(request, "user");

        String target;

        if (user == null) {
            target = request.getContextPath() + "/login";
        } else if ("Admin".equalsIgnoreCase(user.getRole())) {
            target = request.getContextPath() + "/admin-profile";
        } else {
            target = request.getContextPath() + "/userProfile";
        }

        response.sendRedirect(target);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
