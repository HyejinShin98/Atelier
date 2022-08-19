package com.whm.atelier.vo;

public class Admin {
	private int admin_no;
	private String admin_id;
	private String admin_pw;
	private String admin_nick;
	/**
	 * 
	 */
	public Admin() {
		super();
	}
	
	public Admin(String admin_id, String admin_pw) {
		this.admin_id = admin_id;
		this.admin_pw = admin_pw;
	}

	/**
	 * @param admin_no
	 * @param admin_id
	 * @param admin_pw
	 * @param admin_nick
	 */
	public Admin(int admin_no, String admin_id, String admin_pw, String admin_nick) {
		super();
		this.admin_no = admin_no;
		this.admin_id = admin_id;
		this.admin_pw = admin_pw;
		this.admin_nick = admin_nick;
	}

	public int getAdmin_no() {
		return admin_no;
	}

	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_pw() {
		return admin_pw;
	}

	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}

	public String getAdmin_nick() {
		return admin_nick;
	}

	public void setAdmin_nick(String admin_nick) {
		this.admin_nick = admin_nick;
	}
	
	@Override
	public String toString() {
		return "Admin[admin_no=" + admin_no
				+ "admin_id=" + admin_id
				+ "admin_pw=" + admin_pw
				+ "admin_nick=" + admin_nick
				+ "]";
	}
}


