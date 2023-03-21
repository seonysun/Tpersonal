package com.sist.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.MemberVO;

public interface MemberMapper {
	//로그인
	@Select("SELECT COUNT(*) FROM ch_member_2_3 "
			+"WHERE id=#{id}")
	public int memberIdCheck(String id);
	
	@Select("SELECT * FROM ch_member_2_3 "
			+"WHERE id=#{id}")
	public MemberVO memberLogin(String id);
	
	//회원가입
	@Insert("INSERT INTO ch_member_2_3(id,pwd,name) VALUES("
			+ "#{id},#{pwd},#{name})")
	public void memberInsert(MemberVO vo);
	
	//회원정보 수정
//	@Update("UPDATE ch_member_2_3 SET "
//			+ "")
}
