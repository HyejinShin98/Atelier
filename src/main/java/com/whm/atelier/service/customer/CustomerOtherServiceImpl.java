package com.whm.atelier.service.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whm.atelier.mapper.customer.CustomerMainMapper;

@Service
public class CustomerOtherServiceImpl {
	@Autowired
	private CustomerMainMapper customerMainMapper;
	
	public void updateStoreTierData(int storeNo, int customerNo) {
		System.out.println("storeNo"+ storeNo);
		System.out.println("customerNo"+ customerNo);
		customerMainMapper.updateStoreTier(storeNo, customerNo );
		
	}
}
