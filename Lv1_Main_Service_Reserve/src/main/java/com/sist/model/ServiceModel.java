package com.sist.model;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class ServiceModel {
	@RequestMapping("service/list.do")
	public String qna_list(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		ServiceDAO dao=new ServiceDAO();
		ArrayList<AskVO> list=dao.qnaListData(curpage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../service/list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("service/detail.do")
	public String qna_detail(HttpServletRequest request, HttpServletResponse response) {
		String fno=request.getParameter("fno");
		ServiceDAO dao=new ServiceDAO();
		AskVO vo=dao.qnaDetailData(Integer.parseInt(fno), 0);
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../service/detail.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("serviec/reply.do")
	public String qna_reply(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../service/reply.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("serviec/insert.do")
	public String qna_insert(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../service/insert.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("serviec/update.do")
	public String qna_update(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../service/update.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("serviec/delete.do")
	public String qna_delete(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../service/delete.jsp");
		return "../main/main.jsp";
	}
}
