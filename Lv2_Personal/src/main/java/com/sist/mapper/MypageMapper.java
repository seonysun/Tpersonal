package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;

public interface MypageMapper {
	//보낸 쪽지 목록
//	@Select("SELECT tno,id,msg,receiver,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,ok,TO_CHAR(recvdate,'YYYY-MM-DD') as recvday,nickname,num "
//			+ "FROM (SELECT tno,id,msg,receiver,regdate,ok,recvdate,nickname,rownum as num "
//			+ "FROM (SELECT tno,id,msg,receiver,regdate,ok,recvdate,nickname "
//			+ "FROM ch_text_2_3 "
//			+ "WHERE id=#{id} "
//			+ "ORDER BY tno)) "
//			+ "WHERE num BETWEEN #{start} AND #{end}")
//	public List<TextVO> myTextsList(Map map);
	
	@Select("SELECT tno,id,msg,receiver,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,ok,TO_CHAR(recvdate,'YYYY-MM-DD') as recvday,nickname "
			+ "FROM ch_text_2_3 "
			+ "WHERE id=#{id} "
			+ "ORDER BY tno")
	public List<TextVO> myTextsList(String id);

	@Select("SELECT CEIL(COUNT(*)/10.0) FROM ch_text_2_3 "
			+ "WHERE id=#{id}")
	public int stextTotalPage(String id);

	//받은 쪽지 목록
//	@Select("SELECT tno,id,msg,receiver,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,ok,TO_CHAR(recvdate,'YYYY-MM-DD') as recvday,nickname,num "
//			+ "FROM (SELECT tno,id,msg,receiver,regdate,ok,recvdate,nickname,rownum as num "
//			+ "FROM (SELECT tno,id,msg,receiver,regdate,ok,recvdate,nickname "
//			+ "FROM ch_text_2_3 "
//			+ "WHERE receiver=#{receiver} "
//			+ "ORDER BY tno)) "
//			+ "WHERE num BETWEEN #{start} AND #{end}")
//	public List<TextVO> myTextrList(Map map);
	
