package com.AafnoSpace.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.AafnoSpace.utils.FileUploadUtil;
import com.AafnoSpace.utils.SessionUtil;

/**
 * Servlet implementation class EditUserProfile
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/editUserProfile" })
public class EditUserProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR = System.getProperty("user.home") + File.separator + "profilepicture_uploads";   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/pages/editUserProfile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  Part filePart = request.getPart("profileImage");
	        if (filePart != null && filePart.getSize() > 0) {
	            if (FileUploadUtil.isImage(filePart)) {
	                String extension = FileUploadUtil.getFileExtension(filePart.getSubmittedFileName());
	                String fileName = "admin" + extension;
	                FileUploadUtil.saveFile(filePart, UPLOAD_DIR, fileName);
	                //if upload is successful
	                response.sendRedirect(request.getContextPath() + "/AdminProfile");
	            } 
	            //if upload is unsuccessful
	            else {
	                SessionUtil.setAttribute(request, "error", "Invalid image type.", 60);
	                response.sendRedirect(request.getContextPath() + "/editAdminProfile");
	            }
	        }
	        else {
	                response.sendRedirect(request.getContextPath() + "/AdminProfile");
	            }
	        }

}
