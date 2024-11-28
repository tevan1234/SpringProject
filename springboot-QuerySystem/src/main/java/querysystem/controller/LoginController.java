package querysystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import querysystem.model.dto.UserCert;
import querysystem.service.CertService;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private CertService certService;
	
	@GetMapping
	public String loginpage() {
		return "login";
	}
	
	@PostMapping
	public String checkLogin(@RequestParam String username, @RequestParam String password, HttpSession session, HttpServletRequest req, Model model) {
		UserCert userCert = null;
		
		try {
			userCert = certService.getCert(username, password);
		} catch (Exception e) {
			// 將錯誤丟給(重導) error.jsp
			model.addAttribute("message", e.getMessage());
			return "error";//導到error.jsp
		}
		session.setAttribute("userCert", userCert); // 放憑證
		session.setAttribute("locale", req.getLocale());
		return "redirect:/home";
	}
}
