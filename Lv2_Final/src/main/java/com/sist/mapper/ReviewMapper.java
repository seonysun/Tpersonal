package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.ReviewVO;

public interface ReviewMapper {
	
	@Select("SELECT rno,cno,id,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday "
			+ "FROM ch_review_2_3 WHERE cno=#{cno} ORDER BY rno DESC")
	public List<ReviewVO> reviewListData(int cno);
}
