package com.sist.temp;
import java.sql.*;
import java.util.*;
import com.sist.dao.*;

public class DataInsert {
	private Connection conn;
    private PreparedStatement ps;
    private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
    public DataInsert() {
	    try {
		    Class.forName("oracle.jdbc.driver.OracleDriver");
	    } catch(Exception ex) {}
    }
    public void getConnection() {
	    try {
		    conn=DriverManager.getConnection(URL,"hr","happy");
	    }catch(Exception ex){}
    }
    public void disConnection() {
	    try {
		    if(ps!=null) ps.close();
		    if(conn!=null) conn.close();
	    } catch(Exception ex) {}
    }
    //예약가능시간 세팅
    public String reserve_rtime() {
    	String s="";
    	int[] com=new int[(int)(Math.random()*3)+3];
    	int su=0;
    	boolean bCheck=false;
    	for(int i=0;i<com.length;i++) {
    		bCheck=true;
    		while(bCheck) {
    			su=(int)(Math.random()*5)+1;
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
    		getConnection();
    		String sql="INSERT INTO god_reserve_date_3 "
    				+ "VALUES((SELECT NVL(MAX(grdno)+1,1) FROM god_reserve_date_3),?,?)";
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, rdate);
    		ps.setString(2, rtime);
    		ps.executeUpdate();
    	} catch(Exception ex) {
    		ex.printStackTrace();
    	} finally {
    		disConnection();
    	}
    }
    public static void main(String[] args) {
    	DataInsert di=new DataInsert();
    	for(int i=1;i<=31;i++) {
	    	di.foodReserveTimeInsert(i, di.reserve_rtime());
	    }
	    System.out.println("저장 완료");
	}
}
