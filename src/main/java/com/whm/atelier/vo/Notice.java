package com.whm.atelier.vo;

public class Notice {
	
	private int admin_notice_no;
	private int admin_no;
	private String admin_notice_title;
	private String admin_notice_content;
	private String admin_notice_writedate;
	
	public Notice() {
		super();
	}

	public Notice(int admin_notice_no, int admin_no, String admin_notice_title, String admin_notice_content,
			String admin_notice_writedate) {
		super();
		this.admin_notice_no = admin_notice_no;
		this.admin_no = admin_no;
		this.admin_notice_title = admin_notice_title;
		this.admin_notice_content = admin_notice_content;
		this.admin_notice_writedate = admin_notice_writedate;
	}

	public int getAdmin_notice_no() {
		return admin_notice_no;
	}

	public void setAdmin_notice_no(int admin_notice_no) {
		this.admin_notice_no = admin_notice_no;
	}

	public int getAdmin_no() {
		return admin_no;
	}

	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}

	public String getAdmin_notice_title() {
		return admin_notice_title;
	}

	public void setAdmin_notice_title(String admin_notice_title) {
		this.admin_notice_title = admin_notice_title;
	}

	public String getAdmin_notice_content() {
		return admin_notice_content;
	}

	public void setAdmin_notice_content(String admin_notice_content) {
		this.admin_notice_content = admin_notice_content;
	}

	public String getAdmin_notice_writedate() {
		return admin_notice_writedate;
	}

	public void setAdmin_notice_writedate(String admin_notice_writedate) {
		this.admin_notice_writedate = admin_notice_writedate;
	}
	
}
