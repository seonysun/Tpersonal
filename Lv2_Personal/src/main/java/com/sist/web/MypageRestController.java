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
public class MypageRestController {
	@Autowired
	private MypageDAO dao;
	
	@GetMapping("mypage/text_insert_vue.do")
	public String text_insert_vue(TextVO vo) {
		dao.textInsert(vo);
		return "";
	}
	
	@GetMapping(value = "mypage/stext_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String stext_vue(String id) {
//		Map map=new HashMap();
//		map.put("start", (page*10)-9);
//		map.put("end", page*10);
//		map.put("id", id);
		List<TextVO> list=dao.myTextsList(id);
//		int totalpage=dao.stextTotalPage(map);
		
		JSONArray arr=new JSONArray();
//		int i=0;
		for(TextVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("tno", vo.getTno());
			obj.put("id", vo.getId());
			obj.put("nickname", vo.getNickname());
			obj.put("msg", vo.getMsg());
			obj.put("receiver", vo.getReceiver());
			obj.put("dbday", vo.getDbday());
			obj.put("recvday", vo.getRecvday());
			obj.put("ok", vo.getOk());
//			if(i==0) {
//				obj.put("curpage", page);
//				obj.put("totalpage", totalpage);
//			}
//			i++;
			arr.add(obj);
		}
		return arr.toJSONString();
	}
	
	@GetMapping(value = "mypage/rtext_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String rtext_vue(String receiver) {
//		Map map=new HashMap();
//		map.put("start", (page*10)-9);
//		map.put("end", page*10);
//		map.put("receiver", receiver);
		List<TextVO> list=dao.myTextrList(receiver);
//		int totalpage=dao.rtextTotalPage(map);
		
		JSONArray arr=new JSONArray();
//		int i=0;
		for(TextVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("tno", vo.getTno());
			obj.put("id", vo.getId());
			obj.put("nickname", vo.getNickname());
			obj.put("msg", vo.getMsg());
			obj.put("receiver", vo.getReceiver());
			obj.put("dbday", vo.getDbday());
			obj.put("recvday", vo.getRecvday());
			obj.put("ok", vo.getOk());
//			if(i==0) {
//				obj.put("curpage", page);
//				obj.put("totalpage", totalpage);
//			}
//			i++;
			arr.add(obj);
		}
		return arr.toJSONString();
	}
	
	@GetMapping(value = "mypage/text_detail_vue.do", produces = "text/plain;charset=UTF-8")
	public String text_detail(int tno) {
		TextVO vo=dao.myTextDetail(tno);
		JSONObject obj=new JSONObject();
		obj.put("tno", vo.getTno());
		obj.put("id", vo.getId());
		obj.put("nickname", vo.getNickname());
		obj.put("msg", vo.getMsg());
		obj.put("receiver", vo.getReceiver());
		obj.put("dbday", vo.getDbday());
		obj.put("recvday", vo.getRecvday());
		return obj.toJSONString();
	}
	
	@GetMapping(value = "mypage/my_reserve_vue.do", produces = "text/plain;charset=UTF-8")
	public String my_reserve_vue(int page, String id) {
		System.out.println(id);
		Map map=new HashMap();
		map.put("start", (page*3)-2);
		map.put("end", page*3);
		map.put("id", id);
		List<ReserveVO> list=dao.myReserve(map);
		int count=dao.myReserveCount(id);
		int totalpage;
		
		String res="";
		if(count>0) {
			totalpage=(int)Math.ceil(count/10.0);
			
			JSONArray arr=new JSONArray();
			int i=0;
			for(ReserveVO vo:list) {
				JSONObject obj=new JSONObject();
				obj.put("crno", vo.getCrno());
				obj.put("cno", vo.getCno());
				obj.put("dvo.title", vo.getDvo().getTitle());
				obj.put("dvo.image", vo.getDvo().getImage());
				obj.put("inwon", vo.getInwon());
				obj.put("schedule", vo.getSchedule());
				obj.put("place", vo.getPlace());
				obj.put("totalprice", vo.getTotalprice());
				obj.put("tutormsg", vo.getTutormsg());
				if(i==0) {
					obj.put("curpage", page);
					obj.put("totalpage", totalpage);
					obj.put("count", count);
				}
				i++;
				arr.add(obj);
			}
			res=arr.toJSONString();
		} else {
			JSONObject obj=new JSONObject();
			obj.put("curpage", page);
			obj.put("totalpage", 0);
			obj.put("count", 0);
			res=obj.toJSONString();
		}
		return res;
	}
	
