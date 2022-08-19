package com.whm.atelier.service.qna;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whm.atelier.mapper.admin.AdminMainMapper;
import com.whm.atelier.mapper.consumer.ConsumerMainMapper;
import com.whm.atelier.mapper.customer.CustomerMainMapper;
import com.whm.atelier.mapper.qna.QnaMapper;
import com.whm.atelier.vo.Admin;
import com.whm.atelier.vo.Consumer;
import com.whm.atelier.vo.ConsumerCenter;
import com.whm.atelier.vo.Customer;
import com.whm.atelier.vo.CustomerCenter;

@Service
public class QnaServiceImpl {
	
	@Autowired
	private QnaMapper qnaMapper;
	@Autowired
	private AdminMainMapper adminMainMapper;
	@Autowired
	private ConsumerMainMapper consumerMainMapper;
	@Autowired
	private CustomerMainMapper customerMainMapper;
	
	//구매자가 문의글 쓰기
	public void writeConsumerQna(ConsumerCenter consumerCenter) {
		qnaMapper.inserteConsumerQna(consumerCenter);
	}
	
	//구매자가 자신의 문의글 리스트 보기
	
	public ArrayList<ConsumerCenter> getAskList(int consumerNo){
		ArrayList<ConsumerCenter> temp = new ArrayList<ConsumerCenter>();
		
		for(ConsumerCenter center : qnaMapper.selectMyAskList(consumerNo)) {
			temp.add(center);
		}	
		
		return temp;
	}
	
	//구매자가 자신의 문의글 보기
	
	public HashMap<String, Object> getAskDetail(int conCenterNo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ConsumerCenter consumerCenter = qnaMapper.selectAskDetail(conCenterNo);
		int adminNo = consumerCenter.getAdmin_no();
		Admin admin = adminMainMapper.selectByNo(adminNo);
		
		map.put("consumerCenter", consumerCenter);
		map.put("admin", admin);
		
		return map;
	}
	
	//구매자가 자신의 문의 글 삭제하기
	
	public void deleteConsumerAsk(int conCenterNo) {
		qnaMapper.deleteMyAsk(conCenterNo);
	}
	
	//판매자가 문의 글 쓰기
	
	public void writeCustomerQna(CustomerCenter customerCenter) {
		qnaMapper.inserteCustomerQna(customerCenter);
	}
	
	//판매자가 자신의 문의 리스트 보기
	
	public ArrayList<CustomerCenter> getCusAskList(int customerNo){
		ArrayList<CustomerCenter> temp = new ArrayList<CustomerCenter>();
		for(CustomerCenter customer : qnaMapper.selectCusAskList(customerNo)) {
			temp.add(customer);
		}
	
		return temp;
	}
	
	//판매자가 자신의 문의 자세히 보기
	public HashMap<String, Object> getCusAskDetail(int cusCenterNo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		CustomerCenter customerCenter = qnaMapper.selectCusAskDetail(cusCenterNo);
		int adminNo = customerCenter.getAdmin_no();
		Admin admin = adminMainMapper.selectByNo(adminNo);
		
		map.put("customerCenter", customerCenter);
		map.put("admin", admin);
		
		return map;
	}
	
	//판매자가 자신의 문의 삭제하기
	
	public void deleteCustomerAsk(int cusCenterNo) {
		qnaMapper.deleteCusAsk(cusCenterNo);
	}
	
	
	//관리자가 구매자 리스트 문의 보기
	public ArrayList<HashMap<String, Object>> getConAskList(){
		ArrayList<HashMap<String, Object>> conAskList = new ArrayList<HashMap<String, Object>>();
		ArrayList<ConsumerCenter> conCenList = qnaMapper.selectConAskList();
		
		for(ConsumerCenter consumerCenter : conCenList) {
			int ConsumerNo = consumerCenter.getConsumer_no();
			Consumer consumer = consumerMainMapper.selectByNo(ConsumerNo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("consumer", consumer);
			map.put("consumerCenter", consumerCenter);
			conAskList.add(map);
		}
		
		return conAskList;
	}
	
	//관리자가 구매자 문의글 자세히 보기(문의글 정보 가져오기)
	public HashMap<String, Object> getConAskDetail(int conCenterNo){
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		ConsumerCenter consumerCenter = qnaMapper.selectConAskDetail(conCenterNo);
		int consumerNo = consumerCenter.getConsumer_no();
		Consumer consumer = consumerMainMapper.selectByNo(consumerNo);
		int adminNo = consumerCenter.getAdmin_no();
		Admin admin = adminMainMapper.selectByNo(adminNo);
		map.put("consumer", consumer);
		map.put("consumerCenter", consumerCenter);
		map.put("admin", admin);
		
		return map;
				
	}
	
	//관리자가 구매자에게 답변 달기
	public void UpdateConAskProcess(ConsumerCenter consumerCenter) {
		qnaMapper.updateConAsk(consumerCenter);
	}
	
	//관리자가 판매자 문의 리스트 보기
	public ArrayList<HashMap<String, Object>> getAdCusAskList(){
		ArrayList<HashMap<String, Object>> adCusAskList = new ArrayList<HashMap<String, Object>>();
		ArrayList<CustomerCenter> cusCenList = qnaMapper.selectAdCusAskList();
		
		for(CustomerCenter customerCenter : cusCenList) {
			int CustomerNo = customerCenter.getCustomer_no();
			Customer customer = customerMainMapper.selectByNo(CustomerNo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("customer",customer);
			map.put("customerCenter", customerCenter);
			adCusAskList.add(map);			
		}
		
		return adCusAskList;
	}
	
	//관리자가 판매자 문의 자세히 보기
	public HashMap<String, Object> getAdCusAskDetail(int cusCenterNo){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		CustomerCenter customerCenter = qnaMapper.selectAdCusAskDetail(cusCenterNo);
		int customerNo = customerCenter.getCustomer_no();
		Customer customer = customerMainMapper.selectByNo(customerNo);
		int AdminNo = customerCenter.getAdmin_no();
		Admin admin = adminMainMapper.selectByNo(AdminNo);
		
		map.put("customerCenter", customerCenter);
		map.put("customer", customer);
		map.put("admin", admin);
		
		return map;
	}
	
	
	public void UpdateCusAskProcess(CustomerCenter customerCenter) {
		qnaMapper.updateCusAsk(customerCenter);
	}
	
}