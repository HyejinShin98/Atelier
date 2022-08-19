package com.whm.atelier.controller.rent;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.whm.atelier.service.rent.RentServiceImpl;
import com.whm.atelier.vo.RentAtelierGroupApplication;
import com.whm.atelier.vo.RentGroupGrade;

@RestController
@RequestMapping("customer/rent/*")
public class RentRestContoller {
	
	@Autowired
	RentServiceImpl rentService;
	
	@RequestMapping("AjconfirmGroupProcess")
	public HashMap<String, Object> confirmGroupProcess(int rent_group_app_no , int customer_no) {	
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		RentAtelierGroupApplication rentAtelierGroupApplication= new RentAtelierGroupApplication();
		
		rentAtelierGroupApplication.setRent_atelier_no(rent_group_app_no);
		rentAtelierGroupApplication.setCustomer_no(customer_no);
		
		rentService.rentGroupConfirm(rentAtelierGroupApplication);
		
		map.put("result","sucess");
		
		return map;
	}
	
	@RequestMapping("WriteRgaProcess")
	public HashMap<String, Object> WriteRgaProcess(HttpSession session, RentAtelierGroupApplication param){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		session.setAttribute("atelierNo", param.getRent_atelier_no());
		session.setAttribute("customerNo", param.getCustomer_no() );
		
		rentService.WriteGroupApp(param);
		
		map.put("result", "success");		
		
		return map;
	}
	
	@RequestMapping("RgaList")
	public HashMap<String, Object> RgaList(int rentAtelierNo){		
		
		HashMap<String, Object> ragList = new HashMap<String, Object>();
				
		ragList.put("result", "success");			
		ragList.put("appComm", rentService.selectRentGroupAppcomment(rentAtelierNo));
		
		return ragList;
	}
	
	
	@RequestMapping("AjRentCount")
	public HashMap<String, Object> AjRentCount(int rentAtelierNo) {
		
		HashMap<String, Object> AjCount = new HashMap<String, Object>();
		
		AjCount.put("result", "success");
		AjCount.put("CfCount",rentService.rentGroupCount(rentAtelierNo));
		
		return AjCount;
	}
	
	@RequestMapping("AjConfirmedList")
	public HashMap<String, Object> AjConfirmedList(int rentAtelierNo){		
		
		HashMap<String, Object> AjCfList = new HashMap<String, Object>();
		
		AjCfList.put("result","success");
		AjCfList.put("cfList", rentService.selectedCustomer(rentAtelierNo));
		
		
		return AjCfList;
	}
	
	
	@RequestMapping("AjAppCount")
	public HashMap<String,Object> AjAppCount(int rentAtelierNo){
		
		HashMap<String,Object> appTemp = new HashMap<String,Object>();
		
		appTemp.put("result","success");
		appTemp.put("appCount",rentService.countGroupApp(rentAtelierNo));
		
		return appTemp;
	}
	
	@RequestMapping("myGroupEvaluate")
	public HashMap<String,Object> myGroupEvaluate(int rentAtelierNo,HttpSession session){
				
		HashMap<String,Object> myListEval = new HashMap<String,Object>();
		
		myListEval.put("result", "success");
		myListEval.put("myList", rentService.GroupByMe(rentAtelierNo, session));
		
		return myListEval;
	}
	
	@RequestMapping("groupReviewProcess")
	public HashMap<String,Object> groupReviewProcess(HttpSession session , RentGroupGrade param){
		
		HashMap<String,Object> gRP = new HashMap<String,Object>();
		
		session.setAttribute("atelierNo", param.getRent_atelier_no());
		session.setAttribute("customerNo", param.getEvaluated_customer_no());
		
		gRP.put("result","success");
		
		rentService.writeReview(param);
		
		return gRP;
	}
	
	@RequestMapping("viewManner")
	public HashMap<String,Object> viewManner(int customerNo){
		
		HashMap<String,Object> mannerCount = new HashMap<String,Object>();
		
		mannerCount.put("result","success");
		mannerCount.put("viewManner", rentService.customerMannerGrade(customerNo));
		
		return mannerCount;
		
		
	}
	
	
}



