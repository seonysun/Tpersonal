package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;

/*
 * private int gano,hit,group_id,group_step,group_tab;
	private String subject,type,content,pwd,ans_state,msg,dbday,id;
	private Date regdate;*/
public class ServiceDAO {
	private Connection conn;
	private PreparedStatement ps;
	//QNA 목록보기
	public ArrayList<AskVO> qnaListData(int page){
		ArrayList<AskVO> list=new ArrayList<AskVO>();
		try {
			conn=CreateConnection.getConnection();
			String sql="SELECT gano,id,subject,type,ans_state,group_tab,hit,num "
					+ "FROM (SELECT gano,id,subject,type,ans_state,group_tab,hit,rownum as num "
					+ "FROM (SELECT gano,id,subject,type,ans_state,group_tab,hit "
					+ "FROM god_ask_3 "
					+ "ORDER BY group_id DESC, group_step ASC)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=10;
			int start=rowSize*(page-1)+1;
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				AskVO vo=new AskVO();
				vo.setGano(rs.getInt(1));
				vo.setId(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setType(rs.getString(4));
				vo.setAns_state(rs.getString(5));
				vo.setGroup_tab(rs.getInt(6));
				vo.setHit(rs.getInt(7));
				list.add(vo);
			}
			rs.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return list;
	}
	//QNA 목록 번호
	public int qnaRowCount(){
		int total=0;
		try {
			conn=CreateConnection.getConnection();
			String sql="";
			ps=conn.prepareStatement(sql);
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return total;
	}
	//QNA 상세보기
	public AskVO qnaDetailData(int no, int type) {
		AskVO vo=new AskVO();
		try {
			conn=CreateConnection.getConnection();
			String sql="";
			ps=conn.prepareStatement(sql);
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return vo;
	}
	//QNA 작성
	public void qnaInsert(AskVO vo) {
		try {
			conn=CreateConnection.getConnection();
			String sql="";
			ps=conn.prepareStatement(sql);
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
	}
	//QNA 답변
	public void qnaReplyInsert(int no, String id) {
		try {
			conn=CreateConnection.getConnection();
			String sql="";
			ps=conn.prepareStatement(sql);
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
	}
	//QNA 수정
	public void qnaUpdate(AskVO vo) {
		try {
			conn=CreateConnection.getConnection();
			String sql="";
			ps=conn.prepareStatement(sql);
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
	}
	//QNA 삭제
	public void qnaDelete(int no, String pwd) {
		try {
			conn=CreateConnection.getConnection();
			String sql="";
			ps=conn.prepareStatement(sql);
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
	}
}
