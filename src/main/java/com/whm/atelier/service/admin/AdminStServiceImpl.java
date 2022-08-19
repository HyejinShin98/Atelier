package com.whm.atelier.service.admin;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whm.atelier.mapper.admin.AdminStMapper;
import com.whm.atelier.vo.Product;
import com.whm.atelier.vo.Store;

@Service
public class AdminStServiceImpl {
	
	@Autowired
	private AdminStMapper adminStMapper;
	
	public ArrayList<Store> selStore(){
		ArrayList<Store> storeList = adminStMapper.selectStore();
		
		return storeList;
	}
	
	public ArrayList<HashMap<String, Object>> selProduct(){
		
		ArrayList<HashMap<String, Object>> productList = new ArrayList<HashMap<String, Object>>();		
		ArrayList<Product> arr = adminStMapper.selectProduct();
		
		for (Product product: arr) {
			int storeNo = product.getStore_no();

			HashMap<String, Object> map = new HashMap<String,Object>();
			
			map.put("product", product);
			map.put("store", adminStMapper.selectByStoreNo(storeNo));
						
			productList.add(map);
			
		}
					
		return productList;
	}
	
}
