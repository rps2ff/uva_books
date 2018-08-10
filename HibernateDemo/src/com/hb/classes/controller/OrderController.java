package com.hb.classes.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hb.classes.entity.Order;
import com.hb.classes.entity.Post;
import com.hb.classes.service.OrderService;
import com.hb.classes.service.PostService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private PostService postService;
	
	@PostMapping("/placeOrder")
	public String placeOrder(@RequestParam("bookid2") int bookid, @RequestParam("payment") String methodOfPayment){
		
		Post thePost = postService.getPost(bookid);
		
		Order toSave = new Order(); 
		toSave.setBuyerid(thePost.getAcceptedBuyer().getId());
		toSave.setMethod_of_payment(methodOfPayment);
		toSave.setBookid(bookid);
		toSave.setTitle(thePost.getTitle());
		toSave.setSellerid(thePost.getUser().getId());
		toSave.setBuyername(thePost.getAcceptedBuyer().getFirstName());
		toSave.setSellername(thePost.getUser().getFirstName());
		
		//thePost.getAcceptedBuyer().addToPosts_Bought(toSave);
		
		orderService.saveOrder(toSave); 
		return "redirect:/post/viewFavorites";
		
		
	}
}
