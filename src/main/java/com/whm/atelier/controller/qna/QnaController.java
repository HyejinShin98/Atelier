package com.whm.atelier.controller.qna;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.whm.atelier.service.qna.QnaServiceImpl;
import com.whm.atelier.vo.Admin;
import com.whm.atelier.vo.Consumer;
import com.whm.atelier.vo.ConsumerCenter;
import com.whm.atelier.vo.Customer;
import com.whm.atelier.vo.CustomerCenter;

@Controller
public class QnaController {
	
	@Autowired
	private QnaServiceImpl qnaService;
		
	@RequestMapping("consumer/sv/askWrite")
	public String ConsumerQnaWrite() {
	
		return "consumer/sv/askWrite";
	}
	
	@RequestMapping("consumer/sv/askWriteProcess")
	public String askWriteProcess(ConsumerCenter param, HttpSession session) {
		Consumer sessionUser = (Consumer)session.getAttribute("consumer");
		int consumerNo = sessionUser.getConsumer_no();
		
		param.setConsumer_no(consumerNo);
		
		qnaService.writeConsumerQna(param);
		
		return "redirect: ./myAskList";
	}
	
	@RequestMapping("consumer/sv/myAskList")
	public String myasklist(HttpSession session, Model model) {
		model.addAttribute("qna", qnaService.getAskList(((Consumer)session.getAttribute("consumer")).getConsumer_no()));
		
		return "consumer/sv/myAskList";
		
	}
	
	@RequestMapping("consumer/sv/myAskDetail")
	public String myAskDetail(int conCenterNo, Model model) {
		HashMap<String, Object> askData = qnaService.getAskDetail(conCenterNo);
		
		//ConsumerCenter consumerCenter = (ConsumerCenter)askData.get("ConsumerCenter");
		//String askContent = consumerCenter.getCon_center_content();
		//askContent = StringEscapeUtils.escapeHtml4(askContent);
		//askContent = askContent.replaceAll(" ", "&nbsp;");
		//askContent = askContent.replaceAll("\n", "<br>");
		//consumerCenter.setCon_center_content(askContent);
		//이거 개판임 누가 수정좀 ㅋㅋㅋ
		
		model.addAttribute("askData",askData);
		
		return "consumer/sv/myAskDetail";
	}
	
	@RequestMapping("consumer/sv/deleteMyAskProcess")
	public String deleteMyAskProcess(int conCenterNo) {
		
		qnaService.deleteConsumerAsk(conCenterNo);
		
		return "redirect: ./myAskList";
	}
	
	@RequestMapping("customer/ct/askWriteToAdmin")
	public String CustomerQnaWrite() {
		
		return "customer/ct/askWriteToAdmin";
	}
	
	@RequestMapping("customer/ct/CustomerQnaWriteProcess")
	public String CustomerQnaWriteProcess(CustomerCenter param, HttpSession session) {		
		Customer sessionUser = (Customer)session.getAttribute("customer");
		int customerNo = sessionUser.getCustomer_no();
		
		param.setCustomer_no(customerNo);
		
		qnaService.writeCustomerQna(param);
		
		return "redirect: ./askWriteToAdminList";
	}
	
	@RequestMapping("customer/ct/askWriteToAdminList")
	public String CustomerQnaWriteList(HttpSession session, Model model) {
		model.addAttribute("cusQna", qnaService.getCusAskList(((Customer)session.getAttribute("customer")).getCustomer_no()));	

		return "customer/ct/askWriteToAdminList";
	}
	
	@RequestMapping("customer/ct/askWriteToAdminDetail")
	public String CustomerQnaWriteDetail(int cusCenterNo, Model model) {
		HashMap<String,Object> cusAskData = qnaService.getCusAskDetail(cusCenterNo); 
		
		model.addAttribute("cusAskData", cusAskData);
		
		return "customer/ct/askWriteToAdminDetail";
	}
	
	@RequestMapping("customer/ct/deleteCustomerProcess")
	public String deleteCustomerProcess(int cusCenterNo) {
		
		qnaService.deleteCustomerAsk(cusCenterNo);
		
		return "redirect: ./askWriteToAdminList";
	}
	
	
	@RequestMapping("admin/ct/consumerAskList")
	public String ConsumerQnaList(Model model) {
		
		ArrayList<HashMap<String, Object>> conAskList = qnaService.getConAskList();
		model.addAttribute("conAskList", conAskList);
		
		return "admin/ct/consumerAskList";
	}
	
	@RequestMapping("admin/ct/consumerAskDetail")
	public String ConsumerQnaDetail(int conCenterNo, Model model) {
		
		HashMap<String, Object> conAskData = qnaService.getConAskDetail(conCenterNo);
		model.addAttribute("conAskData", conAskData);	
		
		return "admin/ct/consumerAskDetail";
	}
	
	@RequestMapping("admin/ct/consumerAskUpdate")
	public String ConsumerQnaUpdate(int conCenterNo, Model model , HttpSession session) {
		//문제생기면 이 구간 삭제
		Admin sessionUser = (Admin)session.getAttribute("admin");
		int adminNo = sessionUser.getAdmin_no();
		model.addAttribute(adminNo);
		
		HashMap<String, Object> UpAskData = qnaService.getConAskDetail(conCenterNo);
		model.addAttribute("upAskData", UpAskData);
		
		
		return "admin/ct/consumerAskUpdate";
	}
	
	@RequestMapping("admin/ct/consumerAskUpdateProcess")
	public String ConsumerQnaUpdateProcess(ConsumerCenter param, HttpSession session) {
		Admin sessionUser = (Admin)session.getAttribute("admin");
		int adminNo = sessionUser.getAdmin_no();
		
		param.setAdmin_no(adminNo);
		
		qnaService.UpdateConAskProcess(param);
		
		return "redirect: ./consumerAskList";
		
	}
	
	@RequestMapping("admin/ct/customerAskList")
	public String CustomerQnaList(Model model) {
		
		ArrayList<HashMap<String, Object>> adCusAskList = qnaService.getAdCusAskList();
		model.addAttribute("adCusAskList", adCusAskList);
		
		return "admin/ct/customerAskList";
	}
	
	@RequestMapping("admin/ct/customerAskDetail")
	public String CustomerQnaDetail(int cusCenterNo, Model model) {
		
		HashMap<String, Object> adCusAskData = qnaService.getAdCusAskDetail(cusCenterNo);
		model.addAttribute("adCusAskData", adCusAskData);
		
		return "admin/ct/customerAskDetail";
	}
	
	@RequestMapping("admin/ct/customerAskUpdate")
	public String CustomerQnaUpdate(int cusCenterNo, Model model, HttpSession session) {
		
		Admin sessionUser = (Admin)session.getAttribute("admin");
		int adminNo = sessionUser.getAdmin_no();
		model.addAttribute(adminNo);
		
		HashMap<String, Object> upCusData = qnaService.getAdCusAskDetail(cusCenterNo);
		model.addAttribute("upCusData", upCusData);
		
		return "admin/ct/customerAskUpdate";
	}
	
	@RequestMapping("admin/ct/customerAskUpdateProcess")
	public String CustomerQnaUpdateProcess(CustomerCenter param, HttpSession session) {
		
		Admin sessionUser= (Admin)session.getAttribute("admin");
		int adminNo = sessionUser.getAdmin_no();
		
		param.setAdmin_no(adminNo);
		
		qnaService.UpdateCusAskProcess(param);
		
		return "redirect: ./customerAskList";
	}
	
}

	

