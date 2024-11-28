package querysystem.mapper;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import querysystem.model.dto.ProductDto;
import querysystem.model.entity.Product;

@Component
public class ProductMapper {
	@Autowired
	private ModelMapper modelMapper;
	
	public ProductDto toDto(Product product) {
		// Entity 轉 DTO
		return modelMapper.map(product, ProductDto.class);
	}
	
	public Product toEntity(ProductDto productDto) {
		// DTO 轉 Entity 
		return modelMapper.map(productDto, Product.class);
	}
}
