package querysystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/logout")
public class LogoutController {

	@GetMapping
	public String logout(HttpSession session) {
		
		session.invalidate();		
		return "redirect:/home";
	}
}
