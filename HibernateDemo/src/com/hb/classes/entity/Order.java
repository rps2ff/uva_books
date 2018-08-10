package com.hb.classes.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
	
	@Entity
	@Table(name="order_post")
	public class Order {

		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		@Column(name="order_id")
		private int orderid;
		
		@Column(name="book_id")
		private int bookid;
		
		@Column(name="title")
		private String title;
		
		/*@ManyToOne(cascade= {CascadeType.PERSIST, CascadeType.MERGE,
				 CascadeType.DETACH, CascadeType.REFRESH})
		@JoinColumn(name="buyer_id")*/
		@Column(name="buyer_id")
		private int buyerid;
		
		@Column(name="buyer_name")
		private String buyername;
		
		/*@ManyToOne(cascade= {CascadeType.PERSIST, CascadeType.MERGE,
				 CascadeType.DETACH, CascadeType.REFRESH})
		@JoinColumn(name="seller_id")*/
		@Column(name="seller_id")
		private int sellerid;
		
		@Column(name="seller_name")
		private String sellername;
		
		@Column(name="method_of_payment")
		private String method_of_payment;

		
		public int getBookid() {
			return bookid;
		}

		public void setBookid(int bookid) {
			this.bookid = bookid;
		}

		public int getOrderid() {
			return orderid;
		}

		public void setOrderid(int orderid) {
			this.orderid = orderid;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public int getBuyerid() {
			return buyerid;
		}

		public void setBuyerid(int buyerid) {
			this.buyerid = buyerid;
		}

		public int getSellerid() {
			return sellerid;
		}

		public void setSellerid(int sellerid) {
			this.sellerid = sellerid;
		}

		public String getMethod_of_payment() {
			return method_of_payment;
		}

		public void setMethod_of_payment(String method_of_payment) {
			this.method_of_payment = method_of_payment;
		}

		public String getBuyername() {
			return buyername;
		}

		public void setBuyername(String buyername) {
			this.buyername = buyername;
		}

		public String getSellername() {
			return sellername;
		}

		public void setSellername(String sellername) {
			this.sellername = sellername;
		}
		
		


		
		

		
		
		
		
}
