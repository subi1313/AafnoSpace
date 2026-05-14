package com.AafnoSpace.service;

import java.util.List;

import com.AafnoSpace.dao.UserDAO;
import com.AafnoSpace.model.UserModel;

public class ListService {
	public List<UserModel> fetchAll() throws Exception {
		UserDAO userDAO = new UserDAO();
        return userDAO.getAllUsers();
    }
}