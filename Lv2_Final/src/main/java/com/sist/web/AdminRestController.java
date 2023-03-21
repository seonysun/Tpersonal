package com.sist.web;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AdminRestController {
	@Autowired
	private AdminDAO dao;
	
	@GetMapping(value = "adminpage/faq_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String faq_list_vue(int page) {
		Map map=new HashMap();
		map.put("start", (page*10)-9);
		map.put("end", page*10);
		List<FAQVO> list=dao.faqList(map);
		int totalpage=dao.faqTotalPage();
		
		final int BLOCK=5;
		int startpage=(page-1)/BLOCK*BLOCK+1;
		int endpage=(page-1)/BLOCK*BLOCK+BLOCK;
		if(endpage>totalpage) endpage=totalpage;
		
		JSONArray arr=new JSONArray();
		int i=0;
		for(FAQVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("no", vo.getNo());
			obj.put("cate_no", vo.getCate_no());
			obj.put("subject", vo.getSubject());
			obj.put("content", vo.getContent());
			obj.put("ano", vo.getAno());
			obj.put("dbday", vo.getDbday());
			obj.put("name", vo.getName());
			obj.put("hit", vo.getHit());
			if(i==0) {
				obj.put("curpage", page);
				obj.put("totalpage", totalpage);
				obj.put("startpage", startpage);
				obj.put("endpage", endpage);
			}
			i++;
			arr.add(obj);
		}
		return arr.toJSONString();
	}
	
	@GetMapping(value = "adminpage/notice_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String notice_list_vue(int page) {
		Map map=new HashMap();
		map.put("start", (page*10)-9);
		map.put("end", page*10);
		List<BoardVO> list=dao.noticeList(map);
		int totalpage=dao.noticeTotalPage();
		
		final int BLOCK=5;
		int startpage=(page-1)/BLOCK*BLOCK+1;
		int endpage=(page-1)/BLOCK*BLOCK+BLOCK;
		if(endpage>totalpage) endpage=totalpage;
		
		JSONArray arr=new JSONArray();
		int i=0;
		for(BoardVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("bno", vo.getBno());
			obj.put("btype", vo.getBtype());
			obj.put("id", vo.getId());
			obj.put("title", vo.getTitle());
			obj.put("dbday", vo.getDbday());
			obj.put("hit", vo.getHit());
			obj.put("tag", vo.getTag());
			if(i==0) {
				obj.put("curpage", page);
				obj.put("totalpage", totalpage);
				obj.put("startpage", startpage);
				obj.put("endpage", endpage);
			}
			i++;
			arr.add(obj);
		}
		return arr.toJSONString();
	}

	@GetMapping(value = "adminpage/class_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String class_list_vue(int page) {
		Map map=new HashMap();
		map.put("start", (page*4)-3);
		map.put("end", page*4);
		List<ClassDetailVO> list=dao.classList(map);
		int totalpage=dao.classTotalPage();
		
		JSONArray arr=new JSONArray();
		int i=0;
		for(ClassDetailVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("cno", vo.getCno());
			obj.put("title", vo.getTitle());
			String image=vo.getImage();
			int isize=image.indexOf("^");
	        if(isize<0) {
	            image=image;
	        } else {
	            image=image.substring(0,image.indexOf("^"));
	        }
	        obj.put("image", image);

			String location=vo.getLocation();
			int lsize=location.indexOf("^");
			if(lsize<0) {
				location=location;
			} else {
				location=location.substring(0,location.indexOf("^"));
			}
			obj.put("location", location);
			
			String price=vo.getPerprice();
			price=price.substring(0, price.indexOf("원"));
			obj.put("perprice", price);
			obj.put("jjim_count", vo.getJjim_count());
			obj.put("cateno", vo.getCateno());
			obj.put("detail_cateno", vo.getDetail_cateno());
			obj.put("onoff", vo.getOnoff());
			obj.put("tutor_info_nickname", vo.getTutor_info_nickname());
			if(i==0) {
				obj.put("curpage", page);
				obj.put("totalpage", totalpage);
			}
			i++;
			arr.add(obj);
		}
		return arr.toJSONString();
	}

	@GetMapping(value = "adminpage/class_ok_vue.do", produces = "text/plain;charset=UTF-8")
	public void class_ok_vue(int cno) {
		dao.classConfirm(cno);
	}
	
	@GetMapping(value = "adminpage/member_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String member_list_vue(int page) {
		Map map=new HashMap();
		map.put("start", (page*8)-7);
		map.put("end", page*8);
		List<MemberVO> list=dao.memberList(map);
		int totalpage=dao.memberTotalPage();
		
		JSONArray arr=new JSONArray();
		int i=0;
		for(MemberVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("id", vo.getId());
			obj.put("tel", vo.getTel());
			obj.put("name", vo.getName());
			obj.put("nickname", vo.getNickname());
			obj.put("image", vo.getImage());
			obj.put("tutor", vo.getTutor());
			if(i==0) {
				obj.put("curpage", page);
				obj.put("totalpage", totalpage);
			}
			i++;
			arr.add(obj);
		}
		return arr.toJSONString();
	}
	
	@GetMapping(value = "adminpage/member_detail_vue.do", produces = "text/plain;charset=UTF-8")
	public String member_detail_vue(String id) {
		MemberVO vo=dao.memberDetail(id);
		JSONObject obj=new JSONObject();
		obj.put("id", vo.getId());
		obj.put("tel", vo.getTel());
		obj.put("name", vo.getName());
		obj.put("nickname", vo.getNickname());
		obj.put("image", vo.getImage());
		obj.put("tutor", vo.getTutor());
		obj.put("intro", vo.getIntro());
		return obj.toJSONString();
	}
	
	@GetMapping(value = "adminpage/tutor_ok_vue.do", produces = "text/plain;charset=UTF-8")
	public void tutor_ok_vue(String id) {
		dao.tutorConfirm(id);
	}
	
	@GetMapping(value = "adminpage/member_delete_vue.do", produces = "text/plain;charset=UTF-8")
	public void member_delete_vue(String id) {
		dao.memberDelete(id);
	}
	
	@GetMapping(value = "adminpage/tutor_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String tutor_list_vue(int page) {
		Map map=new HashMap();
		map.put("start", (page*4)-3);
		map.put("end", page*4);
		List<MemberVO> list=dao.tutorList(map);
		int totalpage=dao.tutorTotalPage();
		
		JSONArray arr=new JSONArray();
		int i=0;
		for(MemberVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("id", vo.getId());
			obj.put("tel", vo.getTel());
			obj.put("name", vo.getName());
			obj.put("nickname", vo.getNickname());
			obj.put("image", vo.getImage());
			obj.put("tutor", vo.getTutor());
			if(i==0) {
				obj.put("curpage", page);
				obj.put("totalpage", totalpage);
			}
			i++;
			arr.add(obj);
		}
		return arr.toJSONString();
	}
	
	@GetMapping(value = "adminpage/tutor_class_vue.do", produces = "text/plain;charset=UTF-8")
	public String tutor_class_vue(String id) {
		List<ClassDetailVO> list=dao.tutorClassList(id);
		int count=dao.tutorClassCount(id);
		
		JSONArray arr=new JSONArray();
		int i=0;
		for(ClassDetailVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("cno", vo.getCno());
			obj.put("title", vo.getTitle());
			
			String image=vo.getImage();
			int isize=image.indexOf("^");
	        if(isize<0) {
	            image=image;
	        } else {
	            image=image.substring(0,image.indexOf("^"));
	        }
	        obj.put("image", image);
	        
	        String place=vo.getPlace();
	        int psize=place.indexOf("^");
	        if(psize<0) {
	        	place=place;
	        } else {
	        	place=place.substring(0,place.indexOf("^"));
	        }
	        obj.put("place", place);
			
	        String schedule=vo.getSchedule();
			int ssize=schedule.indexOf("^");
			if(ssize<0) {
				schedule=schedule;
			} else {
				schedule=schedule.substring(0,schedule.indexOf("^"));
			}
			obj.put("schedule", schedule);

			String location=vo.getLocation();
			int lsize=location.indexOf("^");
			if(lsize<0) {
				location=location;
			} else {
				location=location.substring(0,location.indexOf("^"));
			}
			obj.put("location", location);

			obj.put("perprice", vo.getPerprice());
			obj.put("jjim_count", vo.getJjim_count());
			arr.add(obj);
		}
		return arr.toJSONString();
	}
}
