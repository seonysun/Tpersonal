package com.sist.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.MainMapper;
import com.sist.vo.ClassDetailVO;

@Repository
public class MainDAO {
	@Autowired
	private MainMapper mapper;
	
//	@Select("SELECT cno,jjim_count,title,image,perprice,tutor_info_nickname,tutor_info_grade_total,rownum "
//			+ "FROM (SELECT cno,jjim_count,title,image,perprice,tutor_info_nickname "
//			+ "FROM ch_classdetail_2_3 ORDER BY jjim_count DESC) "
//			+ "WHERE rownum <=5")
	public List<ClassDetailVO> nowPopularClass(){
		return mapper.nowPopularClass();
	}
	
//	@Select("SELECT cno,jjim_count,title,image,tutor_info_grade_total,tutor_info_nickname,perprice,num "
//			+ "FROM (SELECT cno,jjim_count,title,image,tutor_info_grade_total,tutor_info_nickname,perprice,rownum as num "
//			+ "FROM ch_classdetail_2_3 ORDER BY tutor_info_grade_total DESC) "
//			+ "WHERE num BETWEEN 1 AND 20")
	public List<ClassDetailVO> popularDanceClass(){
		return mapper.popularDanceClass();
	}
	
	//높은평점 취업 리스트
//		@Select("SELECT cno,jjim_count,title,image,tutor_info_grade_total,tutor_info_nickname,perprice,num "
//				+ "FROM (SELECT cno,jjim_count,title,image,tutor_info_grade_total,tutor_info_nickname,perprice,rownum as num "
//				+ "FROM ch_classdetail_2_3 WHERE detail_cateno=1 ORDER BY tutor_info_grade_total DESC) "
//				+ "WHERE num BETWEEN 1 AND 20")
	public List<ClassDetailVO> popularGetJobClass(){
		return mapper.popularGetJobClass();
	}
	
	//높은평점 피트니스 리스트
//		@Select("SELECT cno,jjim_count,title,image,tutor_info_grade_total,tutor_info_nickname,perprice,num "
//				+ "FROM (SELECT cno,jjim_count,title,image,tutor_info_grade_total,tutor_info_nickname,perprice,rownum as num "
//				+ "FROM ch_classdetail_2_3 ORDER BY tutor_info_grade_total DESC) "
//				+ "WHERE num BETWEEN 1 AND 20")
	public List<ClassDetailVO> popularFitClass(){
		return mapper.popularFitClass();
	}
	
	//높은평점 운세 리스트
//		@Select("SELECT cno,jjim_count,title,image,tutor_info_grade_total,tutor_info_nickname,perprice,num "
//				+ "FROM (SELECT cno,jjim_count,title,image,tutor_info_grade_total,tutor_info_nickname,perprice,rownum as num "
//				+ "FROM ch_classdetail_2_3 WHERE REGEXP_LIKE(title,'타로|손금|사주|관상|사주') ORDER BY tutor_info_grade_total DESC) "
//				+ "WHERE num BETWEEN 1 AND 20")
	public List<ClassDetailVO> popularFortuneClass(){
		return mapper.popularFortuneClass();
	}
}
