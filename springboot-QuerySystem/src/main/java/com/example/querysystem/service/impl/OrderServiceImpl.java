package com.example.querysystem.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.querysystem.model.dto.OrderDto;
import com.example.querysystem.model.entity.Order;
import com.example.querysystem.model.entity.Product;
import com.example.querysystem.repository.OrderRepository;
import com.example.querysystem.repository.ProductRepository;
import com.example.querysystem.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    private OrderRepository orderRepository; // 自動注入 orderRepository

    @Autowired
    private ProductRepository productRepository; // 自動注入 productRepository

    public List<OrderDto> findAll() {
        List<OrderDto> orderDtos = new ArrayList<>();
        List<Order> orders = orderRepository.findAll();
        List<Product> products = productRepository.findAll();

        for (Order order : orders) {
            OrderDto orderDto = mapOrderToDto(order, products);
            orderDtos.add(orderDto);
        }
        return orderDtos;
    }

    public List<OrderDto> filterOrders(String orderCardNumber) {
        List<OrderDto> orderDtos = new ArrayList<>();
        List<Order> orders = orderRepository.filterOrders(orderCardNumber);
        List<Product> products = productRepository.findAll();

        for (Order order : orders) {
            OrderDto orderDto = mapOrderToDto(order, products);
            orderDtos.add(orderDto);
        }
        return orderDtos;
    }

    public OrderDto findOrderById(Integer orderId) {
        Order order = orderRepository.findOrderById(orderId);
        List<Product> products = productRepository.findAll();

        if (order == null) {
            return null;
        }

        return mapOrderToDto(order, products);
    }

    public OrderDto findByHolderCardNumber(String holderCardNumber) {
        Order order = orderRepository.findByHolderCardNumber(holderCardNumber);
        List<Product> products = productRepository.findAll();

        if (order == null) {
            return null;
        }

        return mapOrderToDto(order, products);
    }

    public void updateOrder(String orderId, String orderStatus, String charge, String contact, String comment) {
        if (!orderStatus.isEmpty() || !comment.isEmpty()) {
            orderRepository.updateOrder(Integer.parseInt(orderId), Boolean.parseBoolean(orderStatus), comment);
        }
        if (!charge.isEmpty() && !contact.isEmpty()) {
            orderRepository.updateOrderCharge(Integer.parseInt(orderId), charge, contact);
        }
    }

    public void addOrder(String holder, String holderCN, String insured, String insuredCN, String orderType,
                         String payType, String orderDate, String charge, String contact, String comment) {
        Boolean orderStatus = false;
        Order order = new Order();
        order.setHolder(holder);
        order.setHolderCN(holderCN);
        order.setInsured(insured);
        order.setInsuredCN(insuredCN);
        order.setType(orderType);
        order.setPayType(Integer.parseInt(payType));
        order.setStatus(orderStatus);
        order.setOrderDate(orderDate);
        order.setCharge(charge);
        order.setContact(contact);
        order.setComment(comment);

        orderRepository.save(order);
    }

    public void deleteOrder(Integer orderId) {
        orderRepository.deleteOrder(orderId);
    }
 
	
	// 將 Order 轉換為 OrderDto 的輔助方法
    private OrderDto mapOrderToDto(Order order, List<Product> products) {
        OrderDto orderDto = new OrderDto();
        orderDto.setOid(order.getId());
        orderDto.setHolder(order.getHolder());
        orderDto.setHolderCardNumber(order.getHolderCN());
        orderDto.setInsured(order.getInsured());
        orderDto.setInsuredCardNumber(order.getInsuredCN());
        orderDto.setOtype(order.getType());
        orderDto.setOpayType(order.getPayType());
        orderDto.setOstatus(order.getStatus());
        orderDto.setOdate(order.getOrderDate());
        orderDto.setOcharge(order.getCharge());
        orderDto.setOcontact(order.getContact());
        orderDto.setOcomment(order.getComment());

        // 計算 orderPrice
        Optional<Product> optProduct = products.stream()
                .filter(p -> p.getType().equals(orderDto.getOtype()))
                .findFirst();
        optProduct.ifPresent(Product -> orderDto.setOrderPrice(Product.getPrice() * order.getPayType()));

        return orderDto;
    }
}
