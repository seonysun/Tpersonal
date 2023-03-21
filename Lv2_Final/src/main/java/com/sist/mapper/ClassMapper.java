package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface ClassMapper {
	
	/*
	 * 	CNO                   NOT NULL NUMBER        
		TITLE                 NOT NULL VARCHAR2(300) 
		IMAGE                          VARCHAR2(4000) 
		PLACE                          VARCHAR2(4000) 
		LOCATION                       VARCHAR2(4000) 
		SCHEDULE                       CLOB          
		NOTICE                         CLOB          
		TIME                           VARCHAR2(100) 
		PERPRICE              NOT NULL VARCHAR2(150) 
		TOTALPRICE            NOT NULL VARCHAR2(200) 
		JJIM_COUNT                     NUMBER        
		CATENO                         NUMBER        
		TNO                            NUMBER        
		DETAIL_CATENO                  NUMBER        
		SUMMARY                        CLOB          
		TARGET                         CLOB          
		TUTOR_INTRO                    CLOB          
		CLASS_INTRO                    CLOB          
		CLASS_CURRI                    CLOB          
		CLASS_VIDEO                    CLOB          
		ONOFF                          VARCHAR2(150) 
		INWON                          VARCHAR2(30)  
		TUTOR_INFO_NICKNAME           VARCHAR2(100) 
		TUTOR_INFO_IMG                 VARCHAR2(500) 
		TUTOR_INFO_GRADE_TOTAL          NUMBER(2,1)   
	 */
	@Select("SELECT cateno,catename FROM ch_category_2_3")
	public List<CategoryVO> classCateData();
	@Select("SELECT cateno,detail_cateno,detail_catename FROM ch_category_detail_2_3 "
			+ "WHERE cateno=#{cateno}")
	public List<CategoryDetailVO> classCateDetailData(int cateno);
	
	@Select("SELECT cno,title,image,location,perprice,jjim_count,cateno,detail_cateno,onoff,tutor_info_nickname,"
			+ "(SELECT catename FROM ch_category_2_3 WHERE cateno=#{cateno}) as catename,"
			+ "(SELECT detail_catename FROM ch_category_detail_2_3 WHERE detail_cateno=#{detail_cateno}) as detail_catename,num "
			+ "FROM (SELECT cno,title,image,location,perprice,jjim_count,cateno,detail_cateno,onoff,tutor_info_nickname,"
			+ "(SELECT catename FROM ch_category_2_3 WHERE cateno=#{cateno}),"
			+ "(SELECT detail_catename FROM ch_category_detail_2_3 WHERE detail_cateno=#{detail_cateno}),rownum as num "
			+ "FROM ch_classdetail_2_3 "
			+ "WHERE cateno=#{cateno} AND detail_cateno=#{detail_cateno} "
			+ "ORDER BY cno) "
			+ "WHERE num BETWEEN #{start} and #{end}")
	public List<ClassDetailVO> classListData(Map map);
	
	@Select("SELECT cno,title,image,place,location,schedule,notice,time,perprice,totalprice,tutor_info_grade_total, "
	         + "summary,target,tutor_intro,class_intro,class_curri,class_video,onoff,inwon,tutor_info_nickname,tutor_info_img, "
	         + "jjim_count FROM CH_CLASSDETAIL_2_3 "
	         + "WHERE cno=#{cno}")
	 public ClassDetailVO classDetailData(int cno);
	

//	@Select("SELECT rno,content,heart,comment_count,curriculum,preparation,kindness,delivery,time,id,cno,TO_CHAR(regdate,'YYYY-MM-DD') as dbday "
//			+"FROM (SELECT /*+(ch_review_2_3 ch_rv_rno_pk_2_3)*/rno,content,heart,comment_count,curriculum,preparation,kindness,delivery,time,id,cno,regdate "
//			+"FROM ch_review_2_3) "
//			+"WHERE cno=#{cno}")
//	public List<ReviewVO> classReview(int cno);

	@Select("SELECT CEIL(COUNT(*)/16.0) FROM ch_classdetail_2_3 WHERE cateno=#{cateno} AND detail_cateno=#{detail_cateno}")
	public int classTotalPage(Map map);
	
	@Select("SELECT COUNT(*) FROM ch_classdetail_2_3 "
			+ "WHERE cateno=#{cateno} AND detail_cateno=#{detail_cateno}") 
	public String classRowCount(Map map);
	
	//검색
	/*@Select("SELECT fno,name,poster,score,num "
		  +"FROM (SELECT fno,name,poster,score,rownum as num "
		  +"FROM (SELECT fno,name,poster,score "
		  +"FROM food_location "
		  +"WHERE address LIKE '%'||#{address}||'%' ORDER BY fno ASC)) "
		  +"WHERE num BETWEEN #{start} AND #{end}")
   public List<FoodVO> foodLocationFindData(Map map);*/
	
//	//검색
//	@Select("SELECT cno,title,image,location,perprice,jjim_count,cateno,detail_cateno,onoff,tutor_info_nickname,rownum"
//			+ "FROM (SELECT cno,title,image,location,perprice,jjim_count,cateno,detail_cateno,onoff,tutor_info_nickname "
//			+ "FROM ch_classdetail_2_3 where title LIKE '%'||#{find}||'%' "
//			+ "WHERE rownum between #{start} and #{end}")
//	public List<ClassDetailVO> classFindList(Map map);
//	
//	//검색결과 총개수
//	@Select("SELECT COUNT(*) FROM (SELECT cno,title,image,location,perprice,jjim_count,cateno,detail_cateno,onoff,tutor_info_nickname "
//			+"FROM ch_classdetail_2_3) "
//			+"WHERE title LIKE '%'||#{find}||'%'")
//	public int classFindCount();
//	
//	//검색결과 총페이지
//	@Select("SELECT CEIL(count(*)/16.0) FROM ch_classdetail_2_3 "
//			+"WHERE title LIKE '%'||#{find}||'%'")
//	public int classFindTotalPage(String find);
	

//	@Select("SELECT rno,content,heart,comment_count,curriculum,preparation,kindness,delivery,time,id,cno,TO_CHAR(regdate,'YYYY-MM-DD') as dbday "
//			+"FROM (SELECT /*+(ch_review_2_3 ch_rv_rno_pk_2_3)*/rno,content,heart,comment_count,curriculum,preparation,kindness,delivery,time,id,cno,regdate "
//			+"FROM ch_review_2_3) "
//			+"WHERE cno=#{cno}")
//	public List<ReviewVO> classReview(int cno);
}
