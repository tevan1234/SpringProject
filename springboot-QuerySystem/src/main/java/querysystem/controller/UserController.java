package querysystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import querysystem.model.dto.UserDto;
import querysystem.service.OrderService;
import querysystem.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;
    
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
        return "redirect:/user/user";
    }
    
}
