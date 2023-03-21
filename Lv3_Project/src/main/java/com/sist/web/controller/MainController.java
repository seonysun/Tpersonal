package com.sist.web.controller;
import java.util.*;
import com.sist.web.dao.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	@GetMapping("/")
	public String main_page(Model model) {
		model.addAttribute("main_html", "main/home");
		return "main";
	}
}
