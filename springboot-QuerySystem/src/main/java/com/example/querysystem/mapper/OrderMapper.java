package com.example.querysystem.mapper;

import org.modelmapper.ModelMapper;
import org.modelmapper.Converter;
import org.modelmapper.spi.MappingContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.example.querysystem.model.dto.OrderDto;
import com.example.querysystem.model.entity.Order;
import com.example.querysystem.model.entity.Product;

import jakarta.annotation.PostConstruct;

import java.util.List;
import java.util.Optional;

@Component
public class OrderMapper {
	@Autowired
	private ModelMapper modelMapper;
	
	 //@Autowired
	 //private List<Product> products;
	
	 /*@PostConstruct
	 public void configureMappings() {
	        // 自定義字段映射邏輯
		 Converter<Order, OrderDto> orderToDtoConverter = new Converter<>() {
			 @Override
	         public OrderDto convert(MappingContext<Order, OrderDto> context) {
				 Order order = context.getSource();
	             OrderDto orderDto = context.getDestination();

	             // 將普通字段進行映射
	             modelMapper.map(order, orderDto);

	             // 添加自定義邏輯：計算 OrderPrice
	             Optional<Product> optProdouct = products.stream()
	            		 .filter(p -> p.getType().equals(order.getType()))
	                     .findFirst();

	             optProdouct.ifPresent(product -> orderDto.setOrderPrice(product.getPrice() * order.getPayType()));

	             return orderDto;
	        }
	    };
	    modelMapper.typeMap(Order.class, OrderDto.class).setConverter(orderToDtoConverter);
	}*/
	
	public OrderDto toDto(Order order) {
		// Entity 轉 DTO
		return modelMapper.map(order, OrderDto.class);
	}
	
	public Order toEntity(OrderDto orderDto) {
		// DTO 轉 Entity 
		return modelMapper.map(orderDto, Order.class);
	}
}
