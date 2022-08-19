package com.whm.atelier.mapper.notice;

import java.util.ArrayList;

import com.whm.atelier.vo.Notice;

public interface NoticeMapper {
	
	public void insertNotice(Notice Notice); //공지사항 등록
	public ArrayList<Notice> selectAll(); //공지사항 목록
	public Notice selectByNo(int admin_no); //공지사항 확인
	public void deleteByNo(int admin_no); //공지사항 삭제
	public void updateNoticeTitleAndContent(Notice adminNotice); //공지사항 수정

}