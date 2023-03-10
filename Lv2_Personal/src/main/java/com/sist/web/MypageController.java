package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {
	@GetMapping("mypage/main.do")
	public String mypage_main() {
		return "mypage/main";
	}
	
	@GetMapping("adminpage/main.do")
	public String adminpage_main() {
		return "adminpage/main";
	}
	
	@GetMapping("tutorpage/main.do")
	public String tutorpage_main() {
		return "tutorpage/main";
	}
}
