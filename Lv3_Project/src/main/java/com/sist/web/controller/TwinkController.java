package com.sist.web.controller;

import java.util.*;
import com.sist.web.dao.*;
import com.sist.web.entity.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("twink/")
public class TwinkController {
	@Autowired
	private TwinkDAO dao;
	
	@GetMapping("twink_list")
	public String twink_list(String page, Model model) {
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		model.addAttribute("curpage", curpage);
		int totalpage=dao.twinkTotalpage();
		model.addAttribute("totalpage", totalpage);
		final int BLOCK=5;
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endpage>totalpage) endpage=totalpage;
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);

		int rowsize=12;
		int start=rowsize*(curpage-1);
		List<TwinkEntity> list=dao.twinkListData(start);
		model.addAttribute("list", list);
		
		model.addAttribute("main_html", "twink/twink_list");
		return "main";
	}
	
	@GetMapping("twink_detail")
	public String twink_detail(int no, Model model) {
		TwinkEntity vo=dao.findByNo(no);
		model.addAttribute("vo", vo);
		model.addAttribute("main_html", "twink/twink_detail");
		return "main";
	}
}
