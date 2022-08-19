package com.whm.atelier.mapper.customer;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.whm.atelier.vo.CenterBank;
import com.whm.atelier.vo.Consumer;
import com.whm.atelier.vo.Customer;
import com.whm.atelier.vo.CustomerCenter;
import com.whm.atelier.vo.CustomerWallet;
import com.whm.atelier.vo.Order;
import com.whm.atelier.vo.Product;
import com.whm.atelier.vo.ProductAsk;
import com.whm.atelier.vo.ProductImage;
import com.whm.atelier.vo.Review;
import com.whm.atelier.vo.Store;
import com.whm.atelier.vo.StoreTier;

public interface CustomerMainMapper {

	// 아이디와 패스워드로 계정 정보 불러오기
	public Customer selectByIdAndPw(Customer param);
	
	public Customer selectCheckId(String name);
	public Customer selectByNo(int CustomerNo);
	public void insertStoreNameAndProfile(Store store);
	public Store selectStoreNo(int customerNo);
	public int createProductPk();	
	public void insertProductProfile(Product product);
	public void insertProductImage(ProductImage image);
	public ArrayList<Product> selectMyProduct(
			@Param("storeNo") int storeNo,
			@Param("type") int type);
	
	public ArrayList<Product> searchMyProduct(
			@Param("storeNo") int storeNo,
			@Param("productName") String productName,			
			@Param("confirmNo") int confirmNo,
			@Param("productYn") String productYn
			);
	
	
	public Product selectProductDetail(int productNo);
	public Consumer selectConsumer(int consumerNo);
	public Order selectOrder(int orderNo);
	
	public void updateStoreProfile(Store store);
	
	public void updateStoreImage(Store store);
	
	public void updateProductProfile(Product product);
	
	public void updateProductStatusStop(int productNo);
	public void updateProductStatusStart(int productNo);
	public void updateProductStatusYn(
			@Param("productNo") int productNo,
			@Param("productYn") String productYn
			);
	
	
	public StoreTier selectTier(int storeTierNo);
	
	public ArrayList<Review> selectReview(int productNo);
	
	public ArrayList<Review> selectReviewByStoreNo(int storeNo);
	
	
	public ArrayList<Product> selectProductByNo(int storeNo);
	
	public Review selectReviewVo(
			@Param("productNo")  int productNo,
			@Param("consumerNo") int consumerNo);
	
	public ArrayList<ProductAsk> selectAsk(int productNo);
	
	public ArrayList<ProductAsk> selectAskByStoreNo(int storeNo);
	
	public int selectAskByVo(int productNo);
	
	public int selectReviewCount(int productNo);
	
	public CustomerWallet selectMyWallet(int customerNo);
	
	public CenterBank selectBank(int customerWalletNo);
	
	
	public void insertCustomerQna(CustomerCenter customerCenter);
	public ArrayList<CustomerCenter> selectCusAskList (int customerNo);
	public CustomerCenter selectCusAskDetail (int cusCenterNo);
	public void deleteCusAsk (int cusCenterNo);
	
	public void insertCustomerWallet(
			@Param("customerNo") int customerNo,
			@Param("account") String account,
			@Param("bank") String bank
			);
	public void insertBank(int walletNo);
	
	public void updateCustomerWallet(
			@Param("customerNo") int customerNo,
			@Param("account") String account,
			@Param("bank") String bank
			);
	
	public ArrayList<ProductImage> selectImageList(int product_no);
	public ProductImage selectImageListYn(int product_no);
	public void updateStoreTier(
			@Param("storeNo")int storeNo,
			@Param("customerNo") int customerNo
			);
	
	public void updateProductImage(String pi_path);
	
	public void updateProductImageN(
			@Param("pi_path")String pi_path,
			@Param("productNo") int productNo
			);
	
	
	public Review selectReviewStoreNo(int store_no);
	
}



