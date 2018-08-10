package com.hb.classes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hb.classes.dao.UserDAO;
import com.hb.classes.entity.User;

@Service
public class UserService {
	
	@Autowired
	private UserDAO userDAO; 
	
	@Transactional
	public boolean saveUser(User theUser){
		return userDAO.saveUser(theUser); 
	}

	@Transactional
	public void updateUser(User theUser){
		userDAO.updateUser(theUser); 
	}

	@Transactional
	public List<User> validateUser(String email, String password) {
		// TODO Auto-generated method stub
		
		List<User> validUser = userDAO.validateUser(email, password);
		
		return validUser; 
	}
	
	@Transactional
	public User getUser(int userid) {
		// TODO Auto-generated method stub
		return userDAO.getUser(userid);
	}
}
