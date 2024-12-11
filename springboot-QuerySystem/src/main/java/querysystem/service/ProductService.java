package querysystem.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Service;

import querysystem.model.dto.ProductDto;

public interface ProductService {
	
	List<ProductDto> findAll();
		
	ProductDto findProductById(String productId);
	
	void addproduct(String productType, String price);
	
	void updateproduct(String productId,String price,String productStatus);
	
	void deleteproduct(String productId);
	
	Map<String, Integer> Ranking();
	
	Map<String, Boolean> CheckStatus();
}
