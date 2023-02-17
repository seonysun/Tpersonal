package com.sist.model;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;
import com.sist.vo.ZipcodeVO;

@Controller
public class MemberModel {
	@RequestMapping("member/login.do")
	public String login(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../member/login.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("member/join.do")
	public String join(HttpServletRequest request, HttpServletResponse response) {

		return "../member/join.jsp";
	}

	@RequestMapping("member/idcheck.do")
	public String member_idCheck(HttpServletRequest request, HttpServletResponse response) {
		
		return "../member/idcheck.jsp";
	}

	@RequestMapping("member/idcheck_result.do")
	public String member_idCheck_result(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		MemberDAO dao = new MemberDAO();
		int count = dao.memberIdCheck(id);
		request.setAttribute("count", count);
		return "../member/idcheck_result.jsp";
	}

	@RequestMapping("member/postfind.do")
	public String member_postfind(HttpServletRequest request, HttpServletResponse response) {
		return "../member/postfind.jsp";
	}

	@RequestMapping("member/postfind_result.do")
	public String member_postfind_result(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception ex) {
		}

		String dong = request.getParameter("dong");
		// DAO연동
		MemberDAO dao = new MemberDAO();
		int count = dao.memberPostCount(dong);
		List<ZipcodeVO> list = dao.memberPostFind(dong);
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		return "../member/postfind_result.jsp";
	}

	@RequestMapping("member/email_check.do")
	public String member_email_check(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		MemberDAO dao = new MemberDAO();
		int count = dao.memberEmailCheck(email);
		request.setAttribute("count", count);
		request.setAttribute("count", count);

		return "../member/email_check.jsp";
	}

	@RequestMapping("member/tel_check.do")
	public String member_tel_check(HttpServletRequest request, HttpServletResponse response) {
		String phone = request.getParameter("phone");
		MemberDAO dao = new MemberDAO();
		int count = dao.memberPhoneCheck(phone);
		request.setAttribute("count", count);
		return "../member/tel_check.jsp";
	}

	@RequestMapping("member/join_ok.do")
	public String member_insert(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
		}
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String post = request.getParameter("post");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");

		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setSex(sex);
		vo.setBirthday(year + "-" + month + "-" + day);
		vo.setPost(post);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setEmail(email);
		vo.setPhone(tel);
		vo.setQuestion(question);
		vo.setAnswer(answer);

		MemberDAO dao = new MemberDAO();
		dao.memberInsert(vo);

		return "redirect:../main/main.do";
	}

	@RequestMapping("member/login_ok.do")
	public String member_login(HttpServletRequest request, HttpServletResponse response) {
		// data:{"id":id,"pwd":pwd}
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		MemberDAO dao = new MemberDAO();
		// 결과값 받기
		MemberVO vo = dao.memberLogin(id, pwd);
		if (vo.getMsg().equals("OK"))// 로그인되었다면
		{
			// session생성
			HttpSession session = request.getSession();
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			session.setAttribute("admin", vo.getAdmin());
		}
		request.setAttribute("result", vo.getMsg());
		return "../member/login_ok.jsp";
	}

	@RequestMapping("member/logout.do")
	public String memeber_logout(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		session.invalidate(); // 모든 정보 해제
		return "redirect:../main/main.do";
	}
	
	@RequestMapping("member/idfind.do")
	public String member_idfind(HttpServletRequest request, HttpServletResponse response) {
		
		return "../member/idfind.jsp";
	}
	
	@RequestMapping("member/idfind_result.do")
    public String idfind_result(HttpServletRequest request, HttpServletResponse response) {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        MemberDAO dao = new MemberDAO();
        String result = dao.idFind(name, email);
        request.setAttribute("result", result);
        return "../member/result.jsp";
    }
	
	@RequestMapping("member/pwdfind.do")
	public String member_pwdfind(HttpServletRequest request, HttpServletResponse response) {
		
		return "../member/pwdfind.jsp";
	}
	
	@RequestMapping("member/pwfind2.do")
	public String pwfind(HttpServletRequest request, HttpServletResponse response) {
	        
        String id = request.getParameter("id");
        String question = request.getParameter("question");
        MemberDAO dao = new MemberDAO();
        
        request.setAttribute("id", id);
        request.setAttribute("question", question);
        return "../member/pwdfind2.jsp";
	}
	
	@RequestMapping("member/pwfind_result.do")
    public String questionfind_result(HttpServletRequest request, HttpServletResponse response) {
        
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        
        MemberDAO dao = new MemberDAO();
        String result = dao.pwFind1(name, id);
       
        request.setAttribute("result", result);
        return "../member/result.jsp";
    }
    
    // 로그인 - 비밀번호 찾기 - 답변 일치 여부
    @RequestMapping("member/pwfind2_result.do")
    public String pwfind_result(HttpServletRequest request, HttpServletResponse response) {
        
        String id = request.getParameter("id");
        String answer = request.getParameter("answer");
        
        MemberDAO dao = new MemberDAO();
        String result = dao.pwFind2(id, answer);
        
        request.setAttribute("result", result);
        return "../member/result.jsp";
    }
	
	// 회원 수정, 회원 탈퇴 => session
		@RequestMapping("member/join_update.do")
	public String member_join_update(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		MemberDAO dao = new MemberDAO();
		// DB연동
		MemberVO vo = dao.memberJoinUpdateData(id);
		String year = vo.getBirthday().substring(0,4);
		String month = vo.getBirthday().substring(5,7);
		String day = vo.getBirthday().substring(8);
		
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("vo", vo);
		return "../member/join_update.jsp";
	}
	
	@RequestMapping("member/join_update_ok.do")
	public void member_join_update_ok(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String post = request.getParameter("post");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setSex(sex);
		vo.setBirthday(year + "-" + month + "-" + day);
		vo.setPost(post);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setEmail(email);
		vo.setPhone(tel);
		
		MemberDAO dao = new MemberDAO();
		boolean bCheck = dao.memberJoinUpdate(vo);
		try {
			PrintWriter out = response.getWriter(); // 접속한 브라우저에 값을 보내겠다?
			if(bCheck == true) {
				out.println("yes");
				HttpSession session = request.getSession();
				session.setAttribute("name", vo.getName());
			} else {
				out.println("no");
			}
		} catch (Exception e) {}
	}
	
}
