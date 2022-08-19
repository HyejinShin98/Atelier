package com.whm.atelier.mapper.admin;

import java.util.ArrayList;

import com.whm.atelier.vo.Product;
import com.whm.atelier.vo.Store;

public interface AdminStMapper {

	public ArrayList<Store> selectStore();
	public ArrayList<Product> selectProduct();
	public Store selectByStoreNo(int storeNo);
}
