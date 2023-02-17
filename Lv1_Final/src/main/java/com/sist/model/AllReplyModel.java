package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;

@Controller
public class AllReplyModel {
	String[] url = {"","../picture/detail.do?gpno=",""};
	
	@RequestMapping("all_reply/all_reply_insert.do")
	public String all_reply_insert(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String no = request.getParameter("no");
		String cate_no = request.getParameter("cate_no");
		String msg = request.getParameter("msg");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		AllReplyDAO dao = new AllReplyDAO();
		AllReplyVO vo = new AllReplyVO();
		vo.setCate_no(Integer.parseInt(cate_no));
		vo.setNo(Integer.parseInt(no));
		vo.setMsg(msg);
		vo.setId(id);
		vo.setName(name);
		dao.allReplyInsert(vo);
		return "redirect:"+url[Integer.parseInt(cate_no)]+no;
	}
	
	@RequestMapping("all_reply/all_reply_delete.do")
	public String all_reply_delete(HttpServletRequest request, HttpServletResponse response) {
		String rno = request.getParameter("rno");
		String no = request.getParameter("no");
		String cate_no = request.getParameter("cate_no");
		
		// DAO연결
		AllReplyDAO dao = new AllReplyDAO();
		dao.allReplyDelete(Integer.parseInt(rno));
		return "redirect:"+url[Integer.parseInt(cate_no)]+no;

	}
	
	@RequestMapping("all_reply/all_reply_update.do")
	public String all_reply_update(HttpServletRequest request, HttpServletResponse response) {
		// Java => 브라우저 => Java
		//   encoding   decodings
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String rno = request.getParameter("rno");
		String no = request.getParameter("no");
		String cate_no = request.getParameter("cate_no");
		String msg = request.getParameter("msg");
		// 데이터베이스 연결
		AllReplyDAO dao = new AllReplyDAO();
		dao.allReplyUpdate(Integer.parseInt(rno), msg);
		return "redirect:"+url[Integer.parseInt(cate_no)]+no;
	}
}










