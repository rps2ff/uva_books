package com.hb.classes.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hb.classes.entity.Order;
import com.hb.classes.entity.Post;


@Repository
public class OrderDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	public void saveOrder(Order toSave) {
		// TODO Auto-generated method stub
		
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.save(toSave);
		
	}

	public List<Order> findOrders(int id) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Order> theQuery = currentSession.createQuery("FROM Order o WHERE o.buyerid = :buyeridVAL", Order.class);
		theQuery.setParameter("buyeridVAL", id);
		
		return theQuery.list(); 
	}

	public List<Order> findSoldItems(int id) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Order> theQuery = currentSession.createQuery("FROM Order o WHERE o.sellerid = :selleridVAL", Order.class);
		theQuery.setParameter("selleridVAL", id);
		
		return theQuery.list(); 
	} 

}
