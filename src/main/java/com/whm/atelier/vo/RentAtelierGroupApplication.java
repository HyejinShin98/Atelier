package com.whm.atelier.vo;

public class RentAtelierGroupApplication {
	
	private int rent_group_app_no;
	private int customer_no;
	private int rent_atelier_no;
	private String rent_group_app_comment;
	private String rent_group_app_complete_yn;
	
	public RentAtelierGroupApplication() {
		super();
	}

	public RentAtelierGroupApplication(int rent_group_app_no, int customer_no, int rent_atelier_no,
			String rent_group_app_comment, String rent_group_app_complete_yn) {
		super();
		this.rent_group_app_no = rent_group_app_no;
		this.customer_no = customer_no;
		this.rent_atelier_no = rent_atelier_no;
		this.rent_group_app_comment = rent_group_app_comment;
		this.rent_group_app_complete_yn = rent_group_app_complete_yn;
	}

	public int getRent_group_app_no() {
		return rent_group_app_no;
	}

	public void setRent_group_app_no(int rent_group_app_no) {
		this.rent_group_app_no = rent_group_app_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public int getRent_atelier_no() {
		return rent_atelier_no;
	}

	public void setRent_atelier_no(int rent_atelier_no) {
		this.rent_atelier_no = rent_atelier_no;
	}

	public String getRent_group_app_comment() {
		return rent_group_app_comment;
	}

	public void setRent_group_app_comment(String rent_group_app_comment) {
		this.rent_group_app_comment = rent_group_app_comment;
	}

	public String getRent_group_app_complete_yn() {
		return rent_group_app_complete_yn;
	}

	public void setRent_group_app_complete_yn(String rent_group_app_complete_yn) {
		this.rent_group_app_complete_yn = rent_group_app_complete_yn;
	}
		
}
