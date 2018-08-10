package com.hb.classes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hb.classes.dao.PostDAO;
import com.hb.classes.dao.UserDAO;
import com.hb.classes.entity.Post;
import com.hb.classes.entity.User;

@Service
public class PostService {
	
	@Autowired
	private PostDAO postDAO; 
	
	@Transactional
	public void savePost(Post thePost){
		postDAO.savePost(thePost); 
	}
	@Transactional
	public List<Post> showAllPosts() {
		// TODO Auto-generated method stub
		return postDAO.showAllPosts(); 
	}
	@Transactional
	public Post getPost(int theId) {
		// TODO Auto-generated method stub
		return postDAO.getPost(theId);
	}
	@Transactional
	public void deletePost(int theId) {
		// TODO Auto-generated method stub
		postDAO.deletePost(theId); 
	}
	@Transactional
	public void saveUser(User current_user) {
		// TODO Auto-generated method stub
		postDAO.saveUser(current_user); 
	}
	@Transactional
	public List<Post> searchPost(String courseCode, String courseNumber,
			String department) {
		// TODO Auto-generated method stub
		return postDAO.searchPost(courseCode, courseNumber, department); 
		
	}
	@Transactional
	public List<Post> searchPost(String courseCode, String department) {
		// TODO Auto-generated method stub
		return postDAO.searchPost(courseCode, department); 
		
	}

}
