package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.sist.dao.*;
import com.sist.vo.*;
@RestController
public class ClassRestController {
	
   @Autowired
   private ClassService service;
   

  
   @GetMapping(value="class/class_cate_vue.do",produces="text/plain;charset=utf-8")
	public String class_cate_vue() {
		List<CategoryVO> list=service.classCateData();
	     JSONArray arr=new JSONArray();
	     for(CategoryVO vo:list)
	     {
	        JSONObject obj=new JSONObject();
	        obj.put("cateno", vo.getCateno());
	        obj.put("catename", vo.getCatename());
	        arr.add(obj);
	     }
	    return arr.toJSONString();
	}
	
	@GetMapping(value="class/class_detail_cate_vue.do",produces="text/plain;charset=utf-8")
	public String class_detail_cate_vue(int cateno) {
		List<CategoryDetailVO> list=service.classCateDetailData(cateno);
		JSONArray arr=new JSONArray();
		for(CategoryDetailVO vo:list)
		{
			JSONObject obj=new JSONObject();
			obj.put("cateno", vo.getCateno());
			obj.put("detail_cateno", vo.getDetail_cateno());
			obj.put("detail_catename", vo.getDetail_catename());
			arr.add(obj);
		}
		return arr.toJSONString();
	}
	
	@GetMapping(value="class/class_list_vue.do",produces="text/plain;charset=utf-8")
	public String class_list_vue(int cateno,int detail_cateno,String page)
	{
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		System.out.println("page="+page);
		System.out.println("detail_cateno"+detail_cateno);
		System.out.println("cateno"+cateno);
		Map map=new HashMap();
		map.put("cateno", cateno);
		map.put("detail_cateno", detail_cateno);
		map.put("start", (curpage*16)-15);
		map.put("end", curpage*16);
		System.out.println((curpage*16)-15);
		System.out.println(curpage*16);
		List<ClassDetailVO> list=service.classListData(map);
		
		int totalpage=service.classTotalPage(map);
		String count=service.classRowCount(map);
		map.put("count", count);
	    final int BLOCK=3;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			  endPage=totalpage;
		  
		  int i=0;

		JSONArray arr=new JSONArray();
		for(ClassDetailVO vo:list)
		{
			//cno,title,image,location,perprice,jjim_count,cateno,
			//detail_cateno,onoff,tutor_info_nickname
			
			JSONObject obj=new JSONObject();
			obj.put("cno", vo.getCno());
			obj.put("title", vo.getTitle());
			obj.put("cateno", vo.getCateno());
			obj.put("detail_cateno", vo.getDetail_cateno());

			/* obj.put("location", vo.getLocation()); */

			String location=vo.getLocation();
			if(location==null)
			{
				location=location;
			}
			else
			{
				location=location.replace("^", ",");
			}
			
			obj.put("location", location);

			String perprice=vo.getPerprice();
			perprice=perprice.substring(0,perprice.indexOf("/"));
			perprice=perprice.substring(0,perprice.lastIndexOf(" "));
			obj.put("perprice", perprice);
			obj.put("jjim_count", vo.getJjim_count());
			obj.put("onoff", vo.getOnoff());
			obj.put("tutor_info_nickname", vo.getTutor_info_nickname());
			String image=vo.getImage();
			int size=image.indexOf("^");
			if(size<0)
			{
				image=image;
			}
			else
			{
				image=image.substring(0,image.indexOf("^"));
				
				  if(image.contains("amazonaws")) { 
					  image="../images/noimg.jpg";
				  }
				 
			}
			
			obj.put("image", image);
			obj.put("catename", vo.getCatename());
			obj.put("detail_catename", vo.getDetail_catename());
			if(i==0)
			{
				obj.put("curpage", curpage);
				  obj.put("totalpage", totalpage);
				  obj.put("startPage", startPage);
				  obj.put("endPage", endPage);
				  obj.put("count", count);
			}
			System.out.println(image);
			arr.add(obj);
			i++;
			System.out.println(vo.getDetail_catename());
			System.out.println(vo.getCatename());
		}
		return arr.toJSONString();
	}
   
