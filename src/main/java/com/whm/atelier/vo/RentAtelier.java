package com.whm.atelier.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class RentAtelier {
	
	private int rent_atelier_no;
	private int customer_no;
	private String rent_atelier_title;
	private String rent_atelier_content;
	private String rent_atelier_location;
	private int rent_atelier_max_no;
	private int rent_atelier_price;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date rent_atelier_plan;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date rent_atelier_writedate;
	private String rent_group_app_complete_yn = "y";
	
	public RentAtelier() {
		super();
	}

	public RentAtelier(int rent_atelier_no, int customer_no, String rent_atelier_title, String rent_atelier_content,
			String rent_atelier_location, int rent_atelier_max_no, int rent_atelier_price, Date rent_atelier_plan,
			Date rent_atelier_writedate) {
		super();
		this.rent_atelier_no = rent_atelier_no;
		this.customer_no = customer_no;
		this.rent_atelier_title = rent_atelier_title;
		this.rent_atelier_content = rent_atelier_content;
		this.rent_atelier_location = rent_atelier_location;
		this.rent_atelier_max_no = rent_atelier_max_no;
		this.rent_atelier_price = rent_atelier_price;
		this.rent_atelier_plan = rent_atelier_plan;
		this.rent_atelier_writedate = rent_atelier_writedate;
	}

	public int getRent_atelier_no() {
		return rent_atelier_no;
	}

	public void setRent_atelier_no(int rent_atelier_no) {
		this.rent_atelier_no = rent_atelier_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public String getRent_atelier_title() {
		return rent_atelier_title;
	}

	public void setRent_atelier_title(String rent_atelier_title) {
		this.rent_atelier_title = rent_atelier_title;
	}

	public String getRent_atelier_content() {
		return rent_atelier_content;
	}

	public void setRent_atelier_content(String rent_atelier_content) {
		this.rent_atelier_content = rent_atelier_content;
	}

	public String getRent_atelier_location() {
		return rent_atelier_location;
	}

	public void setRent_atelier_location(String rent_atelier_location) {
		this.rent_atelier_location = rent_atelier_location;
	}

	public int getRent_atelier_max_no() {
		return rent_atelier_max_no;
	}

	public void setRent_atelier_max_no(int rent_atelier_max_no) {
		this.rent_atelier_max_no = rent_atelier_max_no;
	}

	public int getRent_atelier_price() {
		return rent_atelier_price;
	}

	public void setRent_atelier_price(int rent_atelier_price) {
		this.rent_atelier_price = rent_atelier_price;
	}

	public Date getRent_atelier_plan() {
		return rent_atelier_plan;
	}

	public void setRent_atelier_plan(Date rent_atelier_plan) {
		this.rent_atelier_plan = rent_atelier_plan;
	}

	public Date getRent_atelier_writedate() {
		return rent_atelier_writedate;
	}

	public void setRent_atelier_writedate(Date rent_atelier_writedate) {
		this.rent_atelier_writedate = rent_atelier_writedate;
	}

}
