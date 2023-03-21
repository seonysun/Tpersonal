package com.sist.dao;
import java.util.*;


import java.sql.*;
public class DataDAO {
	
	
	private Connection conn;
	private PreparedStatement ps;
	private final String URL = "jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC";
	
	public DataDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {}
	}
	
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL, "root", "happy");
		} catch (Exception e) {}
	}
	
	public void disConnection() {
		try {
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		} catch (Exception e) {}
	}

	
	public void twinkInsert(DataVO vo) {
		try {
			getConnection();
			String sql = "INSERT INTO twink(no, name, poster, price) "
					+ "VALUES((SELECT NVL(MAX(no)+1,1) as no FROM twink), ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getPoster());
			ps.setString(3, vo.getPrice());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
}
}
