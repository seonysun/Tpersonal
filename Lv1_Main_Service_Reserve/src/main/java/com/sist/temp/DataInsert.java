package com.sist.temp;
import java.sql.*;
import java.util.*;
import com.sist.dao.*;

public class DataInsert {
	private Connection conn;
	private PreparedStatement ps;
    public void foodReserveDayInsert(int fno, String reserve_day) {
    	try {
    		conn=CreateConnection.getConnection();
    		String sql="UPDATE food_location "
    				+ "SET reserve_day=? "
    				+ "WHERE fno=?";
    		ps=conn.prepareStatement(sql);
    		ps.setString(1, reserve_day);
    		ps.setInt(2, fno);
    		ps.executeUpdate();
    	} catch(Exception ex) {
    		ex.printStackTrace();
    	} finally {
    		CreateConnection.disConnection(conn, ps);
    	}
    }
    //예약가능시간 세팅
    public String reserve_time() {
    	String s="";
    	int[] com=new int[(int)(Math.random()*5)+5];
    	int su=0;
    	boolean bCheck=false;
    	for(int i=0;i<com.length;i++) {
    		bCheck=true;
    		while(bCheck) {
    			su=(int)(Math.random()*16)+1;
    			bCheck=false;
    			for(int j=0;j<i;j++) {
    				if(com[j]==su) {
    					bCheck=true;
    					break;
    				}
    			}
    		}
    		com[i]=su;
    	}
    	Arrays.sort(com);
    	for(int i:com) {
    		s+=i+",";
    	}
    	s=s.substring(0,s.lastIndexOf(","));
    	return s;
    }
    public void foodReserveTimeInsert(int rdate, String rtime) {
    	try {
    		conn=CreateConnection.getConnection();
    		String sql="INSERT INTO project_reserve_date "
    				+ "VALUES((SELECT NVL(MAX(dno)+1,1) FROM project_reserve_date),?,?)";
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, rdate);
    		ps.setString(2, rtime);
    		ps.executeUpdate();
    	} catch(Exception ex) {
    		ex.printStackTrace();
    	} finally {
    		CreateConnection.disConnection(conn, ps);
    	}
    }
    public static void main(String[] args) {
		
	}
}
