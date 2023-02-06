package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;

/*
GENO    NOT NULL NUMBER        
POSTER  NOT NULL VARCHAR2(260) 
TITLE   NOT NULL VARCHAR2(150) 
TITLE2           VARCHAR2(150) 
KIND             VARCHAR2(60)  
PERIOD  NOT NULL VARCHAR2(100) 
LOC     NOT NULL VARCHAR2(60)  
LOC2             VARCHAR2(100) 
AREA             VARCHAR2(200) 
AREA2            VARCHAR2(200) 
ITEM             CLOB          
HOST             VARCHAR2(450) 
URL              VARCHAR2(200) 
PRICE            CLOB          
TIME             VARCHAR2(400) 
HASHTAG          CLOB          
GOOD             NUMBER        
CONTENT          CLOB          
HIT              NUMBER   
 */

public class ReserveDAO {
  private Connection conn;
  private PreparedStatement ps;
  //예약할 전시 선택 목록
  public List<ExhibitionVO> exhibitionListData(String ed)
  {
	  List<ExhibitionVO> list=new ArrayList<ExhibitionVO>();
	  try
	  {
		  conn=CreateConnection.getConnection();
		  String sql="SELECT geno,poster,title,loc,rownum "
				    +"FROM god_exhibition_3 "
				    +"WHERE rownum<=50 AND area LIKE '%'||?||'%'";
		  ps=conn.prepareStatement(sql);
		  ps.setString(1, ed);
		  ResultSet rs=ps.executeQuery();
		  while(rs.next())
		  {
			  ExhibitionVO vo=new ExhibitionVO();
			  vo.setGeno(rs.getInt(1));
			  vo.setPoster(rs.getString(2));
			  vo.setTitle(rs.getString(3));
			  vo.setLoc(rs.getString(4));
			  list.add(vo);
		  }
		  rs.close();
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  CreateConnection.disConnection(conn, ps);
	  }
	  return list;
  }
    //예약가능일 출력
    public String reserveDayData(int geno) {
	    String period="";
		try {
			conn=CreateConnection.getConnection();
			String sql="SELECT period FROM god_exhibition_3 "
					+ "WHERE geno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, geno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			period=rs.getString(1);
			rs.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return period;
    }
    //예약가능시간 출력
    public String reserveTimeData(int grdno) {
	    String rtime="";
		try {
			conn=CreateConnection.getConnection();
			String sql="SELECT rtime FROM god_reserve_date_3 "
					+ "WHERE grdno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, grdno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			rtime=rs.getString(1);
			rs.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return rtime;
	}
    public String reserveTimeRealData(int grtno) {
		String time="";
		try {
			conn=CreateConnection.getConnection();
			String sql="SELECT time FROM god_reserve_time_3 "
					+ "WHERE grtno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, grtno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			time=rs.getString(1);
			rs.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return time;
	}
    //예약완료
    public void reserveOk(ReserveVO vo) {
		try {
			conn=CreateConnection.getConnection();
			String sql="INSERT INTO god_exhibition_reserve_3 "
					+ "VALUES((SELECT NVL(MAX(gerno)+1,1) FROM god_exhibition_reserve_3),?,?,?,?,?,?,'n',SYSDATE)";
			ps=conn.prepareStatement(sql);
			ps.setString(2, vo.getId());
			ps.setString(3, vo.getRdate());
			ps.setString(4, vo.getRtime());
			ps.setInt(5, vo.getInwon());
			ps.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
	}
    //예약취소
    public void reserveDelete(int gerno) {
		try {
			conn=CreateConnection.getConnection();
			String sql="DELETE FROM god_exhibition_reserve_3 "
					+ "WHERE gerno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, gerno);
			ps.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
	}
}