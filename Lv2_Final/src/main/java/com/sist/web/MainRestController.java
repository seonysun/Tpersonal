package com.sist.web;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.MainDAO;
import com.sist.vo.ClassDetailVO;

@RestController
public class MainRestController {
	@Autowired
	private MainDAO dao;
	
//	@Select("SELECT cno,jjim_count,title,image,perprice,tutor_info_nickname,tutor_info_grade_total,rownum "
//	+ "FROM (SELECT cno,jjim_count,title,image,perprice,tutor_info_nickname "
//	+ "FROM ch_classdetail_2_3 ORDER BY jjim_count DESC) "
//	+ "WHERE rownum <=5")
//public List<ClassDetailVO> nowPopularClass(){
//return mapper.nowPopularClass();
//}
	//로그인창 밑 인기리스트
	@GetMapping(value="main/nowPopular_vue.do",produces="text/plain;charset=utf-8")
	public String nowPopularClass(){
		List<ClassDetailVO> list=dao.nowPopularClass();
		
		JSONArray arr=new JSONArray();
		for(ClassDetailVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("cno", vo.getCno());
			obj.put("jjim_count", vo.getJjim_count());
			obj.put("title", vo.getTitle());
			obj.put("tutor_info_grade_total", vo.getTutor_info_grade_total());
			String image=vo.getImage();
	        int size=image.indexOf("^");
	        if(size<0){
	            image=image;
	        }else{
	            image=image.substring(0,image.indexOf("^"));
	        }
	         
	        obj.put("image", image);
	        arr.add(obj);
		}
		return arr.toJSONString();
	}
	
	@GetMapping(value="main/popularDance_vue.do",produces="text/plain;charset=utf-8")
	public String popularDanceClass(){
		List<ClassDetailVO> list=dao.popularDanceClass();
		JSONArray arr=new JSONArray();
		for(ClassDetailVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("cno", vo.getCno());
			obj.put("jjim_count", vo.getJjim_count());
			obj.put("title", vo.getTitle());
			obj.put("tutor_info_nickname", vo.getTutor_info_nickname());
			
			String perprice=vo.getPerprice();
			perprice=perprice.substring(0,perprice.indexOf(" "));
			obj.put("perprice", perprice);
			obj.put("tutor_info_grade_total", vo.getTutor_info_grade_total());
			String image=vo.getImage();
			int size=image.indexOf("^");
			if(size<0){
				image=image;
			}else{
				image=image.substring(0,image.indexOf("^"));
			}
			if(image.contains("amazonaws")) {
				image="noimage.jpg";
			}
			obj.put("image", image);
			arr.add(obj);
		}
		return arr.toJSONString();
	}
	//취업 이직
	@GetMapping(value="main/popular_get_job_vue.do",produces="text/plain;charset=utf-8")
	public String popularGetJobClass(){
		List<ClassDetailVO> list=dao.popularGetJobClass();
		JSONArray arr=new JSONArray();
		for(ClassDetailVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("cno", vo.getCno());
			obj.put("jjim_count", vo.getJjim_count());
			obj.put("title", vo.getTitle());
			obj.put("tutor_info_nickname", vo.getTutor_info_nickname());
			
			String perprice=vo.getPerprice();
			perprice=perprice.substring(0,perprice.indexOf(" "));
			obj.put("perprice", perprice);
			obj.put("tutor_info_grade_total", vo.getTutor_info_grade_total());
			String image=vo.getImage();
			int size=image.indexOf("^");
			if(size<0){
				image=image;
			}else{
				image=image.substring(0,image.indexOf("^"));
			}
			if(image.contains("amazonaws")) {
				image="noimage.jpg";
			}
			obj.put("image", image);
			arr.add(obj);
		}
		return arr.toJSONString();
	}
	
	//높은평점 피트니스
	@GetMapping(value="main/popular_fit_vue.do",produces="text/plain;charset=utf-8")
	public String popularFitClass(){
		List<ClassDetailVO> list=dao.popularFitClass();
		JSONArray arr=new JSONArray();
		for(ClassDetailVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("cno", vo.getCno());
			obj.put("jjim_count", vo.getJjim_count());
			obj.put("title", vo.getTitle());
			obj.put("tutor_info_nickname", vo.getTutor_info_nickname());
			
			String perprice=vo.getPerprice();
			perprice=perprice.substring(0,perprice.indexOf(" "));
			obj.put("perprice", perprice);
			obj.put("tutor_info_grade_total", vo.getTutor_info_grade_total());
			String image=vo.getImage();
			int size=image.indexOf("^");
			if(size<0){
				image=image;
			}else{
				image=image.substring(0,image.indexOf("^"));
			}
			if(image.contains("amazonaws")) {
				image="noimage.jpg";
			}
			obj.put("image", image);
			arr.add(obj);
		}
		return arr.toJSONString();
	}
	
	//높은평점 운세
	@GetMapping(value="main/popular_fortune_vue.do",produces="text/plain;charset=utf-8")
	public String popularFortuneClass(){
		List<ClassDetailVO> list=dao.popularFortuneClass();
		JSONArray arr=new JSONArray();
		for(ClassDetailVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("cno", vo.getCno());
			obj.put("jjim_count", vo.getJjim_count());
			obj.put("title", vo.getTitle());
			obj.put("tutor_info_nickname", vo.getTutor_info_nickname());
			
			String perprice=vo.getPerprice();
			perprice=perprice.substring(0,perprice.indexOf(" "));
			obj.put("perprice", perprice);
			obj.put("tutor_info_grade_total", vo.getTutor_info_grade_total());
			String image=vo.getImage();
			int size=image.indexOf("^");
			if(size<0){
				image=image;
			}else{
				image=image.substring(0,image.indexOf("^"));
			}
			if(image.contains("amazonaws")) {
				image="noimage.jpg";
			}
			obj.put("image", image);
			arr.add(obj);
		}
		return arr.toJSONString();
	}
}
