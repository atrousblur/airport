package erp.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class LoginController {
	@RequestMapping("/erp/logout.do")
	public String insertView(){
		return "erp/login";
	}
}
