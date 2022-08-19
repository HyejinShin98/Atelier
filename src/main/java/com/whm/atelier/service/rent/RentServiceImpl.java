package com.whm.atelier.service.rent;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whm.atelier.mapper.customer.CustomerMainMapper;
import com.whm.atelier.mapper.rent.RentMapper;
import com.whm.atelier.vo.Customer;
import com.whm.atelier.vo.RentAtelier;
import com.whm.atelier.vo.RentAtelierGroupApplication;
import com.whm.atelier.vo.RentGroupGrade;

@Service
public class RentServiceImpl {
	
	@Autowired
	private RentMapper rentMapper;
	
	@Autowired
	private CustomerMainMapper customerMainMapper;
	

	public void writeRentAtelier(RentAtelier rentAtelier) {
		rentMapper.insertRentAtelier(rentAtelier);
	}
	
	public ArrayList<HashMap<String, Object>> selectAtelierRentList(){
		ArrayList<HashMap<String, Object>> rentList = new ArrayList<HashMap<String, Object>>();
		ArrayList<RentAtelier> atelierList = rentMapper.selectRentAtelierList();
		
		for(RentAtelier rentAtelier : atelierList) {
			int customerNo = rentAtelier.getCustomer_no();
			Customer customer = customerMainMapper.selectByNo(customerNo);			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("rentAtelier", rentAtelier);
			map.put("customer", customer);
			
			rentList.add(map);
		}
		
		return rentList;
		
	}
	
	public HashMap<String, Object> selectAtelierRentDetail(int rentAtelierNo){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		RentAtelier rentAtelier = rentMapper.selectRentNo(rentAtelierNo);
		int CustomerNo = rentAtelier.getCustomer_no();
		Customer customer= customerMainMapper.selectByNo(CustomerNo);	
		
		map.put("customer", customer);
		map.put("rentAtelier", rentAtelier);		
		
		return map;
			
	}
	
	public ArrayList<HashMap<String, Object>> selectRentGroupAppcomment(int rentAtelierNo){
		ArrayList<HashMap<String, Object>> appComm= new ArrayList<HashMap<String, Object>>();
		ArrayList<RentAtelierGroupApplication> appList = rentMapper.selectAppComment(rentAtelierNo);
		RentAtelier rentAtelier = rentMapper.selectRentNo(rentAtelierNo);
		
		for(RentAtelierGroupApplication rentAtelierGroupApplication : appList) {
			int customerNo = rentAtelierGroupApplication.getCustomer_no();
			Customer customer = customerMainMapper.selectByNo(customerNo);
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("customer", customer);
			map.put("rentAtelierGroupApplication", rentAtelierGroupApplication);
			map.put("rentAtelier", rentAtelier);
			
			appComm.add(map);
		}
		
		return appComm;
	}
		
	public void deleteRentAtelier(int rentAtelierNo) {
		rentMapper.deleteRentNo(rentAtelierNo);
	}

	public void WriteGroupApp(RentAtelierGroupApplication rentAtelierGroupApplication) {
		rentMapper.insertGroupApp(rentAtelierGroupApplication);
	}
	
	public void rentGroupConfirm(RentAtelierGroupApplication rentAtelierGroupApplication) {	
		rentMapper.confirmGroup(rentAtelierGroupApplication);
	}
	
	public int rentGroupCount(int rentAtelierNo) {
		return rentMapper.countNop(rentAtelierNo);
	}
	
	public int countGroupApp(int rentAtelierNo) {
		return rentMapper.countApp(rentAtelierNo);	
	}
	
	public ArrayList<HashMap<String, Object>> selectedCustomer(int rentAtelierNo){
		ArrayList<HashMap<String, Object>> selCus = new ArrayList<HashMap<String, Object>>();
		ArrayList<RentAtelierGroupApplication> rAGAList = rentMapper.applicatedCustomer(rentAtelierNo);		
		
		for(RentAtelierGroupApplication rentAtelierGroupApplication: rAGAList) {
			int customerNo = rentAtelierGroupApplication.getCustomer_no();
			Customer customer = customerMainMapper.selectByNo(customerNo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("customer", customer);
			map.put("rAGA",rentAtelierGroupApplication);
			
			selCus.add(map);

		}		
		
		return selCus;
		
	}
	
	public ArrayList<HashMap<String,Object>> GroupByMe (int retnAtelierNo, HttpSession session){
		ArrayList<HashMap<String,Object>> myList = new ArrayList<HashMap<String,Object>>();
		ArrayList<RentAtelierGroupApplication> arr = rentMapper.rentListByMe(retnAtelierNo);
		
		for(RentAtelierGroupApplication rentAtelierGroupApplication : arr) {
			int customerNo = rentAtelierGroupApplication.getCustomer_no();
			Customer customer = customerMainMapper.selectByNo(customerNo);
			int eCNo = ((Customer) session.getAttribute("customer")).getCustomer_no();
			
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			
			map.put("customer", customer);
			map.put("rAGA",rentAtelierGroupApplication);
			map.put("rGG",rentMapper.selectGroupGrade(customerNo, retnAtelierNo, eCNo));
			myList.add(map);
			
		}
		
		return myList;
	}
	
	public void writeReview(RentGroupGrade rentGroupGrade) {
		rentMapper.insertGrade(rentGroupGrade);
	}
	
	public Integer customerMannerGrade(int customerNo) {
		
		return rentMapper.mannerCheck(customerNo);
	}
	
	
	public ArrayList<HashMap<String, Object>> getMeetingList(){
		ArrayList<HashMap<String, Object>> allMeetingList = new ArrayList<HashMap<String,Object>>();
		allMeetingList = rentMapper.meetingApplicationList();
		
		
		return allMeetingList;	
	}
	
	public ArrayList<HashMap<String, Object>> getacceptedCustomerList(){
		ArrayList<HashMap<String, Object>> acceptedCustomerList = new ArrayList<HashMap<String,Object>>();
		ArrayList<RentAtelierGroupApplication> acceptedCustomer = rentMapper.acceptedCustomer();
		
		for(RentAtelierGroupApplication meeting : acceptedCustomer) {
			int customerNo = meeting.getCustomer_no();
			Customer customer = customerMainMapper.selectByNo(customerNo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("Customer", customer);
			map.put("meeting", meeting);
			acceptedCustomerList.add(map);			
		}
		return acceptedCustomerList; 		
	}
}
