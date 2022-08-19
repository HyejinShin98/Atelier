package com.whm.atelier.service.admin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whm.atelier.mapper.admin.AdminMMgtMapper;
import com.whm.atelier.vo.Consumer;
import com.whm.atelier.vo.Customer;

@Service
public class AdminMMgtServiceImpl {
	
	@Autowired
	private AdminMMgtMapper adminMMgtMapper;
	
	public ArrayList<Consumer> selectcon(){
		ArrayList<Consumer> conList = adminMMgtMapper.selectConsumer();
		
		return conList;
	}
	
	public ArrayList<Customer> selectcus(){
		
		ArrayList<Customer> cusList = adminMMgtMapper.selectCustomer();
		
		return cusList;
	}
	
}
