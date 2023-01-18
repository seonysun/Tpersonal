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
}
