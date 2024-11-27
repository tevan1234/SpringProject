package com.example.querysystem.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.querysystem.model.dto.ProductDto;

public interface ProductService {
	
	List<ProductDto> findAll();
		
	ProductDto findProductById(Integer prodouctId);
	
	void addProdouct(String productType, String price);
	
	void updateProdouct(String productId,String price,String productStatus);
	
	void deleteProdouct(Integer prodouctId);
	
	Map<String, Integer> Ranking();
}
