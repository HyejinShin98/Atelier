package com.whm.atelier.mapper.board;

import java.util.ArrayList;

import com.whm.atelier.vo.CommentVo;
import com.whm.atelier.vo.FreeBoardImageVo;
import com.whm.atelier.vo.FreeBoardVo;


public interface CustomerBoardSQLMapper {
	
	public int createFreeBoardPk();
	
	
	public void insertBoard(FreeBoardVo freeboardVo);
	public ArrayList<FreeBoardVo> selectAll();
	public FreeBoardVo selectByNo(int freeboardNo);
	public void increaseReadCount(int freeboardNo);
	public void deleteByNo(int freeboardNo);
	public void updateTitleContent(FreeBoardVo freeboardVo);
	
	
	public void insertFreeBoardImage (FreeBoardImageVo freeboardImageVo);
	public ArrayList<FreeBoardImageVo> selectFreeBoardImage(int freeboardNo);
	
	public void insertComment(CommentVo commentVo);
	public ArrayList<CommentVo> selectCommentList();
	public void deleteComment(int commentNo);
	
}
