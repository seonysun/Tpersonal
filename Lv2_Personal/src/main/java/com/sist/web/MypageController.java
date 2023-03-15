package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {
	@GetMapping("mypage/main.do")
	public String mypage_main() {
		return "mypage/main";
	}
	
	@GetMapping("mypage/class.do")
	public String mypage_class() {
		return "mypage/class";
	}
	
	@GetMapping("mypage/question.do")
	public String mypage_question() {
		return "mypage/question";
	}
	
	@GetMapping("mypage/jjim.do")
	public String mypage_jjim() {
		return "mypage/jjim";
	}
	
	@GetMapping("mypage/community.do")
	public String mypage_community() {
		return "mypage/community";
	}
	
	@GetMapping("mypage/repv.do")
	public String mypage_repv() {
		return "mypage/repv";
	}
}
