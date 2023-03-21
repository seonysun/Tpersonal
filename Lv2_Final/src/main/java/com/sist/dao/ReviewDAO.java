package com.sist.dao;
import com.sist.vo.*;

import oracle.jdbc.OracleTypes;

import com.sist.mapper.*;

import java.sql.*;
import java.util.*;

import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.StatementType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class ReviewDAO {
	@Autowired
	private ReviewMapper mapper;
	
//	@Select("SELECT rno,cno,id,content,TO_CHAR(regdate,'YYYY-MM-DD') "
//			+ "FROM ch_review_2_3 WHERE cno=#{cno} ORDER BY rno DESC")
	public List<ReviewVO> reviewListData(int cno){
		return mapper.reviewListData(cno);
	}
}