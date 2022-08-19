package com.whm.atelier.mapper.rent;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.whm.atelier.vo.RentAtelier;
import com.whm.atelier.vo.RentAtelierGroupApplication;
import com.whm.atelier.vo.RentGroupGrade;

public interface RentMapper {

	public void insertRentAtelier(RentAtelier rentAtelier);
	public ArrayList<RentAtelier> selectRentAtelierList();
	public RentAtelier selectRentNo(int rentAtelierNo);
	public void deleteRentNo(int rentAtelierNo);
	public void insertGroupApp(RentAtelierGroupApplication rentAtelierGroupApplication);
	//댓글 선택 테이블
	public ArrayList<RentAtelierGroupApplication> selectAppComment(int rentAtelierNo);	
	public void confirmGroup(RentAtelierGroupApplication rentAtelierGroupApplication);
	public int countNop(int rentAtelierNo);
	public int countApp(int rentAtelierNo);
	public ArrayList<RentAtelierGroupApplication> applicatedCustomer(int rentAtelierNo);
	public ArrayList<RentAtelierGroupApplication> rentListByMe(int rentAtelierNo);
	public void insertGrade(RentGroupGrade rentGroupGrade);
	public RentGroupGrade selectGroupGrade(
			@Param ("customerNo") int customerNo,
			@Param ("rentAtelierNo") int rentAtelierNo,
			@Param ("eCNo") int eCNo
			);
	public ArrayList<RentAtelier> selectByAtlierNo(int rentAtlierNo);
	public Integer mannerCheck(int customerNo);
	
	public ArrayList<HashMap<String, Object>> meetingApplicationList();
	public ArrayList<RentAtelierGroupApplication> acceptedCustomer();


}
