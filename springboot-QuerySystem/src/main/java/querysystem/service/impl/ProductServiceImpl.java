package querysystem.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.util.stream.Collectors.toList;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import querysystem.mapper.ProductMapper;
import querysystem.model.dto.ProductDto;
import querysystem.model.entity.Product;
import querysystem.repository.ProductRepository;
import querysystem.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public List<ProductDto> findAll() {
		return productRepository.findAll().stream().map(productMapper::toDto).collect(toList());
	}

	@Override
	public ProductDto findProductById(String productId) {
		Product product = productRepository.findById(Integer.parseInt(productId)).get();
		return productMapper.toDto(product);
	}

	@Override
	public void addproduct(String productType, String price) {
		Product product = new Product();
        product.setType(productType);
        product.setPrice(Integer.parseInt(price));
        product.setStatus(true); // Default status
        product.setSales(0); // Default sales
        productRepository.save(product);
	}

	@Override
	public void updateproduct(String productId, String price, String productStatus) {
		if (!price.isEmpty()) {
			productRepository.updateProductPrice(Integer.parseInt(productId), Integer.parseInt(price));
		}
		if (!productStatus.isEmpty()) {
			productRepository.updateProductStatus(Integer.parseInt(productId), Boolean.parseBoolean(productStatus));
		}
		
	}

	@Override
	public void deleteproduct(String productId) {
		productRepository.deleteById(Integer.parseInt(productId));
		
	}

	@Override
	public Map<String, Integer> Ranking() {
		List<Object[]> results = productRepository.Ranking();
	    Map<String, Integer> rankingMap = new HashMap<>();
	    
	    for (Object[] row : results) {
	        String type = (String) row[0];
	        Integer sales = ((Number) row[1]).intValue();
	        rankingMap.put(type, sales);
	    }
		return rankingMap;
	}

}
