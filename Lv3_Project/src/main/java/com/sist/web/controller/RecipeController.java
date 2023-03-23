package com.sist.web.controller;
import java.util.*;
import com.sist.web.entity.*;
import com.sist.web.dao.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("recipe/")
public class RecipeController {
	@Autowired
	private RecipeDAO dao;
	
	@GetMapping("recipe_list")
	public String recipe_list(String page, Model model) {
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		model.addAttribute("curpage", curpage);
		int totalpage=dao.recipeTotalPage();
		model.addAttribute("totalpage", totalpage);
		final int BLOCK=5;
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endpage>totalpage) endpage=totalpage;
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);

		int rowsize=12;
		int start=rowsize*(curpage-1);
		List<RecipeEntity> list=dao.recipeListData(start);
		model.addAttribute("list", list);
		
		model.addAttribute("main_html", "recipe/recipe_list");
		return "main";
	}
	
	@GetMapping("recipe_detail")
	public String recipe_detail(int no, Model model) {
		RecipeEntity vo=dao.findByNo(no);
		model.addAttribute("vo", vo);
		model.addAttribute("main_html", "recipe/recipe_detail");
		return "main";
	}
}
