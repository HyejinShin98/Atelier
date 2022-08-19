package com.whm.atelier.vo;

public class RentGroupGrade {

	private int rent_group_grade_no;
	private int customer_no;	
	private int rent_atelier_no;
	private int evaluated_customer_no;
	private int manner_grade;	
	private String manner_comment;
	
	public RentGroupGrade() {
		super();
	}

	public RentGroupGrade(int rent_group_grade_no, int customer_no, int rent_atelier_no, int evaluated_customer_no,
			int manner_grade, String manner_comment) {
		super();
		this.rent_group_grade_no = rent_group_grade_no;
		this.customer_no = customer_no;
		this.rent_atelier_no = rent_atelier_no;
		this.evaluated_customer_no = evaluated_customer_no;
		this.manner_grade = manner_grade;
		this.manner_comment = manner_comment;
	}

	public int getRent_group_grade_no() {
		return rent_group_grade_no;
	}

	public void setRent_group_grade_no(int rent_group_grade_no) {
		this.rent_group_grade_no = rent_group_grade_no;
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

	public int getEvaluated_customer_no() {
		return evaluated_customer_no;
	}

	public void setEvaluated_customer_no(int evaluated_customer_no) {
		this.evaluated_customer_no = evaluated_customer_no;
	}

	public int getManner_grade() {
		return manner_grade;
	}

	public void setManner_grade(int manner_grade) {
		this.manner_grade = manner_grade;
	}

	public String getManner_comment() {
		return manner_comment;
	}

	public void setManner_comment(String manner_comment) {
		this.manner_comment = manner_comment;
	}
	
	
}
	