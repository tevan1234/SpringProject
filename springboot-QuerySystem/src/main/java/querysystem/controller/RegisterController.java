package querysystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import querysystem.service.GmailService;
import querysystem.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;



@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private GmailService gmailService;
	
	@GetMapping
	public String registerPage() {
		return "register";
	}
	
	@PostMapping("/sendMail")
	public String sendMail(HttpServletResponse resp) {
		try {
			Integer verifycode = (int) (Math.random() * 8998)+1002;
            // 使用 GmailService 發送郵件
            gmailService.sendEmail("tevan090726@gmail.com", "驗證信箱(程式測試)","驗證碼: ",verifycode);
            
            // 將驗證碼存入 Cookie
            Cookie verifyCodeCookie = new Cookie("verifycode", String.valueOf(verifycode));
            verifyCodeCookie.setMaxAge(5 * 60); // 設置有效期 5 分鐘
            verifyCodeCookie.setPath("/"); // 設置 Cookie 的作用範圍
            resp.addCookie(verifyCodeCookie);
            return "redirect:/register";
        } catch (Exception e) {
            e.printStackTrace();
            return "error"; // 返回错误页面
        }
	}
	//return "redirect:/register";
	
	@PostMapping("/active")
	public String userActive(HttpServletRequest req,HttpServletResponse resp, String cardNumber, String username, String password, String phone, String mail, String code) {
		String verifyCode = null;
        for (Cookie cookie : req.getCookies()) {
            if ("verifycode".equals(cookie.getName())) {
                verifyCode = cookie.getValue();                
                break;
            }
        }
		
		userService.RegisterUser(cardNumber, username, password, phone, mail, code, Integer.parseInt(verifyCode));
		return "redirect:/login";
	}
	
	
	
}
