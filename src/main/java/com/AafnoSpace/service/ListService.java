package com.AafnoSpace.service;

import java.util.List;

import com.AafnoSpace.dao.UserDAO;
import com.AafnoSpace.model.UserModel;

public class ListService {
	public List<UserModel> fetchAll() throws Exception {
		UserDAO userDAO = new UserDAO();
        return userDAO.getAllUsers();
    }


public void updateUserStatus(int userId, String status) {
    UserDAO dao = new UserDAO();
    try {
        dao.updateUserStatus(userId, status);
    } catch (Exception e) {
        e.printStackTrace();
    }
}
}