	@Select("SELECT tno,id,msg,receiver,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,ok,TO_CHAR(recvdate,'YYYY-MM-DD') as recvday,nickname "
			+ "FROM ch_text_2_3 "
			+ "WHERE receiver=#{receiver} "
			+ "ORDER BY tno")
	public List<TextVO> myTextrList(String receiver);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM ch_text_2_3 "
			+ "WHERE receiver=#{receiver}")
	public int rtextTotalPage(String receiver);
	
	//쪽지 확인
	@Update("UPDATE ch_text_2_3 "
			+ "SET ok='y',recvdate=sysdate "
			+ "WHERE tno=#{tno}")
	public void myTextCheck(int tno);
	
	@Select("SELECT tno,id,msg,receiver,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,ok,TO_CHAR(recvdate,'YYYY-MM-DD') as recvday,nickname "
			+ "FROM ch_text_2_3 "
			+ "WHERE tno=#{tno}")
	public TextVO myTextDetail(int tno);
	
	//쪽지 보내기
	@SelectKey(keyProperty = "tno", resultType = int.class, before = true, 
			statement = "SELECT NVL(MAX(tno)+1,1) as tno FROM ch_text_2_3")
	@Insert("INSERT INTO ch_text_2_3 "
			+ "VALUES(#{tno},#{id},#{msg},#{receiver},sysdate,'n',null,#{nickname})")
	public void textInsert(TextVO vo);
	
	//쪽지 삭제
	@Delete("DELETE FROM ch_text_2_3 "
			+ "WHERE tno=#{tno}")
	public void textDelete(int tno);
	
	//내 강의실
	@Results({
		@Result(property = "dvo.title", column = "title"),
		@Result(property = "dvo.image", column = "image")
	})
	@Select("SELECT crno,cno,title,image,schedule,place,inwon,totalprice,tutormsg,num "
			+ "FROM (SELECT crno,cno,title,image,schedule,place,inwon,totalprice,tutormsg,rownum as num "
			+ "FROM (SELECT cr.crno,cr.cno,cd.title,cd.image,cr.schedule,cr.place,cr.inwon,cr.totalprice,cr.tutormsg "
			+ "FROM ch_reserve_2_3 cr, ch_classdetail_2_3 cd "
			+ "WHERE cr.cno=cd.cno "
			+ "AND id=#{id} "
			+ "ORDER BY crno DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<ReserveVO> myReserve(Map map);
	
	@Select("SELECT COUNT(*) FROM ch_reserve_2_3 "
			+ "WHERE id=#{id}")
	public int myReserveCount(String id);
	
	@Select("SELECT CEIL(COUNT(*)/2.0) FROM ch_reserve_2_3 "
			+ "WHERE id=#{id}")
	public int myReserveTotalPage(String id);
	
	//강의 신청 목록
	@Select("SELECT crno,cno,id,schedule,place,inwon,totalprice,tutormsg,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,num "
			+ "FROM (SELECT crno,cno,id,schedule,place,inwon,totalprice,tutormsg,regdate,rownum as num "
			+ "FROM (SELECT crno,cno,id,schedule,place,inwon,totalprice,tutormsg,regdate "
			+ "FROM ch_reserve_2_3 "
			+ "WHERE id=#{id} "
			+ "ORDER BY crno)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<ReserveVO> myReserveList(Map map);
	
	@Select("SELECT * FROM ch_reserve_2_3 "
			+ "WHERE crno=#{crno}")
	public ReserveVO myReserveDetail(int crno);
	
	//신청 강의 상세
	@Select("SELECT cno FROM ch_reserve_2_3 "
			+ "WHERE id=#{id}")
	public int[] reserveClassList(String id);
	
	@Select("SELECT * FROM ch_classdetail_2_3 "
			+ "WHERE cno=#{cno}")
	public ClassDetailVO reserveClassDetail(int cno);
	
	//커뮤니티
	@Select("SELECT bno,btype,id,title,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,tag,num "
			+ "FROM (SELECT bno,btype,id,title,content,regdate,hit,tag,rownum as num "
			+ "FROM (SELECT bno,btype,id,title,content,regdate,hit,tag "
			+ "FROM ch_board_2_3 "
			+ "WHERE id=#{id} "
			+ "ORDER BY bno)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<BoardVO> myBoardList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM ch_board_2_3 "
			+ "WHERE id=#{id}")
	public int BoardTotalPage(Map map);
	
	//리뷰
	@Select("SELECT rno,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,content,id,cno,num "
			+ "FROM (SELECT rno,regdate,content,id,cno,rownum as num "
			+ "FROM (SELECT rno,regdate,content,id,cno "
			+ "FROM ch_review_2_3 "
			+ "WHERE id=#{id} "
			+ "ORDER BY rno)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<ReviewVO> myReviewList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM ch_review_2_3 "
			+ "WHERE id=#{id}")
	public int reviewTotalPage(Map map);
	
	@Delete("DELETE FROM ch_review_2_3 "
			+ "WHERE rno=#{rno}")
	public void reviewDelete(int rno);
	
	//댓글
	@Select("SELECT brno,bno,id,msg,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,group_id,group_step,group_tab,root,depth,num "
			+ "FROM (SELECT brno,bno,id,msg,regdate,group_id,group_step,group_tab,root,depth,rownum as num "
			+ "FROM (SELECT brno,bno,id,msg,regdate,group_id,group_step,group_tab,root,depth "
			+ "FROM ch_boardreply_2_3 "
			+ "WHERE id=#{id} "
			+ "ORDER BY brno)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<BoardReplyVO> myReplyList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM ch_boardreply_2_3 "
			+ "WHERE id=#{id}")
	public int replyTotalPage(Map map);
	
	//강의 신청
	@Insert("INSERT INTO ch_classdetail_2_3 "
			+ "VALUES(ch_cd_cno_seq_2_3.nextval,#{title},#{image},#{place},#{location},#{schedule},#{notice},#{time},#{perPrice},#{totalprice},#{jjim_count},#{cateno},#{tno},"
			+ "#{detail_cateno},#{summary},#{target},#{tutor_intro},#{class_intro},#{class_curri},#{class_video},#{onoff},#{inwon},#{tutor_info_nickname},#{tutor_info_img},#{tutor_info_grade_total},'n')")
	public void classInsert(ClassDetailVO vo);
}