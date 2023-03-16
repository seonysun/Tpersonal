package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminpageController {
	@GetMapping("adminpage/main.do")
	public String adminpage_main() {
		return "adminpage/main";
	}
	
	@GetMapping("adminpage/notice.do")
	public String adminpage_notice() {
		return "adminpage/notice";
	}
	
	@GetMapping("adminpage/class.do")
	public String adminpage_class() {
		return "adminpage/class";
	}
	
	@GetMapping("adminpage/member.do")
	public String adminpage_member() {
		return "adminpage/member";
	}
	
	@GetMapping("adminpage/tutor.do")
	public String adminpage_tutor() {
		return "adminpage/tutor";
	}
}
