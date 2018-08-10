package com.hb.classes.entity;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
		
@Entity
@Table(name="post")
public class Post {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="book_id")
	private int book_id;
	
	@Column(name="book_isbn")
	private String book_isbn;
	
	@Column(name="title")
	private String title;
	
	@Column(name="author")
	private String author;
	
	@Column(name="course_code")
	private String course_code;
	
	@Column(name="course_number")
	private String course_number;
	
	@Column(name="professor")
	private String professor;
	
	@Column(name="department")
	private String department;
	
	@ManyToOne(cascade= {CascadeType.PERSIST, CascadeType.MERGE,
			 CascadeType.DETACH, CascadeType.REFRESH})
	@JoinColumn(name="user_id")
	private User user;
	
	@ManyToOne(cascade= {CascadeType.PERSIST, CascadeType.MERGE,
			 CascadeType.DETACH, CascadeType.REFRESH})
	@JoinColumn(name="buyer_id")
	private User acceptedBuyer; 
	
	@Column(name="price")
	private Double price;
	
	@ManyToMany(fetch=FetchType.EAGER,
			cascade= {CascadeType.PERSIST, CascadeType.MERGE,
			 CascadeType.DETACH, CascadeType.REFRESH})
	@JoinTable(
			name="interested_users",
			joinColumns=@JoinColumn(name="book_ID"),
			inverseJoinColumns=@JoinColumn(name="user_ID")
			)
	private Set<User> interestedUsers; 

	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

	public String getBook_isbn() {
		return book_isbn;
	}

	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getCourse_code() {
		return course_code;
	}

	public void setCourse_code(String course_code) {
		this.course_code = course_code;
	}

	public String getCourse_number() {
		return course_number;
	}

	public void setCourse_number(String course_number) {
		this.course_number = course_number;
	}

	public String getProfessor() {
		return professor;
	}

	public void setProfessor(String professor) {
		this.professor = professor;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Set<User> getInterestedUsers() {
		return interestedUsers;
	}

	public void setInterestedUsers(Set<User> interestedUsers) {
		this.interestedUsers = interestedUsers;
	}
	
	public User getAcceptedBuyer() {
		return acceptedBuyer;
	}

	public void setAcceptedBuyer(User acceptedBuyer) {
		this.acceptedBuyer = acceptedBuyer;
	}

	public void addUserToInterested(User newUser) {
		if(interestedUsers == null){
			interestedUsers = new HashSet<User>(); 
		}
		this.getInterestedUsers().add(newUser);
	}
	

	public boolean equalsPost(Object o){
		if (o instanceof Post){
			Post p = (Post)o; 
			if (p.book_id == this.book_id){
				return true; 
			}
			else{
				System.out.println(p.book_id + " " + this.book_id);
				return false; 
			}
		}
		else{
			System.out.println("not instance");
			return false; 
		}
		
	}

	public boolean containsUser(User curr_u) {
		// TODO Auto-generated method stub
		for (User u: interestedUsers){
			if (u.equalsUser(curr_u)){
				return true; 
			}
		}
		return false;
	}

	public void removeUser(User theUser) {
		// TODO Auto-generated method stub
		//Iterator<User> it = this.interestedUsers.iterator();
		User toRem = null; 
		for(User u : interestedUsers){
	    	 	if (u.equalsUser(theUser)){
	    	 		 toRem = u; 
	     		}
		}
	     this.interestedUsers.remove(toRem);
	}
	
	
	
	
	
}
