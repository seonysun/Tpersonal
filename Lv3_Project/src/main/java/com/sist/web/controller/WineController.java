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
@RequestMapping("wine/")
public class WineController {
	@Autowired
	private WineDAO dao;
	
	@GetMapping("wine_list")
	public String wine_list(String page, Model model) {
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		model.addAttribute("curpage", curpage);
		int totalpage=dao.wineTotalpage();
		model.addAttribute("totalpage", totalpage);
		final int BLOCK=5;
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endpage>totalpage) endpage=totalpage;
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);

		int rowsize=12;
		int start=rowsize*(curpage-1);
		List<WineEntity> list=dao.wineListData(start);
		model.addAttribute("list", list);
		
		model.addAttribute("main_html", "wine/wine_list");
		return "main";
	}
	
	@GetMapping("whiskey_list")
	public String whiskey_list(String page, Model model) {
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		model.addAttribute("curpage", curpage);
		int totalpage=dao.whiskeyTotalpage();
		model.addAttribute("totalpage", totalpage);
		final int BLOCK=5;
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endpage>totalpage) endpage=totalpage;
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		
		int rowsize=12;
		int start=rowsize*(curpage-1);
		List<WineEntity> list=dao.whiskeyListData(start);
		model.addAttribute("list", list);
		
		model.addAttribute("main_html", "wine/whiskey_list");
		return "main";
	}
	
	@GetMapping("cognac_list")
	public String cognac_list(String page, Model model) {
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		model.addAttribute("curpage", curpage);
		int totalpage=dao.cognacTotalpage();
		model.addAttribute("totalpage", totalpage);
		final int BLOCK=5;
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endpage>totalpage) endpage=totalpage;
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		
		int rowsize=12;
		int start=rowsize*(curpage-1);
		List<WineEntity> list=dao.cognacListData(start);
		model.addAttribute("list", list);
		
		model.addAttribute("main_html", "wine/cognac_list");
		return "main";
	}
	
	@RequestMapping("wine_find")
	public String wine_find(String nation, String page, Model model) {
		if(nation==null) nation=" ";
		model.addAttribute("nation", nation);
		
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		model.addAttribute("curpage", curpage);
		int totalpage=dao.wineFindTotalpage(nation);
		model.addAttribute("totalpage", totalpage);
		final int BLOCK=5;
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endpage>totalpage) endpage=totalpage;
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		
		int rowsize=10;
		int start=rowsize*(curpage-1);
		List<WineEntity> list=dao.wineFindData(nation, start);
		model.addAttribute("list", list);
		
		int count=dao.wineFindCount(nation);
		int count1=dao.wineCount();
		int count2=dao.whiskeyCount();
		int count3=dao.cognacCount();
		model.addAttribute("count", count);
		model.addAttribute("count1", count1);
		model.addAttribute("count2", count2);
		model.addAttribute("count3", count3);
		
		model.addAttribute("main_html", "wine/wine_find");
		return "main";
	}
	
	@GetMapping("wine_detail")
	public String wine_detail(int ino, Model model) {
		WineEntity vo=dao.findByIno(ino);
		model.addAttribute("vo", vo);
		model.addAttribute("main_html", "wine/wine_detail");
		return "main";
	}
}
