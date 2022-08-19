package com.whm.atelier.mapper.faq;

import java.util.ArrayList;

import com.whm.atelier.vo.Faq;

public interface FaqMapper {
	
	public ArrayList<Faq> selectFaqAll(); //자주묻는질문 목록
	public Faq selectFaqByNo(int admin_faq_no); //자주묻는질문 확인
	public void updateFaqTitleAndContent(Faq faq); //자주묻는질문 수정
}
