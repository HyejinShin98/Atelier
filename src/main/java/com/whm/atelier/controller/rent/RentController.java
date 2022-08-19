package com.whm.atelier.controller.rent;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.whm.atelier.service.rent.RentServiceImpl;
import com.whm.atelier.vo.Customer;
import com.whm.atelier.vo.RentAtelier;
import com.whm.atelier.vo.RentAtelierGroupApplication;

@Controller
@RequestMapping("/customer/rent/*")
public class RentController {

	@Autowired
	private RentServiceImpl rentService;

	@RequestMapping("writeRentAtelier")
	public String RentAtelierWrite() {
		System.out.println("인식되나요");
		return "customer/rent/writeRentAtelier";
	}

	@RequestMapping("rentAtelierWriteProcess")
	public String RentAtelierWriteProcess(RentAtelier param, HttpSession session) {
		Customer sessionUser = (Customer)session.getAttribute("customer");
		int customerNo = sessionUser.getCustomer_no();
		
		param.setCustomer_no(customerNo);
		
		rentService.writeRentAtelier(param);
				
		return "redirect: ./rentAtelierList";
	}
	
	@RequestMapping("rentAtelierList")
	public String RentAtelierList(Model model) {
		
		ArrayList<HashMap<String,Object>> rentList = rentService.selectAtelierRentList();
		model.addAttribute("rentList", rentList);
		Date now = new Date();                      //추가
		model.addAttribute("date", now);  			//추가
		return "customer/rent/rentAtelierList";
	}
	
	@RequestMapping("rentAtelierDetail")
	public String RentAtelierDetail(@RequestParam(value = "rentAtelierNo", defaultValue ="0" )int rentAtelierNo, Model model, HttpSession session) {
		
		if(rentAtelierNo == 0) {
			 rentAtelierNo = (int) session.getAttribute("param");
		}
		
		Customer sessionCustomer = (Customer)session.getAttribute("customer");
		int customerNo = sessionCustomer.getCustomer_no();
		model.addAttribute(customerNo);
		
		ArrayList<HashMap<String, Object>> appComment = rentService.selectRentGroupAppcomment(rentAtelierNo);
		model.addAttribute("appComment", appComment);
			
		HashMap<String, Object> rentAtelierData = rentService.selectAtelierRentDetail(rentAtelierNo);	
		model.addAttribute("rentAtelierData", rentAtelierData);
		
		model.addAttribute("rentCount", rentService.rentGroupCount(rentAtelierNo));
		
		model.addAttribute("appCount", rentService.countGroupApp(rentAtelierNo));
		
		ArrayList<HashMap<String, Object>> selCus = rentService.selectedCustomer(rentAtelierNo);
		model.addAttribute("selCus", selCus);
		
		return "customer/rent/rentAtelierDetail";
	}
	
	@RequestMapping("rentAtelierProcess")
	public String DeleteRentAtelierProcess(int rentAtelierNo) {
		
		rentService.deleteRentAtelier(rentAtelierNo);
		
		return "redirect: ./rentAtelierList";
	}
	
	@RequestMapping("WriteRentGroupAppProcess")
	public String WriteRentGroupAppProcess(HttpSession session, RentAtelierGroupApplication param) {
				
		rentService.WriteGroupApp(param);
		session.setAttribute("param", param.getRent_atelier_no());
		return "redirect: ./rentAtelierDetail";
	}
		
	@RequestMapping("confirmGroupProcess")
	public String confirmGroupProcess(RentAtelierGroupApplication rentAtelierGroupApplication) {
		rentService.rentGroupConfirm(rentAtelierGroupApplication);
		
		return "redirect: ./rentAtelierList";
	}
	
	@RequestMapping("rentCustomerReview")
	public String rentCustomerReview(HttpSession session, Model model, int rentAtelierNo) {			
		
		Customer sessionCustomer = (Customer)session.getAttribute("customer");
		int customerNo = sessionCustomer.getCustomer_no();
		model.addAttribute(customerNo);
				
		ArrayList<HashMap<String, Object>> rAGA = rentService.selectRentGroupAppcomment(rentAtelierNo);
		model.addAttribute("rAGA", rAGA);
			
		HashMap<String, Object> rAD = rentService.selectAtelierRentDetail(rentAtelierNo);	
		model.addAttribute("rAD", rAD);		
		
		return "customer/rent/rentCustomerReview";
		
		
	}
	
}
