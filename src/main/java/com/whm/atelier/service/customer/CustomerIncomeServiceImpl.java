package com.whm.atelier.service.customer;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whm.atelier.mapper.customer.CustomerIncomeMapper;

import com.whm.atelier.vo.Product;



@Service
public class CustomerIncomeServiceImpl {

	@Autowired
	private CustomerIncomeMapper customerIncomeMapper;
	
	public HashMap<String , Object>incomeData(int storeNo){
		HashMap<String , Object> finalMap =new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		int productHap=0;
		int lastProductHap=0;
		int postHap=0;
		int lastPostHap =0;
		ArrayList<Product> listttt = customerIncomeMapper.selectProduct(storeNo);
		
		for(Product p : listttt) {
			HashMap<String , Object> map = new HashMap<String, Object>();
				
			
				map.put("lastMonth", customerIncomeMapper.selectMonthOrderToday(p.getProduct_no()));
				map.put("month", customerIncomeMapper.selectMonthOrder(p.getProduct_no()));
				
				
				productHap += p.getProduct_price() *  (customerIncomeMapper.selectMonthOrderSum(p.getProduct_no()));
				lastProductHap += p.getProduct_price() *   customerIncomeMapper.selectMonthOrderTodaySum(p.getProduct_no());
				
				postHap += p.getProduct_post_price() *  (customerIncomeMapper.selectMonthOrderSum(p.getProduct_no()));
				lastPostHap += p.getProduct_post_price() *    customerIncomeMapper.selectMonthOrderTodaySum(p.getProduct_no());
				
				list.add(map);
		}
		int sub = 0;
		int postSub =0;
		if((productHap-lastProductHap) >0) {
			 sub = (productHap-lastProductHap);
			
		}else {
			 sub = (productHap-lastProductHap) * -1;
		}
		
		
		if((postHap-lastPostHap) >0) {
			postSub = (postHap-lastPostHap);
			
		}else {
			postSub = (postHap-lastPostHap) * -1;
		}
		System.out.println("lastProductHap"+lastProductHap);
		finalMap.put("List", list);
		finalMap.put("productHap", productHap);
		finalMap.put("lastProductHap", lastProductHap);
		finalMap.put("postHap", postHap);
		finalMap.put("lastProductHap", lastProductHap);
		finalMap.put("todayMonth", customerIncomeMapper.selectTodayMonth());
		finalMap.put("todayYear", customerIncomeMapper.selectTodayYear());
		finalMap.put("sub", sub);
		finalMap.put("postSub", postSub);
		return finalMap;
	}
	
	public HashMap<String, Object> incomeData2(int storeNo){
		//목표 ...쿼리의 활용으로 위의 incomeData보다 크기를 줄이고 효율적인 처리가 목표.
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("map",  customerIncomeMapper.selectMap(storeNo));
		return map;
	}
	
	
	
	
}
