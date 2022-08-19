package com.whm.atelier.mapper.qna;

import java.util.ArrayList;

import com.whm.atelier.vo.ConsumerCenter;
import com.whm.atelier.vo.CustomerCenter;

public interface QnaMapper {

	public void inserteConsumerQna(ConsumerCenter consumerCenter);
	public ArrayList<ConsumerCenter> selectMyAskList (int consumerNo);
	public ConsumerCenter selectAskDetail (int conCenterNo);
	public void deleteMyAsk (int conCenterNo);
	public void inserteCustomerQna(CustomerCenter customerCenter);
	public ArrayList<CustomerCenter> selectCusAskList (int customerNo);
	public CustomerCenter selectCusAskDetail (int cusCenterNo);
	public void deleteCusAsk (int cusCenterNo);
	public ArrayList<ConsumerCenter> selectConAskList();
	public ConsumerCenter selectConAskDetail(int conCenterNo);
	public void updateConAsk(ConsumerCenter consumerCenter);
	public ArrayList<CustomerCenter> selectAdCusAskList ();
	public CustomerCenter selectAdCusAskDetail(int cusCenterNo);	
	public void updateCusAsk(CustomerCenter customerCenter);
	
}
