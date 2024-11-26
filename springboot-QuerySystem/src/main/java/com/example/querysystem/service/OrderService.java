package com.example.querysystem.service;

import java.util.List;
import java.util.Optional;


import com.example.querysystem.model.dto.OrderDto;

public interface OrderService {
	
	List<OrderDto> findAll();
	
	List<OrderDto> filterOrders(String holderCardNumber);
	
	Optional<OrderDto> findOrderById(Integer orderId);
	
	Optional<OrderDto> findByHolderCardNumber(String holderCardNumber);
	
	void addOrder(String Holder,String HolderCN,String Insured,String InsuredCN,String OrderType,String PayType,String orderDate,String charge,String contact,String comment);

	void updateOrder(String orderId,String orderStatus, String Charge, String Contact,String Comment);

	void deleteOrder(Integer orderId);
	
}
