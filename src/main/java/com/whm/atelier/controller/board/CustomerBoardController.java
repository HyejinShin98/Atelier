package com.whm.atelier.controller.board;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.whm.atelier.service.board.CustomerBoardServiceImpl;
import com.whm.atelier.vo.CommentVo;
import com.whm.atelier.vo.Customer;
import com.whm.atelier.vo.FreeBoardImageVo;
import com.whm.atelier.vo.FreeBoardVo;

@Controller
@RequestMapping("/customer/fb/*")
public class CustomerBoardController {
	
	
	@Autowired
	private CustomerBoardServiceImpl customerBoardService;
	
	@RequestMapping("mainContent")
	public String mainContent(Model model) {
		
		ArrayList<HashMap<String, Object>> dataList = customerBoardService.getCustomerBoardDataList();	
		model.addAttribute("dataList", dataList);
	
		
		return "customer/fb/mainContent";
		
		
	}

	@RequestMapping("writeContent")
	public String writeContent(Model model, HttpSession session) {
		Customer customer = (Customer) session.getAttribute("customer");
		
		
		model.addAttribute("customer", customer);
		return "customer/fb/writeContent";
	}

	@RequestMapping("writeContentProcess")
	public String writeContentProcess(FreeBoardVo param , HttpSession session, MultipartFile [] files) {

		ArrayList<FreeBoardImageVo> freeboardImageList = new ArrayList<FreeBoardImageVo>();
		
		for(MultipartFile file : files) {
			
			if(file.isEmpty()) {
				continue;
			}
		
		String rootFilePath = "/uploadFiles/";
		

			
		String originalFilename = file.getOriginalFilename();
		
		String randomName = UUID.randomUUID().toString();
		randomName += "_" + System.currentTimeMillis();
		
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		randomName += ext;
		
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
		String todayFolderName = sdf.format(today);
		
		
		File todayFolder = new File(rootFilePath + todayFolderName);
		if(!todayFolder.exists()) {
			todayFolder.mkdirs();
		}
		
		try {
		
			file.transferTo(new File(rootFilePath + todayFolderName + randomName));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
			
		FreeBoardImageVo freeboardImageVo = new FreeBoardImageVo();  
		freeboardImageVo.setFreeboardimage_link(todayFolderName + randomName);
		freeboardImageVo.setFreeboardimage_origin_filename(todayFolderName);
		
		freeboardImageList.add(freeboardImageVo);

		}
		
		
		Customer customer = (Customer)session.getAttribute("customer");

		int customerNo  = customer.getCustomer_no();
		
		param.setCustomer_no(customerNo);
		
		
		
		
		customerBoardService.writeContent(param , freeboardImageList);
		
		
				
		return "redirect:./mainContent";
		
		
	}

	@RequestMapping("readContent")
	public String readContent(int freeboard_no , Model model) {
		
		customerBoardService.increaseCount(freeboard_no);
		HashMap<String, Object> data = customerBoardService.getFreeBoardData(freeboard_no);
		ArrayList<HashMap<String, Object>> commentDataList = customerBoardService.getCommentList(freeboard_no);
		
		
		FreeBoardVo freeboardVo = (FreeBoardVo)data.get("FreeBoardVo");
		String content = freeboardVo.getFreeboard_content(); 
		content = StringEscapeUtils.escapeHtml4(content);
		content = content.replaceAll(" ", "&nbsp;");
		content = content.replaceAll("\n", "<br>");
		freeboardVo.setFreeboard_content(content);
		
		model.addAttribute("data", data);
		model.addAttribute("datas", commentDataList);
		
		
		

		
		return "customer/fb/readContent";
	}

	@RequestMapping("deleteContentProcess")
	public String deleteContentProcess(int freeboard_no) {
		
		customerBoardService.deleteContent(freeboard_no);
		
		
		return "redirect:./mainContent";
	}
	
	@RequestMapping("updateContent")
	public String updateContent(int freeboard_no , Model model) {
		
		HashMap<String, Object> data = customerBoardService.getFreeBoardData(freeboard_no);
		model.addAttribute("data", data);
		
		return "customer/fb/updateContent";
		
	}
	
	@RequestMapping("updateContentProcess")
	public String updateContentProcess(FreeBoardVo param) {
		customerBoardService.updateTitleContent(param);
		
		return  "redirect:./mainContent";
	}
	
	
	
	
	@RequestMapping("writeComment")
	public String writeComment(int freeboard_no ,CommentVo param,  HttpSession session){
		Customer customer  = (Customer)session.getAttribute("customer");
		int customerNo = customer.getCustomer_no();
		param.setCustomer_no(customerNo);
		customerBoardService.writeComment(param);
		
		
		return "redirect:../fb/readContent?freeboard_no=" + freeboard_no;	
	}
	
	@RequestMapping("deleteComment")
	public String deleteComment(int comment_no) {
		
		customerBoardService.deleteComment(comment_no);
		
		
		return "redirect:./mainContent";
	}
	

}














