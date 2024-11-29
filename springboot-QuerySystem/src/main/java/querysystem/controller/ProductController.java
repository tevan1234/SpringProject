package querysystem.controller;

import java.util.List;

import org.hibernate.query.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import querysystem.model.dto.OrderDto;
import querysystem.model.dto.ProductDto;
import querysystem.service.OrderService;
import querysystem.service.ProductService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrderService orderService;
	
	@GetMapping
	public String ProductPage() {
		return "/product/product";
	}
	
	/*@GetMapping("/list")
	public String Productlist(Model model) {
		List<ProductDto>productDtos = productService.findAll();
		model.addAttribute("productDtos", productDtos);
		return "productlist";
	}
	
	@GetMapping("/get")
	public String getProduct(String productId,Model model) {
		ProductDto productDto = productService.findProductById(productId);
		model.addAttribute("productDto", productDto);
		return "updateProduct";
	}
	
	@GetMapping("/delete")
    public String deleteProdouct(String prodouctId) {
        productService.deleteProdouct(prodouctId);
        return "redirect:/prodouct/list";
    }
	
	@GetMapping("/rank")
	public String getRanking(Model model) {
		model.addAttribute("ranking", productService.Ranking());
        return "ranking"; 
	}
	
	@GetMapping("/info")
    public String getUserInfo(String cardNumber, Model model) {
        List<OrderDto> orderDtos = orderService.filterOrders(cardNumber);
        model.addAttribute("orderDtos", orderDtos);
        return "userinfo"; // Maps to /WEB-INF/view/userinfo.jsp
    }*/
}
