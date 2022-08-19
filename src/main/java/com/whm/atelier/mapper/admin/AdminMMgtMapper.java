package com.whm.atelier.mapper.admin;

import java.util.ArrayList;

import com.whm.atelier.vo.Consumer;
import com.whm.atelier.vo.Customer;

public interface AdminMMgtMapper {

	public ArrayList<Consumer> selectConsumer();
	public ArrayList<Customer> selectCustomer();

}
