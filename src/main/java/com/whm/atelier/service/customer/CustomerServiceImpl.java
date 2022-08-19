package com.whm.atelier.service.customer;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.whm.atelier.mapper.customer.CustomerMainMapper;
import com.whm.atelier.mapper.customer.CustomerOrderMapper;
import com.whm.atelier.vo.CenterBank;
import com.whm.atelier.vo.Customer;
import com.whm.atelier.vo.CustomerCenter;
import com.whm.atelier.vo.CustomerWallet;
import com.whm.atelier.vo.Product;
import com.whm.atelier.vo.ProductAsk;
import com.whm.atelier.vo.ProductImage;
import com.whm.atelier.vo.Review;
import com.whm.atelier.vo.Store;
import com.whm.atelier.vo.StoreTier;

@Service
public class CustomerServiceImpl {

	@Autowired
	private CustomerMainMapper customerMainMapper;
	@Autowired
	private CustomerOrderMapper customerOrderMapper;
	
	public Customer login(Customer param) {
		System.out.println("로그인 서비스");
		Customer customer = customerMainMapper.selectByIdAndPw(param);
		
		return customer;
	}
	
	public Customer checkIdData(String name) {

		return 	customerMainMapper.selectCheckId(name);
	}
	
	
	public void StoreNameAndProfile(Store store) {
		customerMainMapper.insertStoreNameAndProfile(store);
		
	}
	
	public Store storeNoSelect(int customerNo) {
		
		return customerMainMapper.selectStoreNo(customerNo);
	}
	
	

	public void productInsertData(Product product, ArrayList<ProductImage> image) {
		System.out.println("호출됨");
		int product_no = customerMainMapper.createProductPk();
		System.out.println(product_no);
		product.setProduct_no(product_no);
		
		customerMainMapper.insertProductProfile(product);
		
		
	
		 for(ProductImage productImage : image) {
		 productImage.setProduct_no(product_no);
		 System.out.println("productImage:"+  productImage);
		 customerMainMapper.insertProductImage(productImage);
		 
		  }
		 
	}
	
	

	
	public ArrayList<Product> productSelectData(int storeNo,int type){
		ArrayList<Product> temp = new ArrayList<Product>();
		for (Product p  :  customerMainMapper.selectMyProduct(storeNo, type)) {
			temp.add(p);
			
		}
		
		return temp;
	}
	
	public ArrayList<HashMap<String , Object>> productSearchData(int storeNo,int confirmNo, String productName, String productYn){
		ArrayList<HashMap<String , Object>> temp = new  ArrayList<HashMap<String,Object>>();
		for (Product p  :  customerMainMapper.searchMyProduct(storeNo, productName, confirmNo, productYn)) {
			HashMap<String, Object> map = new HashMap<String, Object>();
		
		
			map.put("Product", p);
			map.put("Review", customerMainMapper.selectReviewCount(p.getProduct_no()));
			map.put("Ask", 	customerMainMapper.selectAskByVo(p.getProduct_no()));
			map.put("Wish", customerOrderMapper.restSelectWish(p.getProduct_no()));
			map.put("Image", customerMainMapper.selectImageListYn(p.getProduct_no()));
			
			temp.add(map); 
			
		}
		
		return temp;
	}
	
	
	public HashMap<String, Object>  selectProductDetailData(int productNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<ProductImage> temp =  customerMainMapper.selectImageList(productNo);
		
	
		map.put("ProductImage", temp);
		map.put("Product",  customerMainMapper.selectProductDetail(productNo));
	
		return map;
	}
	

	
	public void updateStoreImageData(Store store) {

		customerMainMapper.updateStoreImage(store);
	
		
	}
	
	public void updateStoreProfile(Store store) {
		
		customerMainMapper.updateStoreProfile(store);
	}
	
	public void updateProductProfile(Product product) {
		
		customerMainMapper.updateProductProfile(product);
	}
	
	
	public void updateProductStatusStop(int productNo) {
		customerMainMapper.updateProductStatusStop(productNo);
	}

	public void updateProductStatusStart(int productNo) {
		customerMainMapper.updateProductStatusStart(productNo);
	}
	
	public void updateProductStatusYn(int productNo, String productStatusYn) {
		
		customerMainMapper.updateProductStatusYn(productNo, productStatusYn);
		
	}
	public StoreTier selectStoreTierData(int storeTierNo) {
		
		return customerMainMapper.selectTier(storeTierNo);
	}
	
