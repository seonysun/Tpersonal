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
	
	@GetMapping(value = "mypage/class_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String class_list_vue(int page, String id) {
		Map map=new HashMap();
		map.put("start", (page*3)-2);
		map.put("end", page*3);
		map.put("id", id);
		List<ReserveVO> list=dao.myReserveList(map);
		int totalpage=dao.myReserveCount(map);
		JSONArray arr=new JSONArray();
		int i=0;
		for(ReserveVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("id", vo.getId());
			obj.put("crno", vo.getCrno());
			obj.put("cno", vo.getCno());
			obj.put("inwon", vo.getInwon());
			obj.put("has_schedule", vo.getHas_schedule());
			obj.put("cdate", vo.getCdate());
			obj.put("ctime", vo.getCtime());
			obj.put("msg", vo.getMsg());
			if(i==0) {
				obj.put("curpage", page);
				obj.put("totalpage", totalpage);
			}
			i++;
			arr.add(obj);
		}
		return arr.toJSONString();
	}
	
	@GetMapping(value = "mypage/jjim_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String jjim_list_vue(int page) {
		return "";
	}
	
	@GetMapping(value = "mypage/commu_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String commu_list_vue(int page) {
		return "";
	}
	
	@GetMapping(value = "mypage/reply_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String reply_list_vue(int page) {
		return "";
	}
	
	@GetMapping(value = "mypage/review_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String review_list_vue(int page) {
		return "";
	}
}
