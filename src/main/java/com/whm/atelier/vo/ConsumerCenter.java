package com.whm.atelier.vo;

import java.util.Date;

public class ConsumerCenter {

	private int con_center_no;
	private int consumer_no;
	private int admin_no;
	private String con_center_title;
	private String con_center_content;
	private String con_center_comment_by_admin;
	private Date con_center_writedate;
	private Date con_center_writedate_by_admin;
	private String con_center_category_yn;
	
	public ConsumerCenter() {
		super();
	}

	public ConsumerCenter(int con_center_no, int consumer_no, int admin_no, String con_center_title,
			String con_center_content, String con_center_comment_by_admin, Date con_center_writedate,
			Date con_center_writedate_by_admin, String con_center_category_yn) {
		super();
		this.con_center_no = con_center_no;
		this.consumer_no = consumer_no;
		this.admin_no = admin_no;
		this.con_center_title = con_center_title;
		this.con_center_content = con_center_content;
		this.con_center_comment_by_admin = con_center_comment_by_admin;
		this.con_center_writedate = con_center_writedate;
		this.con_center_writedate_by_admin = con_center_writedate_by_admin;
		this.con_center_category_yn = con_center_category_yn;
	}

	public int getCon_center_no() {
		return con_center_no;
	}

	public void setCon_center_no(int con_center_no) {
		this.con_center_no = con_center_no;
	}

	public int getConsumer_no() {
		return consumer_no;
	}

	public void setConsumer_no(int consumer_no) {
		this.consumer_no = consumer_no;
	}

	public int getAdmin_no() {
		return admin_no;
	}

	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}

	public String getCon_center_title() {
		return con_center_title;
	}

	public void setCon_center_title(String con_center_title) {
		this.con_center_title = con_center_title;
	}

	public String getCon_center_content() {
		return con_center_content;
	}

	public void setCon_center_content(String con_center_content) {
		this.con_center_content = con_center_content;
	}

	public String getCon_center_comment_by_admin() {
		return con_center_comment_by_admin;
	}

	public void setCon_center_comment_by_admin(String con_center_comment_by_admin) {
		this.con_center_comment_by_admin = con_center_comment_by_admin;
	}

	public Date getCon_center_writedate() {
		return con_center_writedate;
	}

	public void setCon_center_writedate(Date con_center_writedate) {
		this.con_center_writedate = con_center_writedate;
	}

	public Date getCon_center_writedate_by_admin() {
		return con_center_writedate_by_admin;
	}

	public void setCon_center_writedate_by_admin(Date con_center_writedate_by_admin) {
		this.con_center_writedate_by_admin = con_center_writedate_by_admin;
	}

	public String getCon_center_category_yn() {
		return con_center_category_yn;
	}

	public void setCon_center_category_yn(String con_center_category_yn) {
		this.con_center_category_yn = con_center_category_yn;
	}
	
}
