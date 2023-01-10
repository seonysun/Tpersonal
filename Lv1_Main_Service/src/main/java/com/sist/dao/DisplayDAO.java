package com.sist.dao;
import java.util.*;
import java.sql.*;

public class DisplayDAO {
	private Connection conn;
	   private PreparedStatement ps;
	   private final String url="jdbc:oracle:thin:@localhost:1521:XE";
	   public DisplayDAO() {
	      try {
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	      } catch (Exception e) {}
	   }
	   public void getConnection() {
	      try {
	         conn=DriverManager.getConnection(url,"hr","happy");
	      } catch (Exception e) {}
	   }
	   public void disConnection() {
	      try {
	         if(ps!=null) ps.close();
	         if(conn!=null) conn.close();
	      } catch (Exception e) {}
	   }
}
