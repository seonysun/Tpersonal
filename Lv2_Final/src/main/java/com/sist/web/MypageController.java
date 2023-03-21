package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {
	@GetMapping("mypage/main.do")
	public String mypage_main() {
		return "mypage/class";
	}
	
	@GetMapping("mypage/class.do")
	public String mypage_class() {
		return "mypage/class";
	}
	
	@GetMapping("mypage/community.do")
	public String mypage_community() {
		return "mypage/community";
	}
	
	@GetMapping("mypage/repv.do")
	public String mypage_repv() {
		return "mypage/repv";
	}
	
	@GetMapping("mypage/profileUpdate.do")
	public String mypage_profileUpdate() {
		return "mypage/profileUpdate";
	}
	
	@GetMapping("mypage/register.do")
	public String mypage_register() {
		return "mypage/register";
	}
}
