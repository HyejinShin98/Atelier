package com.whm.atelier.vo;

public class FreeBoardImageVo {
	
	private int freeboardimage_no;
	private int freeboard_no;
	private String freeboardimage_link;
	private String freeboardimage_origin_filename;
	public FreeBoardImageVo() {
		super();
	}
	public FreeBoardImageVo(int freeboardimage_no, int freeboard_no, String freeboardimage_link,
			String freeboardimage_origin_filename) {
		super();
		this.freeboardimage_no = freeboardimage_no;
		this.freeboard_no = freeboard_no;
		this.freeboardimage_link = freeboardimage_link;
		this.freeboardimage_origin_filename = freeboardimage_origin_filename;
	}
	public int getFreeboardimage_no() {
		return freeboardimage_no;
	}
	public void setFreeboardimage_no(int freeboardimage_no) {
		this.freeboardimage_no = freeboardimage_no;
	}
	public int getFreeboard_no() {
		return freeboard_no;
	}
	public void setFreeboard_no(int freeboard_no) {
		this.freeboard_no = freeboard_no;
	}
	public String getFreeboardimage_link() {
		return freeboardimage_link;
	}
	public void setFreeboardimage_link(String freeboardimage_link) {
		this.freeboardimage_link = freeboardimage_link;
	}
	public String getFreeboardimage_origin_filename() {
		return freeboardimage_origin_filename;
	}
	public void setFreeboardimage_origin_filename(String freeboardimage_origin_filename) {
		this.freeboardimage_origin_filename = freeboardimage_origin_filename;
	}
	
	
}