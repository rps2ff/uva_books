package com.hb.classes.entity;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.*;
@Entity
@Table(name="user")
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;
	
	@Column(name="email")
	private String email;
	
	@Column(name="password")
	private String password;
	
	@Column(name="street")
	private String street;
	
	@Column(name="city")
	private String city;
	
	@Column(name="state")
	private String state;
	
	@Column(name="phone_number")
	private String phoneNumber;
	
	@OneToMany(mappedBy="user",
				fetch = FetchType.EAGER,
			   cascade= {CascadeType.PERSIST, CascadeType.MERGE,
						 CascadeType.DETACH, CascadeType.REFRESH})
	@MapKey(name="book_id")
	private Map<Integer, Post> posts;
	
	@ManyToMany(fetch=FetchType.EAGER,
			cascade= {CascadeType.PERSIST, CascadeType.MERGE,
			 CascadeType.DETACH, CascadeType.REFRESH})
	@JoinTable(
			name="interested_users",
			joinColumns=@JoinColumn(name="user_ID"),
			inverseJoinColumns=@JoinColumn(name="book_ID")
			)	
	private Set<Post> interestedPosts;
	
	@OneToMany(mappedBy="user",
			fetch = FetchType.EAGER,
		   cascade= {CascadeType.PERSIST, CascadeType.MERGE,
					 CascadeType.DETACH, CascadeType.REFRESH})
	private Set<Post> offerAccepted;
	
	/*@OneToMany(mappedBy="buyer",
			fetch = FetchType.EAGER,
		   cascade= {CascadeType.PERSIST, CascadeType.MERGE,
					 CascadeType.DETACH, CascadeType.REFRESH})
	private Set<Order> posts_bought;*/

	public User() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Customer [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + "]";
	}

	public Map<Integer, Post> getPosts() {
		return posts;
	}

	public void setPosts(HashMap<Integer, Post> posts) {
		this.posts = posts;
	}
	
	
	public Set<Post> getInterestedPosts() {
		return interestedPosts;
	}

	public void setInterestedPosts(Set<Post> interestedPosts) {
		this.interestedPosts = interestedPosts;
	}
	

	public Set<Post> getOfferAccepted() {
		return offerAccepted;
	}

	public void setOfferAccepted(Set<Post> offerAccepted) {
		this.offerAccepted = offerAccepted;
	}


	public void addPost(Post newPost) {
		
		if (posts == null) {
			posts = new HashMap<Integer, Post>();
		}
		
		posts.put(newPost.getBook_id(), newPost); 
		
		newPost.setUser(this);
	}
	
	public void addPostToInterested(Post newPost) {
		
		if (interestedPosts == null){
			interestedPosts = new HashSet<Post>(); 
		}
		interestedPosts.add(newPost); 
	}
	
	public boolean equalsUser(Object o){
		
		if (o instanceof User){
			User u = (User)o; 
			if (u.id == this.id){
				return true; 
			}
		}
		return false;
	}

	public void removePost(Post thePost) {
		// TODO Auto-generated method stub
		//Iterator<Post> it = this.interestedPosts.iterator();
		Post toRem = null; 
	    for(Post p: interestedPosts){
				if (p.equalsPost(thePost)){
					toRem = p;  
				}
		} 
	    this.interestedPosts.remove(toRem);
	}
	
	public void addToOfferAccepted(Post p) {
		if(offerAccepted == null){
			offerAccepted = new HashSet<Post>(); 
		}
		offerAccepted.add(p); 
	}
	
	/*public void addToPosts_Bought(Order p) {
		if(posts_bought == null){
			posts_bought = new HashSet<Order>(); 
		}
		posts_bought.add(p); 
	}

	public Set<Order> getPosts_bought() {
		return posts_bought;
	}

	public void setPosts_bought(Set<Order> posts_bought) {
		this.posts_bought = posts_bought;
	}
	
	*/
	
	
		
}


