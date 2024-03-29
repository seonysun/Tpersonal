package com.sist.web.controller;
import java.util.*;
import com.sist.web.dao.*;
import com.sist.web.entity.WineEntity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	@Autowired
	private WineDAO dao;
	
	@GetMapping("/")
	public String main_page(Model model) {
		List<WineEntity> list=dao.mainTop4();
		model.addAttribute("list", list);
		model.addAttribute("main_html", "main/home");
		return "main";
	}
}
