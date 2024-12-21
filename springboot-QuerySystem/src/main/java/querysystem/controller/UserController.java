package querysystem.controller;

import java.security.SecureRandom;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import querysystem.exception.UserNotFoundException;
import querysystem.model.dto.OrderDto;
import querysystem.model.dto.UserCert;
import querysystem.model.dto.UserDto;
import querysystem.service.GmailService;
import querysystem.service.OrderService;
import querysystem.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;



@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;
    
    @Autowired
	private GmailService gmailService;
    
    @GetMapping
    public String getMethodName(Model model) {
    	List<UserDto> userDtos = userService.findAll();
        model.addAttribute("userDtos", userDtos);
        System.out.println("UserDtos: " + userDtos);
        return "/user/user";
    }
    
    @GetMapping("/get")
    public String getUser(String username, Model model) {
        UserDto userDto = userService.findUserByname(username);
        model.addAttribute("userDto", userDto);
        return "/user/updateUser"; // Maps to /WEB-INF/view/updateUser.jsp
    }
    
    @GetMapping("/delete")
    public String deleteUser(String userId) {
    	userService.deleteUser(userId);
        return "redirect:/user";
    }
    
    @GetMapping("/update/password")
    public String updatePassword() {
        return "/user/updatePassword";
    }
    
    @GetMapping("/reset/sendMail")
    public String resetPassword() {
        return "/user/resetPassword";
    }
    
    @GetMapping("/info")
    public String getUserInfo(String cardNumber,Model model) {
    	List<OrderDto>orderDtos = orderService.filterOrders(cardNumber);
    	model.addAttribute("orderDtos",orderDtos);
        return "/user/userinfo";
    }
    
    
    @PostMapping("/add")
    public String addUser(@RequestParam String cardNumber,@RequestParam String username,@RequestParam String password,@RequestParam String phone,@RequestParam String mail,@RequestParam String role) {
        userService.addUser(cardNumber, username, password, phone, mail, role);
        return "redirect:/user";
    }
    
    @PostMapping("/update")
    public String updateActive(@RequestParam String userId,@RequestParam String active,@RequestParam String role) {
        userService.updateUser(userId, active, role);        
        return "redirect:/user";
    }
    
    
    @PostMapping("/update/password")
    public String updatePassword(HttpSession session,@RequestParam String oldPassword,@RequestParam String newPassword,Model model) {
        try {
			UserCert userCert = (UserCert)session.getAttribute("userCert");
			userService.updatePassword(userCert.getUserId(),userCert.getUsername() , oldPassword, newPassword);
			model.addAttribute("message", "密碼更新成功");
			model.addAttribute("redirect", true);
			return "/user/updatePassword";
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			model.addAttribute("redirect", true);
            return "/user/updatePassword";
		}        
    }    
        
    @PostMapping("/reset/sendMail")
    public String sendnewPassword(@RequestParam String username,@RequestParam String mail, Model model) {
    	SecureRandom secureRandom = new SecureRandom();
		Integer newPassword =  secureRandom.nextInt(10000);
        try {
			userService.resetPassword(username, mail, String.format("%04d", newPassword));
			gmailService.sendEmail("tevan090726@gmail.com", "更改密碼(程式測試)","新密碼: ",newPassword);
		} catch (UserNotFoundException e) {
			model.addAttribute("message",  e.getMessage());
    		model.addAttribute("redirect", true);
    		return "/user/resetPassword";
		} catch (Exception e) {
            e.printStackTrace();
            return "error"; // 返回错误页面
        }
        return "redirect:/home";
    }
    
    
}
