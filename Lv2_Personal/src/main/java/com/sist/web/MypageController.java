package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {
	@GetMapping("mypage/main.do")
	public String mypage_main() {
		return "mypage/main";
	}
	
	@GetMapping("mypage/myjjim.do")
	public String mypage_jjim() {
		return "mypage/myjjim";
	}
	
	@GetMapping("mypage/myclass.do")
	public String mypage_class() {
		return "mypage/myclass";
	}
	
	@GetMapping("mypage/myquestion.do")
	public String mypage_question() {
		return "mypage/myquestion";
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
