package com.hb.classes.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hb.classes.entity.Post;
import com.hb.classes.entity.User;

@Repository
public class PostDAO {

	@Autowired
	private SessionFactory sessionFactory; 
	
	public void savePost(Post thePost){
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(thePost);
		
		
		
		
	}

	public List<Post> showAllPosts() {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession(); 
		
		Query<Post> theQuery = currentSession.createQuery("FROM Post", Post.class);
		
		return theQuery.list(); 
		
	}

	public Post getPost(int theId) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		
		// now retrieve/read from database using the primary key
		Post thePost = currentSession.get(Post.class, theId);
		
		return thePost;
	}

	public void deletePost(int theId) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		Post thePost = currentSession.get(Post.class, theId); 
		currentSession.remove(thePost);
	}

	public void saveUser(User current_user) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(current_user);
	}

	public List<Post> searchPost(String courseCode, String courseNumber,
			String department) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Post> theQuery = currentSession.createQuery("FROM Post P WHERE P.course_code = :codeVAL AND "
				+ "P.course_number = :numVAL AND P.department = :deptVAL", Post.class);
		theQuery.setParameter("codeVAL", courseCode);
		theQuery.setParameter("numVAL", courseNumber);
		theQuery.setParameter("deptVAL", department);
		
		return theQuery.list(); 
		
	}

	public List<Post> searchPost(String courseCode, String department) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Post> theQuery = currentSession.createQuery("FROM Post P WHERE P.course_code = :codeVAL "
				+ "AND P.department = :deptVAL", Post.class);
		theQuery.setParameter("codeVAL", courseCode);
		theQuery.setParameter("deptVAL", department);
		
		return theQuery.list(); 
	}

}