	public ArrayList<Review>selectReviewTable(int productNo) {
		
		return customerMainMapper.selectReview(productNo);
	}
	
	
	public ArrayList<HashMap<String, Object>>selectReviewTablebAll(int storeNo) {
		
		ArrayList<HashMap<String, Object>> arrTemp = new ArrayList<HashMap<String,Object>>();
		
		
		for(Review re : customerMainMapper.selectReviewByStoreNo(storeNo)) {
		int temp = re.getOrder_no();
		HashMap<String , Object> map = new HashMap<String, Object>();
		
		
		ProductImage PI= customerMainMapper.selectImageListYn(customerMainMapper.selectOrder(temp).getProduct_no());
		
		
			
				map.put("Image", PI);
		
		
		System.out.println("결과값" +customerMainMapper.selectProductDetail(customerMainMapper.selectOrder(temp).getProduct_no()).getProduct_name());
		map.put("Review", re);
		map.put("Consumer", customerMainMapper.selectConsumer(re.getConsumer_no()));
		map.put("Product",customerMainMapper.selectProductDetail(customerMainMapper.selectOrder(temp).getProduct_no()));
		
		arrTemp.add(map);
		}
		return arrTemp;
	}
	
	public void  updateImageN(String pi_path, int productNo) {
		customerMainMapper.updateProductImageN(pi_path, productNo);
		
		
	}
	
	public ArrayList<ProductAsk>selectAskTable(int productNo) {
		
		return customerMainMapper.selectAsk(productNo);
	}
	
	
	public ArrayList<HashMap<String, Object>>selectAskTablebAll(int storeNo) {
		
		ArrayList<HashMap<String, Object>>out  = new ArrayList<HashMap<String,Object>>();
		for(Product pd : customerMainMapper.selectProductByNo(storeNo)) {
			HashMap<String, Object> innerTemp = new HashMap<String, Object>();

			ArrayList<HashMap<String, Object>> inner = new ArrayList<HashMap<String,Object>>();
			for(ProductAsk pa : customerMainMapper.selectAsk(pd.getProduct_no())) {
				HashMap<String, Object> temp = new HashMap<String, Object>();
				
				String pattern = "yyyy-MM-dd";
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
				
				String date = simpleDateFormat.format(pa.getProduct_ask_writedate());
				
				temp.put("productAsk", pa);
				temp.put("date", date);
				temp.put("consumer", customerMainMapper.selectConsumer(pa.getConsumer_no()));
				
				temp.put("product", customerMainMapper.selectProductDetail(pa.getProduct_no()));
				
				inner.add(temp);
			}
			
			innerTemp.put("inner", inner);
			out.add(innerTemp);
		}
		
		return out;
	}
	
	//내 계좌정보 확인
	public CustomerWallet selectWalletData(int customerNo) {
		
		
		return customerMainMapper.selectMyWallet(customerNo); 
	}
	
	//중앙뱅크 연결 
	public CenterBank selectBankData(int customerWalletNo) {
		
		
		return customerMainMapper.selectBank(customerWalletNo); 
	}
	
	//판매자가 문의 글 쓰기
	
	public void writeCustomerQna(CustomerCenter customerCenter) {
		customerMainMapper.insertCustomerQna(customerCenter);
	}
	
	//판매자가 자신의 문의 리스트 보기
	
	public ArrayList<CustomerCenter> getCusAskList(int customerNo){
		ArrayList<CustomerCenter> temp = new ArrayList<CustomerCenter>();
		for(CustomerCenter customer : customerMainMapper.selectCusAskList(customerNo)) {
			temp.add(customer);
		}
	
		return temp;
	}
	
	//판매자가 자신의 문의 자세히 보기
	public HashMap<String, Object> getCusAskDetail(int cusCenterNo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		CustomerCenter customerCenter = customerMainMapper.selectCusAskDetail(cusCenterNo);
		int adminNo = customerCenter.getAdmin_no();
		
		
		map.put("customerCenter", customerCenter);
		
		
		return map;
	}
	
	//판매자가 자신의 문의 삭제하기
	
	public void deleteCustomerAsk(int cusCenterNo) {
		customerMainMapper.deleteCusAsk(cusCenterNo);
	}
	
	//지갑정보추가
	public void insertAccontData(int customerNo, String account, String bank) {
		
		customerMainMapper.insertCustomerWallet(customerNo, account, bank);
	}
	
	public void insertBankData(int walletNo) {
		customerMainMapper.insertBank(walletNo);
	}
	
	public void updateAccountData(int customerNo, String account, String bank) {
		
		
		customerMainMapper.updateCustomerWallet(customerNo, account, bank);
	}
	
	public void updateProductImage(String a) {
		System.out.println("service"+a);
		customerMainMapper.updateProductImage(a);
	}
	
	public Review reviewSelectStoreNo(int store_no) {
		
		return customerMainMapper.selectReviewStoreNo(store_no);
	}
	
public HashMap<String, Object> reviewSelectVo(int productNo, int consumerNo) {
		
	String pattern = "yyyy-MM-dd";
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
	
	String date = simpleDateFormat.format(customerMainMapper.selectReviewVo(productNo,consumerNo).getReview_writedate());
	Review re = customerMainMapper.selectReviewVo(productNo, consumerNo);
	HashMap<String, Object> map = new HashMap<String, Object>();
	map.put("Consumer", customerMainMapper.selectConsumer(re.getConsumer_no()));
	map.put("Review", re);
	map.put("date", date);
		return map;
	}
}