   @GetMapping(value="class/cookie_data_vue.do",produces = "text/plain;charset=UTF-8")
   public String class_cookie_data(HttpServletRequest request)
   {
      Cookie[] cookies=request.getCookies();
      List<ClassDetailVO> list=new ArrayList<ClassDetailVO>();
      if(cookies!=null)
      {
         for(int i=cookies.length-1;i>=0;i--)
         {
            if(cookies[i].getName().startsWith("classHaru"))
            {
               String cno=cookies[i].getValue();
               ClassDetailVO vo=service.classDetailData(Integer.parseInt(cno));
               list.add(vo);
            }
         }
      }
      JSONArray arr=new JSONArray();
      int i=0;
      for(ClassDetailVO vo:list)
      {
         if(i>5) break;
         JSONObject obj=new JSONObject();
         obj.put("cno", vo.getCno());
         obj.put("cateno", vo.getCateno());
         obj.put("detail_cateno", vo.getDetail_cateno());
         obj.put("title", vo.getTitle());
         obj.put("image", vo.getImage());

         arr.add(obj);
         i++;
      }
      return arr.toJSONString();
   }
   

   
   @GetMapping(value="class/class_detail_vue.do",produces = "text/plain;charset=UTF-8")
   public String class_detail_vue(int cno)
   {
      ClassDetailVO vo=service.classDetailData(cno);

      JSONObject obj=new JSONObject();
      obj.put("cno", vo.getCno());
      obj.put("cateno", vo.getCateno());
      obj.put("detail_cateno", vo.getDetail_cateno());
      obj.put("title", vo.getTitle());
      String image=vo.getImage();
      int size=image.indexOf("^");
      if(image.contains("aws"))
      {
    	  image="noimg";
      }
      else 
      {
    	  if(size<0)
	      {
	         image=image;
	      }
	      else
	      {
	         image=image.substring(0,image.indexOf("^"));
	      }
      }
      
      obj.put("image", image);

      obj.put("tno", vo.getTno());
      
//      String place=vo.getPlace();
//      if(place==null)
//      {
//    	  place=place;
//      }
//      else
//      {
//    	  place=place.substring(0,place.indexOf("^"));
//      }
//      obj.put("place", place);
//      
//      String location=vo.getLocation();
//      if(location==null)
//      {
//    	  location=location;
//      }
//      else
//      {
//    	  location=location.substring(0,location.indexOf("^"));
//      }
//      
//      String[] locas=vo.getLocation().split("^");
      
      
      //추가작업
      String[] schedule=vo.getSchedule().replace("^","#").split("#");
      JSONArray arr1=new JSONArray();
      for(String s:schedule)
      {
         arr1.add(s);
      }
      String[] place=vo.getPlace().replace("^","#").split("#");
      JSONArray arr2=new JSONArray();
      for(String p:place)
      {
         arr2.add(p);
      }
      String[] location=vo.getLocation().replace("^","#").split("#");
      JSONArray arr3=new JSONArray();
      for(String lo:location)
      {
         arr3.add(lo);
      }
      
      
      obj.put("schedule",arr1);
      obj.put("place",arr2);
      obj.put("location", arr3);
      
//      String schedule=vo.getSchedule();
//        schedule=schedule.substring(0,schedule.indexOf("^"));
      obj.put("schedule", vo.getSchedule()); //0
      obj.put("notice", vo.getNotice()); //0
      obj.put("time", vo.getTime());
      obj.put("perprice", vo.getPerprice());
      obj.put("totalprice", vo.getTotalprice());
      obj.put("summary", vo.getSummary()); //0
      obj.put("target", vo.getTarget());
      obj.put("tutor_intro", vo.getTutor_intro());
      obj.put("class_intro", vo.getClass_intro());
      obj.put("class_curri", vo.getClass_curri()); //0
      obj.put("class_video", vo.getClass_video());
      obj.put("onoff", vo.getOnoff());//0
      obj.put("inwon", vo.getInwon());
      obj.put("tutor_info_nickname", vo.getTutor_info_nickname());
      obj.put("tutor_info_img", vo.getTutor_info_img());
      obj.put("tutor_info_grade_total",vo.getTutor_info_grade_total());
      obj.put("jjim_count", vo.getJjim_count());

      return obj.toJSONString();
   }
   

//   @GetMapping(value="class/class_reviewListData_vue.do",produces="text/plain;charset=UTF-8")
//   public String class_reviewListData(int cno) {
//	   
//   }
}
