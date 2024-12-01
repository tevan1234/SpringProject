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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

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
	
	@GetMapping("/list")
	public String Productlist(Model model) {
		List<ProductDto>productDtos = productService.findAll();
		model.addAttribute("productDtos", productDtos);
		return "/product/productlist";
	}
	
	@GetMapping("/get")
	public String getProduct(String productId,Model model) {
		ProductDto productDto = productService.findProductById(productId);
		model.addAttribute("productDto", productDto);
		return "/product/updateProduct";
	}
	
	@GetMapping("/delete")
    public String deleteproduct(String productId) {
        productService.deleteproduct(productId);
        return "redirect:/product/list";// 導向網址/product/list
    }
	
	@GetMapping("/rank")
	public String getRanking(Model model) {
		model.addAttribute("ranking", productService.Ranking());
        return "ranking"; 
	}
	
	@PostMapping("/add")
	public String addProduct(@RequestParam String productType,@RequestParam String price) {
		productService.addproduct(productType, price);
		
		return "redirect:/product/list";
	}
	
	@PostMapping("/update")
	public String updateProduct(@RequestParam String productId,@RequestParam String price,@RequestParam String productStatus) {
		productService.updateproduct(productId, price, productStatus);
		
		return "redirect:/product/list";
	}
	
	
}
