package com.whm.atelier.vo;

public class Faq {
	
	private int admin_faq_no;
	private String admin_faq_title;
	private String admin_faq_content;
	
	public Faq() {
		super();
	}

	public Faq(int admin_faq_no, String admin_faq_title, String admin_faq_content) {
		super();
		this.admin_faq_no = admin_faq_no;
		this.admin_faq_title = admin_faq_title;
		this.admin_faq_content = admin_faq_content;
	}

	public int getAdmin_faq_no() {
		return admin_faq_no;
	}

	public void setAdmin_faq_no(int admin_faq_no) {
		this.admin_faq_no = admin_faq_no;
	}

	public String getAdmin_faq_title() {
		return admin_faq_title;
	}

	public void setAdmin_faq_title(String admin_faq_title) {
		this.admin_faq_title = admin_faq_title;
	}

	public String getAdmin_faq_content() {
		return admin_faq_content;
	}

	public void setAdmin_faq_content(String admin_faq_content) {
		this.admin_faq_content = admin_faq_content;
	}
	
}
