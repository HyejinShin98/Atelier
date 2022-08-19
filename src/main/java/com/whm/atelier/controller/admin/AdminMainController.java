package com.whm.atelier.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.whm.atelier.service.admin.AdminMMgtServiceImpl;
import com.whm.atelier.service.admin.AdminServiceImpl;
import com.whm.atelier.vo.Admin;
import com.whm.atelier.vo.Consumer;
import com.whm.atelier.vo.Coupon;
import com.whm.atelier.vo.Customer;
import com.whm.atelier.vo.Faq;
import com.whm.atelier.vo.Notice;

@Controller
@RequestMapping("/admin/*")
public class AdminMainController {
	
	@Autowired
	private AdminServiceImpl adminService;
	
	@Autowired
	private AdminMMgtServiceImpl adminMMgtService;
	
	@RequestMapping("m/main")
	public String main() {
		return "admin/m/main";
	}
	
	@RequestMapping("lg/login")
	public String login() {
		return "admin/lg/login";
	}
	
	@RequestMapping("lg/loginProcess")
	public String loginProcess(Admin param, HttpSession session) {
		Admin admin = adminService.login(param);
		if(admin == null) {
			return "common/loginFail";
		} else {
			session.setAttribute("admin", admin);
			return "redirect:../m/main";
		}
	}
	
	@RequestMapping("lg/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:../m/main";
	}
	
	@RequestMapping("mmgt/couponMain")
	public String couponMain(Model model) {
		ArrayList<Coupon> dataList = adminService.adminCouponList();
		model.addAttribute("dataList", dataList);
//		여기다가 HashMap넣어야된다
		return "admin/mmgt/couponMain";
	}    
	
	
	@RequestMapping("mmgt/createCoupon")	
	public String createCoupon() {
		return"admin/mmgt/createCoupon";
	}
	
	@RequestMapping("mmgt/createCouponProcess")
	public String createCouponProcess(Coupon coupon) {
			
		adminService.createCoupon(coupon);
		
		return"redirect:../mmgt/couponMain";
	}
	
	@RequestMapping("mmgt/deleteCouponProcess")
	public String deleteCouponProcess(int coupon_no) {
		adminService.couponDelete(coupon_no);
		
		return"redirect:../mmgt/couponMain";
	}
	
	@RequestMapping("mmgt/detailConsumer")
	public String detailConsumer(Model model, int consumer_no) {
		HashMap<String, Object> data = adminService.consumerData(consumer_no);
		model.addAttribute("data",data);
		return "admin/mmgt/detailConsumer";
	}	
	
	@RequestMapping("mmgt/totalGetPrice")
	public String totalGetPrice(Model model) {
		model.addAttribute("list", adminService.totalGetPrice());
		return "admin/mmgt/totalGetPrice";
	}
	
	//합친 부분
	//mmgt 통합
	
	@RequestMapping("mmgt/totalConsumerList")
	public String totalConsumerList(Model model) {
		
		ArrayList<Consumer> conList = adminMMgtService.selectcon();
		model.addAttribute("conList", conList);
		
		return "admin/mmgt/totalConsumerList";
	}
	
	
	@RequestMapping("mmgt/totalCustomerList")
	public String totalCustomerList(Model model){
		
		ArrayList<Customer> cusList = adminMMgtService.selectcus();
		model.addAttribute("cusList", cusList);
		
		return "admin/mmgt/totalCustomerList";
	}
	
	
	//공지사항
	@RequestMapping("nt/noticeList")
	public String noticeList(){
		return "admin/nt/noticeList";
	}
		
	@RequestMapping("nt/registNotice")
	public String registNotice() {
		return "admin/nt/registNotice";
	}
		
	@RequestMapping("nt/registNoticeProcess")
	public String registNoticeProcess(Notice param, HttpSession session) {
		Admin sessionUser = (Admin)session.getAttribute("sessionUserInfo");
		int admin_no = sessionUser.getAdmin_no();
			
		param.setAdmin_no(admin_no);
		adminService.registNotice(param);
			
		return "redirect:./main";
	}
		
	@RequestMapping("nt/updateNotice")
	public String updateNotice(int admin_no, Model model) {
			
		HashMap<String, Object> data = adminService.getAdminDataList(admin_no);
		model.addAttribute("data", data);
			
		return "admin/nt/updateNotice";
	}
		
	@RequestMapping("nt/updateNoticeProcess")
	public String updateNoticeProcess(Notice param) {
		adminService.updateNotice(param);
		return "redirect:./main";
	}
		
		
	@RequestMapping("nt/deleteNotice")
	public String deleteNotice(int admin_no) {
		adminService.deleteNotice(admin_no);
		return "redirect:./main";
	}
		
	//자주묻는질문
	@RequestMapping("ct/consumerFaqList")
	public String consumerFaqList(){
		return "admin/ct/consumerFaqList";
	}
		
	@RequestMapping("nt/consumerFaqUpdate")
	public String consumerFaqUpdate(int admin_faq_no, Model model) {
				
		HashMap<String, Object> faq = adminService.getAdminFaq(admin_faq_no);
		model.addAttribute("faq", faq);
			
		return "admin/ct/consumerFapUpdate";
	}
		
	@RequestMapping("ct/consumerFaqUpdateProcess")
	public String consumerFaqUpdateProcess(Faq param) {
		adminService.consumerFaqUpdate(param);
				
		return "redirect:./main";
	}
}
