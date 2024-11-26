package com.example.querysystem.mapper;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.example.querysystem.model.dto.OrderDto;
import com.example.querysystem.model.entity.Order;

@Component
public class OrderMapper {
	@Autowired
	private ModelMapper modelMapper;
	
	public OrderDto toDto(Order order) {
		// Entity 轉 DTO
		return modelMapper.map(order, OrderDto.class);
	}
	
	public Order toEntity(OrderDto orderDto) {
		// DTO 轉 Entity 
		return modelMapper.map(orderDto, Order.class);
	}
}
