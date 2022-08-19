package com.whm.atelier.service.board;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whm.atelier.mapper.board.CustomerBoardSQLMapper;
import com.whm.atelier.mapper.customer.CustomerMainMapper;
import com.whm.atelier.vo.CommentVo;
import com.whm.atelier.vo.Customer;
import com.whm.atelier.vo.FreeBoardImageVo;
import com.whm.atelier.vo.FreeBoardVo;

@Service
public class CustomerBoardServiceImpl {

	@Autowired
	private CustomerBoardSQLMapper customerBoardSQLMapper;
	
	@Autowired
	private CustomerMainMapper customerMainMapper;
	
//	글 작성
	public void writeContent(FreeBoardVo freeboardVo, ArrayList<FreeBoardImageVo> freeboardImageList) {
		int freeboardPk = customerBoardSQLMapper.createFreeBoardPk();
		freeboardVo.setFreeboard_no(freeboardPk);
		customerBoardSQLMapper.insertBoard(freeboardVo);
		
		
		for(FreeBoardImageVo freeboardImageVo : freeboardImageList) {
			freeboardImageVo.setFreeboard_no(freeboardPk);
			customerBoardSQLMapper.insertFreeBoardImage(freeboardImageVo);
		}
	}

	public ArrayList<HashMap<String, Object>> getCustomerBoardDataList(){
		
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String,Object>>();
	
		ArrayList<FreeBoardVo> freeBoardList = customerBoardSQLMapper.selectAll();
		
		for(FreeBoardVo freeboardVo : freeBoardList) {
			int customerNo = freeboardVo.getCustomer_no();
			Customer customer = customerMainMapper.selectByNo(customerNo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("Customer", customer);
			map.put("FreeBoardVo", freeboardVo);
	
		
			dataList.add(map);
		}
		
		return dataList;
	}
	
	public HashMap<String, Object> getFreeBoardData(int freeboardNo){
		HashMap<String , Object> map = new HashMap<String , Object>();
		
		FreeBoardVo freeboardVo = customerBoardSQLMapper.selectByNo(freeboardNo);
		int customerNo = freeboardVo.getCustomer_no();
		Customer customer = customerMainMapper.selectByNo(customerNo);
		
		ArrayList<FreeBoardImageVo> freeboardImageVo = customerBoardSQLMapper.selectFreeBoardImage(freeboardNo);
		
			
		map.put("FreeBoardVo", freeboardVo);
		map.put("Customer" , customer);
		map.put("freeboardImageVo", freeboardImageVo);	
		
			
		return map;
	}
	

	
	public void increaseCount(int freeboardNo) {
		customerBoardSQLMapper.increaseReadCount(freeboardNo);
	}
	
	
	public void deleteContent(int freeboardNo) {
		customerBoardSQLMapper.deleteByNo(freeboardNo);
	}
	

	public void updateTitleContent(FreeBoardVo freeboardVo ) {
		
		customerBoardSQLMapper.updateTitleContent(freeboardVo);
	}
	
	
	public ArrayList<HashMap<String, Object>> getCommentList(int comment_no) {
		ArrayList<HashMap<String, Object>> commentDataList = new ArrayList<HashMap<String, Object>>();
		ArrayList<CommentVo> commentList = customerBoardSQLMapper.selectCommentList();
		
		for(CommentVo commentVo : commentList) {
			int customerNo = commentVo.getCustomer_no();
			Customer customer = customerMainMapper.selectByNo(customerNo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("Customer", customer);
			map.put("CommentVo", commentVo);
			System.out.println(commentVo.getComment_writedate());
			System.out.println(commentVo.getComment_content());
			commentDataList.add(map);
		}
		
		return commentDataList;
		
	}
	
	
	public void writeComment(CommentVo commentVo) {
		
		customerBoardSQLMapper.insertComment(commentVo);
	}
	

	public void deleteComment(int commentNo) {
		customerBoardSQLMapper.deleteComment(commentNo);		
	}

	
	public void insertFreeBoardImage() {
		
	}
	
}






