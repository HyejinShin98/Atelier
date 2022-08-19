package com.whm.atelier.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whm.atelier.mapper.admin.AdminMainMapper;
import com.whm.atelier.mapper.consumer.ConsumerMainMapper;
import com.whm.atelier.mapper.coupon.CouponMapper;
import com.whm.atelier.mapper.faq.FaqMapper;
import com.whm.atelier.mapper.notice.NoticeMapper;
import com.whm.atelier.vo.Admin;
import com.whm.atelier.vo.Consumer;
import com.whm.atelier.vo.Coupon;
import com.whm.atelier.vo.Faq;
import com.whm.atelier.vo.Notice;

@Service
public class AdminServiceImpl {

	@Autowired
	private AdminMainMapper adminMainMapper;
	
	@Autowired
	private ConsumerMainMapper consumerMainMapper;
	
	@Autowired
	private CouponMapper couponMapper;
	
	@Autowired
	private NoticeMapper noticeMapper;
	
	@Autowired
	private FaqMapper faqMapper;
	
	
	public Admin login(Admin param) {
		Admin admin = adminMainMapper.selectByIdAndPw(param);
		return admin;
	}
	
	public void createCoupon(Coupon coupon) {
		couponMapper.insertCoupon(coupon);
	}
	
	public ArrayList<Coupon> adminCouponList() {
		ArrayList<Coupon> data = couponMapper.selectAllCou();
		return data;
	}
	
	
	public void couponDelete(int coupon_no) {
		couponMapper.deleteCoupon(coupon_no);
	}
	
	public ArrayList<Consumer> consumerList(){
		ArrayList<Consumer> data = consumerMainMapper.selectAllCon();
		return data;
	}
	
	
//	쿠폰관련된 모든 데이터
	public HashMap<String, Object> consumerData(int consumer_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Consumer conResult = consumerMainMapper.selectByNoCon(consumer_no); 
		map.put("conResult", conResult);
		return map;
	}
	public List<Map<String, Object>> totalGetPrice(){
		return adminMainMapper.totalGetPrice();
	}
	
	//공지사항
			public HashMap<String, Object> getAdminDataList(int admin_no) {
				return null;
			}

			public ArrayList<HashMap<String, Object>> getAdminDataList() {
			ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();		
			ArrayList<Notice> noticeList = noticeMapper.selectAll();
					
			for(Notice notice : noticeList) {
				int admin_no = notice.getAdmin_no();
						
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("notice", notice);
				dataList.add(map);	
				}
				
				return dataList;
					
			}
			
			public HashMap<String, Object> getNoticeData(int admin_no) {
				HashMap<String, Object> map = new HashMap<String, Object>();
					
				Notice notice = noticeMapper.selectByNo(admin_no);
				Admin admin = adminMainMapper.selectByNoAd(admin_no);
				
				map.put("notice", notice);
				map.put("admin", admin);
					
				return map;
				}
				
			public void registNotice(Notice notice) {
				noticeMapper.insertNotice(notice);
			}
			
			public void deleteNotice(int admin_no) {
				noticeMapper.deleteByNo(admin_no);
				}
				
			public void updateNotice(Notice notice) {
				noticeMapper.updateNoticeTitleAndContent(notice);
				}


			//자주 묻는 질문
			public void consumerFaqUpdate (Faq faq) {
				faqMapper.updateFaqTitleAndContent(faq);
			}

			public HashMap<String, Object> getAdminFaq(int admin_faq_no) {
			HashMap<String, Object> map = new HashMap<String, Object>();
				
			return map;
			
			}
	
}
