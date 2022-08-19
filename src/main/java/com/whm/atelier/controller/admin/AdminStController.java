package com.whm.atelier.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.whm.atelier.service.admin.AdminServiceImpl;
import com.whm.atelier.service.admin.AdminStServiceImpl;
import com.whm.atelier.vo.Product;
import com.whm.atelier.vo.Store;

@Controller
@RequestMapping("/admin/st/*")
public class AdminStController {
	
	@Autowired
	private AdminStServiceImpl adminStService;	
	
	@RequestMapping("storeList")
	public String storeList(Model model) {
		
		ArrayList<Store> StoreList = adminStService.selStore();		
		model.addAttribute("storeList", StoreList);
		
		return "/admin/st/storeList";
	}
	
	@RequestMapping("productList")
	public String productList(Model model) {
		
		ArrayList<HashMap<String,Object>> productList = adminStService.selProduct();
		model.addAttribute("productList", productList);
		
		return "/admin/st/productList";
	}
	
}
