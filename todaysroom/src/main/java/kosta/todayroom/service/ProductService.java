package kosta.todayroom.service;

import java.util.List;

import kosta.todayroom.domain.ProductVO;
import kosta.todayroom.domain.StoreVO;

public interface ProductService {
	
	
//  ---등록 : 스토어 글 등록, 파일등록, 상품등록
	public void ProductStoreRegister(StoreVO store);	
	public void ProductItemRegister(List<ProductVO> product);
	
//  -- 리스트 	: 스토어리스트, 상품리스트

	public List<StoreVO> ProductStoreGetList();
	public List<ProductVO> ProductItemGetList();
	
	
	
	public StoreVO ProductStoreRead(Long store_seq);
	
	public boolean ProductStoreModify(StoreVO store);
	
	public boolean ProductStoreRemove(Long store_seq);
	
	
	
	

}
