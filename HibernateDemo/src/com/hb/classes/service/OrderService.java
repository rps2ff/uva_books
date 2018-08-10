package com.hb.classes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hb.classes.dao.OrderDAO;
import com.hb.classes.dao.PostDAO;
import com.hb.classes.entity.Order;

@Service
public class OrderService {

	@Autowired
	private OrderDAO orderDAO;

	@Transactional
	public void saveOrder(Order toSave) {
		// TODO Auto-generated method stub
		orderDAO.saveOrder(toSave); 
	}
	
	@Transactional
	public List<Order> findOrders(int id) {
		// TODO Auto-generated method stub
		return orderDAO.findOrders(id);
	}

	@Transactional
	public List<Order> findSoldItems(int id) {
		// TODO Auto-generated method stub
		return orderDAO.findSoldItems(id); 
	}

}
