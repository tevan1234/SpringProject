package querysystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import querysystem.model.dto.OrderDto;
import querysystem.service.OrderService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;



@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@GetMapping
	protected String orderPage(Model model) {
		List<OrderDto>orderDtos = orderService.findAll();
		model.addAttribute("orderDtos", orderDtos);
		return "order/order";
	}
	
	@GetMapping("/get")
	public String updateOrder(@RequestParam String orderId,Model model) {
		OrderDto orderDto = orderService.findOrderById(orderId);
		model.addAttribute("orderDto", orderDto);
		return "/order/updateOrder";
	}
	
	
	@GetMapping("/info")
	public String getOderInfo(@RequestParam String orderId,Model model) {
		OrderDto orderDto = orderService.findOrderById(orderId);
		model.addAttribute("orderDto", orderDto);
		return "/order/orderInfo";
	}
	
	@PostMapping("/add")
	public String postMethodName(@RequestParam String holder, @RequestParam String holderCN, @RequestParam String insured, @RequestParam String insuredCN, @RequestParam String orderType, @RequestParam String payType, @RequestParam String orderDate, @RequestParam String charge, @RequestParam String contact, @RequestParam String comment) {
		orderService.addOrder(holder, holderCN, insured, insuredCN, orderType, payType, orderDate, charge, contact, comment);
		
		return "redirect:/order";
	}
	
	@PostMapping("/update")
	public String postMethodName(@RequestBody String orderId,@RequestParam String orderStatus, @RequestParam String charge, @RequestParam String contact, @RequestParam String comment) {
		orderService.updateOrder(orderId, orderStatus, charge, contact, comment);
		
		return "redirect:/order";
	}
	
	
}
