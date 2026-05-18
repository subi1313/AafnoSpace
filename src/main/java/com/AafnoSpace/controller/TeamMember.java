package com.AafnoSpace.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/teamMember")
public class TeamMember extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String member = request.getParameter("member");

        String page;

        switch (member) {

            case "simran":
                page = "/WEB-INF/pages/Portfolio/simran.jsp";
                break;

            case "aaki":
                page = "/WEB-INF/pages/Portfolio/aaki.jsp";
                break;

            case "sulav":
                page = "/WEB-INF/pages/Portfolio/sulav.jsp";
                break;

            case "supragya":
                page = "/WEB-INF/pages/Portfolio/supragya.jsp";
                break;

            default:
                page = "/WEB-INF/pages/error.jsp";
                break;
        }

        request.getRequestDispatcher(page).forward(request, response);
    }
}