	@GetMapping(value = "mypage/reserve_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String reserve_list_vue(int page, String id) {
		Map map=new HashMap();
		map.put("start", (page*3)-2);
		map.put("end", page*3);
		map.put("id", id);
		List<ReserveVO> list=dao.myReserveList(map);
		int count=dao.myReserveCount(id);
		int totalpage;
		if(count>0) {
			totalpage=(int)Math.ceil(count/10.0);
		} else totalpage=0; 
		JSONArray arr=new JSONArray();
		int i=0;
		for(ReserveVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("id", vo.getId());
			obj.put("crno", vo.getCrno());
			obj.put("cno", vo.getCno());
			obj.put("inwon", vo.getInwon());
			obj.put("schedule", vo.getSchedule());
			obj.put("place", vo.getPlace());
			obj.put("totalprice", vo.getTotalprice());
			obj.put("tutormsg", vo.getTutormsg());
			obj.put("dbday", vo.getDbday());
			if(i==0) {
				obj.put("curpage", page);
				obj.put("totalpage", totalpage);
				obj.put("count", count);
			}
			i++;
			arr.add(obj);
		}
		return arr.toJSONString();
	}
	
	@GetMapping(value = "mypage/reserve_class_vue.do", produces = "text/plain;charset=UTF-8")
	public String reserve_class_vue(int cno) {
		ClassDetailVO vo=dao.reserveClassDetail(cno);
		JSONObject obj=new JSONObject();
		obj.put("cno", vo.getCno());
		obj.put("title", vo.getTitle());
		obj.put("image", vo.getImage());
		obj.put("notice", vo.getNotice());
		obj.put("perprice", vo.getPerprice());
		obj.put("jjim_count", vo.getJjim_count());
		obj.put("cateno", vo.getCateno());
		obj.put("summary", vo.getSummary());
		obj.put("tutor_intro", vo.getTutor_intro());
		obj.put("tutor_info_img", vo.getTutor_info_img());
		obj.put("tutor_info_nickname", vo.getTutor_info_nickname());
		obj.put("tutor_info_grade_total", vo.getTutor_info_grade_total());
		return obj.toJSONString();
	}
	
	@GetMapping(value = "mypage/jjim_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String jjim_list_vue(int page) {
		return "";
	}
	
	@GetMapping(value = "mypage/commu_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String commu_list_vue(int page, String id) {
		Map map=new HashMap();
		map.put("start", (page*10)-9);
		map.put("end", page*10);
		map.put("id", id);
		List<BoardVO> list=dao.myBoardList(map);
		int totalpage=dao.BoardTotalPage(map);
		JSONArray arr=new JSONArray();
		int i=0;
		for(BoardVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("bno", vo.getBno());
			obj.put("btype", vo.getBtype());
			obj.put("id", vo.getId());
			obj.put("title", vo.getTitle());
			obj.put("content", vo.getContent());
			obj.put("dbday", vo.getDbday());
			obj.put("hit", vo.getHit());
			obj.put("tag", vo.getTag());
			if(i==0) {
				obj.put("curpage", page);
				obj.put("totalpage", totalpage);
			}
			i++;
			arr.add(obj);
		}
		return arr.toJSONString();
	}
	
	@GetMapping(value = "mypage/review_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String review_list_vue(int page) {
		return "";
	}
	
	@GetMapping(value = "mypage/reply_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String reply_list_vue(int page) {
		return "";
	}
}
