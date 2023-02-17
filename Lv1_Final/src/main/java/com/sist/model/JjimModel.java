package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.JjimDAO;
import com.sist.vo.JjimVO;

@Controller
public class JjimModel {
	@RequestMapping("jjim/jjim_insert.do")
	public String jjim_insert(HttpServletRequest request, HttpServletResponse response) {
		String gpno = request.getParameter("gpno");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		JjimVO vo = new JjimVO();
		vo.setNo(Integer.parseInt(gpno));
		vo.setId(id);
		// 데이터베이스 연동
		JjimDAO dao = new JjimDAO();
		dao.jjimInsert(vo);
		
		return "redirect:../picture/detail.do?gpno="+gpno;
	}
}
