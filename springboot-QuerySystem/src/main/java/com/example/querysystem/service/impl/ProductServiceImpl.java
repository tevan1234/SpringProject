package com.example.querysystem.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static java.util.stream.Collectors.toList;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.querysystem.mapper.ProductMapper;
import com.example.querysystem.model.dto.ProductDto;
import com.example.querysystem.model.entity.Product;
import com.example.querysystem.repository.ProductRepository;
import com.example.querysystem.service.ProductService;

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
	public ProductDto findProductById(Integer prodouctId) {
		Product product = productRepository.findProductById(prodouctId);
		return productMapper.toDto(product);
	}

	@Override
	public void addProdouct(String productType, String price) {
		Product product = new Product();
        product.setType(productType);
        product.setPrice(Double.parseDouble(price));
        product.setStatus(true); // Default status
        product.setSales(0); // Default sales
        productRepository.save(product);
	}

	@Override
	public void updateProdouct(String productId, String price, String productStatus) {
		if (!price.isEmpty()) {
			productRepository.updateProductPrice(Integer.parseInt(productId), Double.parseDouble(price));
		}
		if (!productStatus.isEmpty()) {
			productRepository.updateProductStatus(Integer.parseInt(productId), Boolean.parseBoolean(productStatus));
		}
		
	}

	@Override
	public void deleteProdouct(String prodouctId) {
		productRepository.deleteProduct(Integer.parseInt(prodouctId));
		
	}

	@Override
	public Map<String, Integer> Ranking() {
		return productRepository.Ranking();
	}

}
