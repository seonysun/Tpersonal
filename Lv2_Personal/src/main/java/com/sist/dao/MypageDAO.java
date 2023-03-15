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
	public List<TextVO> myTextsList(String id){
		return mapper.myTextsList(id);
	}
	public int stextTotalPage(String id) {
		return mapper.stextTotalPage(id);
	}
	
	//받은 쪽지
	public List<TextVO> myTextrList(String receiver){
		return mapper.myTextrList(receiver);
	}
	public int rtextTotalPage(String receiver) {
		return mapper.rtextTotalPage(receiver);
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
	
	//강의 신청 목록
	public List<ReserveVO> myReserveList(Map map){
		return mapper.myReserveList(map);
	}
	public int myReserveCount(Map map) {
		return mapper.myReserveCount(map);
	}
	public ReserveVO myReserveDetail(int crno) {
		return mapper.myReserveDetail(crno);
	}
	
	//신청 강의 상세
	public int[] reserveClassList(String id) {
		return mapper.reserveClassList(id);
	}
	public ClassDetailVO reserveClassDetail(int cno) {
		return mapper.reserveClassDetail(cno);
	}
	
	//커뮤니티
	public List<BoardVO> myBoardList(Map map){
		return mapper.myBoardList(map);
	}
	public int BoardTotalPage(Map map) {
		return mapper.BoardTotalPage(map);
	}
}
