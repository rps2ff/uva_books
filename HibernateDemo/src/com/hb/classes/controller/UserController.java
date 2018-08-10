package com.hb.classes.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hb.classes.entity.Order;
import com.hb.classes.entity.Post;
import com.hb.classes.entity.User;
import com.hb.classes.service.OrderService;
import com.hb.classes.service.PostService;
import com.hb.classes.service.UserService;

@Controller
@RequestMapping("/customer")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/list")
	public String listUser(Model theModel) {
		
		return "list-customers";
	}
	
	@GetMapping("/showRegisterForm")
	public String showRegisterForm(Model theModel){
		
		User theUser = new User(); 
		theModel.addAttribute("user", theUser); 
		return "user-form"; 
		
	}
	
	@GetMapping("/showLoginForm")
	public String showLoginForm(){
		
		return "login-form"; 
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session){
		
		session.removeAttribute("currentuser");
		return "redirect:/home"; 
	}
	
	@PostMapping("/saveUser")
	public String saveUser(@ModelAttribute("user") User theUser, Model theModel){
		
		boolean validPassword = userService.saveUser(theUser); 
		
		if (validPassword){
			return "redirect:/home"; 
		}
		else{
			theModel.addAttribute("register_error", "Password already taken");
			System.out.println("invalid password");
			return "user-form"; 
		} 
	}
	
	@GetMapping("/showProfile")
	public String showProfile(HttpSession session, Model theModel){
		User current_user = (User)session.getAttribute("currentuser");
		return "profile";
	}
	
	@GetMapping("/showUpdateProfileForm")
	public String showEditForm(@RequestParam("userid") int theId, HttpSession session, Model theModel){
		
		User theUser = (User)session.getAttribute("currentuser");	
		
		theModel.addAttribute("user", theUser);
		return "update_user_form"; 
		
	}
	
	@GetMapping("/viewMyOrders")
	public String viewMyOrders(HttpSession session, Model theModel){
		
		User theUser = (User)session.getAttribute("currentuser");	
		List<Order> myOrders = orderService.findOrders(theUser.getId()); 
		
		theModel.addAttribute("order_list", myOrders);
		return "order_list_page"; 
		
	}
	
	@GetMapping("/viewSoldItems")
	public String viewSoldItems(HttpSession session, Model theModel){
		
		User theUser = (User)session.getAttribute("currentuser");	
		List<Order> myOrders = orderService.findSoldItems(theUser.getId()); 
		
		theModel.addAttribute("sold_items", myOrders);
		return "sold_items_page"; 
		
	}
	
	@PostMapping("/updateUser")
	public String updateUser(@ModelAttribute("user") User theUser, HttpSession session, Model theModel){
		
		userService.updateUser(theUser);
		User new_current_user = userService.getUser(theUser.getId());
		session.setAttribute("currentuser", new_current_user);
		return "redirect:/customer/showProfile"; 
		
	}
	
	@PostMapping("/validateUser")
	public String validateUser(@RequestParam("email") String email, @RequestParam("password") String password, 
			HttpSession session, Model theModel){ 
		
		List<User> userList = userService.validateUser(email, password);
		
		//System.out.println("list is " + userList); 
		if (userList == null || userList.isEmpty()){
			theModel.addAttribute("error", "Invalid Credentials"); 
			return "login-form"; 
		}
		else{
			session.setAttribute("currentuser", userList.get(0));
			System.out.println(((User)session.getAttribute("currentuser")).getFirstName());
			return "redirect:/home"; 
		}
	}
	
	
		
	
	
		
		

}
