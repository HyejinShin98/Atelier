package com.whm.atelier.controller.customer;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.whm.atelier.service.customer.CustomerIncomeServiceImpl;
import com.whm.atelier.service.customer.CustomerOrderServiceImpl;
import com.whm.atelier.service.customer.CustomerOtherServiceImpl;
import com.whm.atelier.service.customer.CustomerServiceImpl;
import com.whm.atelier.vo.Customer;
import com.whm.atelier.vo.Product;
import com.whm.atelier.vo.ProductImage;
import com.whm.atelier.vo.Store;

@RestController
@RequestMapping("/customer/*")
public class RestCustomerMainController {

	@Autowired
	private CustomerServiceImpl customerservice;
	@Autowired
	private CustomerOrderServiceImpl customerOrderService;
	@Autowired
	private CustomerOtherServiceImpl customerOther;
	@Autowired
	private CustomerIncomeServiceImpl customerIncome;
	
	//id 중복확인
	@RequestMapping()
	public HashMap<String, Object>checkId(String name){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("name", customerservice.checkIdData(name));
		return map;
	}
	
	
	//내 상품 T 출력
	@RequestMapping("productTable")
	public HashMap<String , Object> productTable(HttpSession session, @RequestParam(value = "type", defaultValue = "4")int type,
			@RequestParam(value = "productName", defaultValue = "") String productName, @RequestParam(value = "productYn", defaultValue = "") String productYn){
		System.out.println("myProduct 상품 호출");
	
		
		Store store =customerservice.storeNoSelect(((Customer) session.getAttribute("customer")).getCustomer_no());
	
		
		
		HashMap<String, Object>hash = new HashMap<String, Object>();
		hash.put("number",type);
		hash.put("Yn",productYn);
		hash.put("data", customerservice.productSearchData(store.getStore_no(),type, productName,productYn));
		
	return hash;	
	}
	
	
	//상품일시정지-정상 변경
	@RequestMapping("updateProductStatus")
	public void updateProductStatus(int productNo, String productYn) {
		System.out.println("rest호출");
		System.out.println("rest 넘버값" +productNo);
		System.out.println("문자값" +productYn);
		
		
			customerservice.updateProductStatusYn(productNo, productYn);
	
	}
	//상품등록
	@RequestMapping("productModifyProcess")
	public void productModifyProcess(HttpSession session,Product formData, MultipartFile[] productFile){
		//

	 
	
		
		ArrayList<ProductImage> productimageList = new ArrayList<ProductImage>();  
		
		for(MultipartFile file : productFile) {
			
			if(file.isEmpty()) {
				System.out.println("값이 없습니다...");
				continue;
			}
			
			String rootFilePath = "/uploadFiles/";			
			
			String originalFilename = file.getOriginalFilename();
			
			//저장할때 파일명을 중복배제 해야된다.
			//랜덤네임 + 시간 = 파일명 만듬
			String randomName = UUID.randomUUID().toString();
			randomName += "_" + System.currentTimeMillis();
			
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			randomName += ext;
			
			//오늘 날짜 기준으로 폴더 생성...
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
			String todayFolderName = sdf.format(today);
			
			
			File todayFolder = new File(rootFilePath + todayFolderName);
			if(!todayFolder.exists()) {
				todayFolder.mkdirs();
			}
			
			try {
				//실질적 저장 API...
				file.transferTo(new File(rootFilePath + todayFolderName + randomName));
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			//데이터 구성...
			ProductImage image  = new ProductImage();  
			image.setPi_path(todayFolderName + randomName);
			image.setPi_original_filename(originalFilename);
			
			productimageList.add(image);
			
		}
		

		formData.setStore_no(customerservice.storeNoSelect(((Customer)session.getAttribute("customer")).getCustomer_no()).getStore_no());
		System.out.println("확인 : " + formData);
		
		customerservice.productInsertData(formData, productimageList);
		
		
	}
	
	
	
	
	
	
	//상품상새
	@RequestMapping("productDetailProcess")
	public HashMap<String, Object> productDetailProcess(HttpSession session, int productNo, Model model){
		
			//model.addAttribute("detail", customerservice.selectProductDetailData(productNo));
			HashMap<String , Object> map = new HashMap<String, Object>();
			map.put("DetailData",  customerservice.selectProductDetailData(productNo));
			return map;
	}
	
	
	
	//
	@RequestMapping("test")
	public HashMap<String, Object> test(HttpSession session, int productNo){
		System.out.println(productNo);
			session.setAttribute("datt", productNo);
			//model.addAttribute("detail", customerservice.selectProductDetailData(productNo));
			HashMap<String , Object> map = new HashMap<String, Object>();
			map.put("dat",  customerservice.selectProductDetailData(productNo));
			return map;
	}
	
	
	//주문상태별로보기
	@RequestMapping("OrderStatus")
	public HashMap<String, Object> OrderStatus(HttpSession session,  String orderStatus){
		
			System.out.println("REST응답받음");
			HashMap<String , Object> map = new HashMap<String, Object>();
			
			Store temp = customerservice.storeNoSelect(((Customer) session.getAttribute("customer")).getCustomer_no());
			
			 
			map.put("temp", temp);
			map.put("restOrderTotal", customerOrderService.RestTotalOrderListData(temp.getStore_no(),orderStatus));
			return map;
	}
	
	//리뷰상세보기
		@RequestMapping("detailReview")
		public HashMap<String, Object> detailReview(int productNo, int consumerNo){
			
				System.out.println("REST응답받음");
				HashMap<String , Object> map = new HashMap<String, Object>();
				
				
				
				map.put("review", customerservice.reviewSelectVo(productNo, consumerNo));
				return map;
		}
		
	//주문상세보기
	@RequestMapping("detailOrder")
	public HashMap<String, Object> detailOrder(int orderNo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("detail", customerOrderService.detailOrderData(orderNo));
		
		return map;
		
	}
	
	
	
	//내계좌관리페이지보기
	@RequestMapping("payPage")
	public HashMap<String, Object> payPage(int customerNo){
		System.out.println("restController" +customerNo );
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("customerWallet", customerservice.selectWalletData(customerNo));
		
		if(customerservice.selectWalletData(customerNo) != null) {
			map.put("centerBank", customerservice.selectBankData( customerservice.selectWalletData(customerNo).getCustomer_wallet_no()));
		}
		
		map.put("fail", "계좌를 등록해주세요.");
		return map;
		
	}
	
	//계좌등록
	@RequestMapping("insertAccount")
	public HashMap<String, Object> insertAccount(int customerNo, String account, String bank){
	
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		customerservice.insertAccontData(customerNo, account, bank);
		customerservice.selectWalletData(customerNo);
		 
		  map.put("fail", "알 수 없는 이유로 실패..");
		  map.put("wallet", customerservice.selectWalletData(customerNo));
		return map;
		
	}
	
	//뱅크 자동 등록
	@RequestMapping("insertBank")
	public HashMap<String, Object> insertBank(int walletNo){
	
		customerservice.insertBankData(walletNo);
		HashMap<String, Object> map = new HashMap<String, Object>();
	
		  map.put("fail", "알 수 없는 이유로 실패..");
		 
		  
		return map;
		
	}
	
	
	//계좌수정
	@RequestMapping("updateAccount")
	public HashMap<String, Object> updateAccount(int customerNo, String account, String bank){
	
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		customerservice.updateAccountData(customerNo, account, bank);
	
		 
		  map.put("fail", "알 수 없는 이유로 실패..");
		  
		return map;
		
	}
	//스토어 이미지 
		@RequestMapping("storeImage")
		public HashMap<String, Object> storeImage(HttpSession session, int storeNo,  MultipartFile[] file){
			 
				System.out.println(file[0]);
		
		
				System.out.println("실행되나요?");
			
			
				String rootFilePath = "/uploadFiles/";			
				
				String originalFilename = file[0].getOriginalFilename();
				
				//저장할때 파일명을 중복배제 해야된다.
				//랜덤네임 + 시간 = 파일명 만듬
				String randomName = UUID.randomUUID().toString();
				randomName += "_" + System.currentTimeMillis();
				
				String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
				randomName += ext;
				
				//오늘 날짜 기준으로 폴더 생성...
				Date today = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
				String todayFolderName = sdf.format(today);
				
				System.out.println("test 1:" + rootFilePath + todayFolderName);
				
				File todayFolder = new File(rootFilePath + todayFolderName);
				if(!todayFolder.exists()) {
					System.out.println("test 2:" + todayFolder.mkdirs()); 
				}
				
				try {
					//실질적 저장 API...
					file[0].transferTo(new File(rootFilePath + todayFolderName + randomName));
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				//데이터 구성...
				Store store  = new Store();  
				store.setStore_img(todayFolderName + randomName);
				store.setStore_no(storeNo);
				customerservice.updateStoreImageData(store);
				HashMap<String , Object> map = new HashMap<String, Object>();

				map.put("Store",  customerservice.storeNoSelect(((Customer)session.getAttribute("customer")).getCustomer_no()));
			
				
			
			return map;

				
		}
		
		
		
		
		@RequestMapping("rankStatus")
		public HashMap<String, Object>rankStatus(int amount, HttpSession session){
		System.out.println(amount);
			
		int customerNo = ((Customer) session.getAttribute("customer")).getCustomer_no(); 
		int a6=6;
		int a4=4;
		int a3=3;
		int a2=2;
		int a1=1;
		  if(amount>=5000000 ) {
		  customerOther.updateStoreTierData(a4,customerNo);
		  System.out.println("백금트로피승급/유지"); }else if(amount>=1000000 &&amount<5000000) {
			  customerOther.updateStoreTierData(a3,customerNo);
		  System.out.println("골드트로피승급/유지"); }else
		  if(amount>=500000 &&
			 amount<1000000) {
			  customerOther.updateStoreTierData(a2,customerNo);
		  System.out.println("실버트로피승급/유지"); }else
		  if(amount>=100000 &&
			amount<500000){
			  customerOther.updateStoreTierData(a1,customerNo);
		  System.out.println("브론즈트로피승급/유지");
		  
		  }else { 
			  customerOther.updateStoreTierData(a6,customerNo);
			  System.out.println("노답ㄴ"); }
		  
		  
		
		HashMap<String, Object> map = new HashMap<String, Object>();
			
			return map;
			
		}
		
		
	
	
	@RequestMapping("test11")
	public HashMap<String, Object>test11(Customer account){
	
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println(account);
		System.out.println(account.getCustomer_no());
		System.out.println(account.getCustomer_id());  
		return map;
		
	}
	

	@RequestMapping("income")
	public HashMap<String, Object> income(int storeNo) {
		//스토어 넘버로 프로덕트를 검색하고 해당 프로덕트 넘버가 있는 오더 상품 전체 검색, 그리고 날짜별로 또 구분해야함.
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		System.out.println("rest 접근"+ storeNo);
		map.put("fail", "실패");
		map.put("income", customerIncome.incomeData(storeNo));  
		
		return map;
	}
}
