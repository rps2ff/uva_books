package com.hb.classes.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

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

import com.hb.classes.entity.Post;
import com.hb.classes.entity.User;
import com.hb.classes.service.PostService;
import com.hb.classes.service.UserService;

@Controller
@RequestMapping("/post")
public class PostController {
	
	List<String> interested_book_ids = new ArrayList<String>(); 
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
    private JavaMailSender mailSender;

	@GetMapping("/showAddPostForm")
	public String addPost(Model theModel) {
		
		Post thePost = new Post(); 
		theModel.addAttribute("post", thePost); 
		return "add_post_form";
	}
	
	@PostMapping("/savePost")
	public String savePost(@ModelAttribute("post") Post thePost, Model theModel, HttpSession session){
		User current_user = (User)session.getAttribute("currentuser");
		
		thePost.setUser(current_user);
		current_user.addPost(thePost);
		session.setAttribute("currentuser", current_user);
		postService.savePost(thePost); 
		
		return "redirect:/post/showUserPosts"; 
	}
	
	@GetMapping("/deletePost")
	public String deletePost(@RequestParam("bookid") int theId, Model theModel, HttpSession session){
		postService.deletePost(theId); 
		User current_user = (User)session.getAttribute("currentuser");
		current_user.getPosts().remove(theId);
		session.setAttribute("currentuser", current_user);
		theModel.addAttribute("current_user_posts", current_user.getPosts().values());
		return "redirect:/post/showUserPosts"; 
	}
		
	
	@GetMapping("/showUserPosts")
	public String showUserPosts(HttpSession session, Model theModel){
		User current_user = (User)session.getAttribute("currentuser");
		theModel.addAttribute("current_user_posts", current_user.getPosts().values()); 
		System.out.println(current_user.getPosts().values().toString());
		return "user_post_list"; 
		
	}
	
	@GetMapping("/showAllPosts")
	public String showAllPosts(HttpSession session, Model theModel){
		
		List<Post> retPosts = postService.showAllPosts(); 
		theModel.addAttribute("all_posts", retPosts); 
		return "all_posts_list"; 
		
	}
	
	@GetMapping("/showEditForm")
	public String showEditForm(@RequestParam("bookid") int theId, Model theModel){
		
		Post thePost = postService.getPost(theId);	
		
		theModel.addAttribute("post", thePost);
		return "add_post_form"; 
		
	}
	
	@GetMapping("/viewInterestedUsers")
	public String viewInterestedUsers(@RequestParam("bookid") int theId, Model theModel){	
		Post thePost = postService.getPost(theId);
		List<User> retlist = new ArrayList<User>(thePost.getInterestedUsers()); 
		System.out.println(thePost.getInterestedUsers().size());
		theModel.addAttribute("list_of_users", retlist);
		theModel.addAttribute("current_book", thePost); 
		return "view_interested_users"; 
		
	}
	
	@GetMapping("/viewFavorites")
	public String viewFavorites(HttpSession session, Model theModel){	
		User current_user = (User)session.getAttribute("currentuser");
		List<Post> retlist = new ArrayList<Post>(current_user.getInterestedPosts()); 
		//System.out.println(thePost.getInterestedUsers().size());
		theModel.addAttribute("list_of_posts", retlist);
		return "view_interested_posts"; 
		
	}
	
	@GetMapping("/removeFromInterested")
	public String removeFromInterested(@RequestParam("bookid") int theId, HttpSession session, Model theModel){	
			User current_user = (User)session.getAttribute("currentuser");
			Post thePost = postService.getPost(theId);
			
			if (thePost.containsUser(current_user)){
				System.out.println("true"); 
				current_user.removePost(thePost); 
				this.interested_book_ids.remove(Integer.toString(theId)); 
				thePost.removeUser(current_user);
				
				postService.savePost(thePost);
				
				session.setAttribute("currentuser", current_user);
			}
			
		return "redirect:/post/viewFavorites"; 
		
	}
	
	@GetMapping("/addToInterested")
	public String addToInterested(@RequestParam("bookid") int theId, HttpSession session, Model theModel){
		
		User current_user = (User)session.getAttribute("currentuser");
		Post thePost = postService.getPost(theId);
		System.out.println(thePost.containsUser(current_user));
		System.out.println(interested_book_ids.contains(Integer.toString(theId)));
		if (!thePost.containsUser(current_user)){
			
			current_user.addPostToInterested(thePost);
			thePost.addUserToInterested(current_user);
			
			postService.savePost(thePost);
			
			session.setAttribute("currentuser", current_user); 
			List<Post> retPosts = postService.showAllPosts(); 
			theModel.addAttribute("all_posts", retPosts);	
			interested_book_ids.add(Integer.toString(theId));
		}
		else{
			List<Post> retPosts = postService.showAllPosts(); 
			theModel.addAttribute("all_posts", retPosts);
			theModel.addAttribute("error_interested", "Cannot favorite post more than once."); 
			
		}
		
		//postService.saveUser(current_user);
		return "all_posts_list"; 
	}
	
	@PostMapping("/searchPost")
	public String searchPost(@RequestParam("coursecode") String courseCode, 
			@RequestParam("coursenumber") String courseNumber, 
			@RequestParam("department") String department, Model theModel){
		List<Post> retlist = null; 
		if (!courseNumber.equals("") && courseNumber != null){
			retlist = postService.searchPost(courseCode, courseNumber, department); 
		}
		else{
			retlist = postService.searchPost(courseCode, department); 
		}
		
		if (retlist == null || retlist.isEmpty()){
			theModel.addAttribute("error_search", "No items found."); 
		}
		else{
			theModel.addAttribute("search_result", retlist); 
		}
		return "search_list";
	}
	
	@PostMapping("/sendMessage")
	public String sendMessage(@RequestParam("subject") String subject, @RequestParam("email") String email, @RequestParam("message") String message, Model theModel){
		// takes input from e-mail form
        String recipientAddress = email;
        String subjectMail = subject;
        String messageMail = message; 
         
        // prints debug info
        System.out.println("To: " + recipientAddress);
        System.out.println("Subject: " + subject);
        System.out.println("Message: " + message);
         
        // creates a simple e-mail object
        SimpleMailMessage sendEmail = new SimpleMailMessage();
        sendEmail.setTo(recipientAddress);
        sendEmail.setSubject(subject);
        sendEmail.setText(message);
         
        // sends the e-mail
        mailSender.send(sendEmail);
        return "redirect:/post/showAllPosts"; 
	
	}
	
	@GetMapping("/acceptOffer")
	public String acceptOffer(HttpSession session, @RequestParam("bookid2") int bookid, @RequestParam("userid") int userid, Model theModel){
		
		
		User buyerUser = (User)(userService.getUser(userid));
		Post thePost = postService.getPost(bookid);
		
		buyerUser.addToOfferAccepted(thePost);
		thePost.setAcceptedBuyer(buyerUser);
		postService.savePost(thePost);
		theModel.addAttribute("accept_success", "Potential buyer informed!"); 
		return "view_interested_posts"; 
	}
	

}
