package com.whm.atelier.mapper.customer;

import java.util.ArrayList;
import java.util.Map;


import com.whm.atelier.vo.Order;
import com.whm.atelier.vo.Product;

public interface CustomerIncomeMapper {

	public ArrayList<Product>selectProduct(int storeNo);
	
	public ArrayList<Order>selectOrder(int productNo); 

	
	
	public int selectSumOrder(int productNo);
	
	public ArrayList<Order>selectMonthOrderToday(int productNo);
	
	public ArrayList<Order>selectMonthOrder(int productNo);

	
	public int selectMonthOrderTodaySum(int productNo);
	
	public int selectMonthOrderSum(int productNo);
	
	public String selectTodayMonth();

	public String selectTodayYear();
	
	public  ArrayList<Map<String, Object>> selectMap(int storeNo);
}
