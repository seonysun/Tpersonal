package com.sist.dao;
import java.util.*;
import com.sist.vo.*;
import com.sist.mapper.*;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDAO {
	@Autowired
	private MypageMapper mapper;
	
	//보낸 쪽지
	public List<TextVO> myTextsList(Map map){
		return mapper.myTextsList(map);
	}
	public int stextTotalPage(Map map) {
		return mapper.stextTotalPage(map);
	}
	
	//받은 쪽지
	public List<TextVO> myTextrList(Map map){
		return mapper.myTextrList(map);
	}
	public int rtextTotalPage(Map map) {
		return mapper.rtextTotalPage(map);
	}
	
	//쪽지 확인
	public TextVO myTextDetail(int tno) {
		mapper.myTextCheck(tno);
		return mapper.myTextDetail(tno);
	}
	
	//쪽지 보내기
	public void textInsert(TextVO vo) {
		mapper.textInsert(vo);
	}
	
	//내 강의
	public List<ReserveVO> myReserveList(Map map){
		return mapper.myReserveList(map);
	}
	public int myReserveCount(Map map) {
		return mapper.myReserveCount(map);
	}
}
