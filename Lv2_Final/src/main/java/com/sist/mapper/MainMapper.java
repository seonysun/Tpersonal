package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
/*
 * private int cno,jjim_count,cateno,tno,detail_cateno;
	private double tutor_info_grade_total;
	private String title,image,place,location,schedule,notice,time,
					perprice,totalprice,summary,target,tutor_intro,class_intro,
					class_curri,class_video,onoff,inwon,tutor_info_nickname,tutor_info_img;
 */

import com.sist.vo.ClassDetailVO;
public interface MainMapper {
	//최다 찜 리스트
	@Select("SELECT cno,jjim_count,title,image,tutor_info_grade_total,num "
			+ "FROM (SELECT cno,jjim_count,title,image,tutor_info_grade_total,rownum as num "
			+ "FROM ch_classdetail_2_3 ORDER BY jjim_count DESC) "
			+ "WHERE num BETWEEN 5 AND 10")
	public List<ClassDetailVO> nowPopularClass();
	
	//높은평점 댄스 리스트
	@Select("SELECT cno,jjim_count,title,image,tutor_info_grade_total,tutor_info_nickname,perprice,num "
			+ "FROM (SELECT cno,jjim_count,title,image,tutor_info_grade_total,tutor_info_nickname,perprice,rownum as num "
			+ "FROM ch_classdetail_2_3 WHERE detail_cateno=14 ORDER BY tutor_info_grade_total DESC) "
			+ "WHERE num BETWEEN 1 AND 20")
	public List<ClassDetailVO> popularDanceClass();
	
	//높은평점 취업 리스트
	@Select("SELECT cno,jjim_count,title,image,tutor_info_grade_total,tutor_info_nickname,perprice,num "
			+ "FROM (SELECT cno,jjim_count,title,image,tutor_info_grade_total,tutor_info_nickname,perprice,rownum as num "
			+ "FROM ch_classdetail_2_3 WHERE detail_cateno=1 ORDER BY tutor_info_grade_total DESC) "
			+ "WHERE num BETWEEN 1 AND 20")
	public List<ClassDetailVO> popularGetJobClass();
	
	//높은평점 피트니스 리스트
	@Select("SELECT cno,jjim_count,title,image,tutor_info_grade_total,tutor_info_nickname,perprice,num "
			+ "FROM (SELECT cno,jjim_count,title,image,tutor_info_grade_total,tutor_info_nickname,perprice,rownum as num "
			+ "FROM ch_classdetail_2_3 WHERE detail_cateno=16 ORDER BY tutor_info_grade_total DESC) "
			+ "WHERE num BETWEEN 1 AND 20")
	public List<ClassDetailVO> popularFitClass();
	
	//높은평점 운세 리스트
	@Select("SELECT cno,jjim_count,title,image,tutor_info_grade_total,tutor_info_nickname,perprice,num "
			+ "FROM (SELECT cno,jjim_count,title,image,tutor_info_grade_total,tutor_info_nickname,perprice,rownum as num "
			+ "FROM ch_classdetail_2_3 WHERE REGEXP_LIKE(title,'타로|손금|사주|관상|사주') AND NOT REGEXP_LIKE(title,'기타|단타') ORDER BY tutor_info_grade_total DESC) "
			+ "WHERE num BETWEEN 1 AND 20")
	public List<ClassDetailVO> popularFortuneClass();
}
