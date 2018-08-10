package com.hb.classes.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hb.classes.entity.Post;
import com.hb.classes.entity.User;

@Repository
public class UserDAO {

	@Autowired
	private SessionFactory sessionFactory; 
	
	public boolean saveUser(User theUser){
		
		Session currentSession = sessionFactory.getCurrentSession(); 
		
		Query<User> theQuery = currentSession.createQuery("FROM User U WHERE U.password = :passwordVAL", User.class);
		theQuery.setParameter("passwordVAL", theUser.getPassword()); 
		
		if (theQuery.list().isEmpty()){
			currentSession.save(theUser);
			return true; 
		} 
		else{
			return false; 
		}
		
		
	}
	
	public void updateUser(User user){
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(user);
	}
	
	public List<User> validateUser(String email, String password) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession(); 
		Query<User> theQuery = currentSession.createQuery("FROM User U WHERE U.email = :emailVAL AND U.password = :passwordVAL", User.class);
		theQuery.setParameter("emailVAL", email); 
		theQuery.setParameter("passwordVAL", password); 
		
		
		List<User> userList = theQuery.list(); 
		
		return userList; 
		
	}

	public User getUser(int userid) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		
		// now retrieve/read from database using the primary key
		User theUser = currentSession.get(User.class, userid);
		
		return theUser;
	}
}
