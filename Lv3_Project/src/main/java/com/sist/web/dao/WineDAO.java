package com.sist.web.dao;
import java.util.*;
import com.sist.web.entity.*;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface WineDAO extends JpaRepository<WineEntity, Integer>{
	//Top4
	@Query(value = "SELECT * FROM sul_item "
			+ "ORDER BY account LIMIT 0,4", nativeQuery = true)
	public List<WineEntity> mainTop4();
	
	//주류 목록
	@Query(value = "SELECT * FROM sul_item WHERE icno=1 "
			+ "ORDER BY ino LIMIT :start,12", nativeQuery = true)
	public List<WineEntity> wineListData(@Param("start") Integer start);
	
	@Query(value = "SELECT CEIL(COUNT(*)/12.0) FROM sul_item "
			+ "WHERE icno=1", nativeQuery = true)
	public int wineTotalpage();
	
	@Query(value = "SELECT COUNT(*) FROM sul_item "
			+ "WHERE icno=1", nativeQuery = true)
	public int wineCount();

	@Query(value = "SELECT * FROM sul_item WHERE icno=2 "
			+ "ORDER BY ino LIMIT :start,12", nativeQuery = true)
	public List<WineEntity> whiskeyListData(@Param("start") Integer start);
	
	@Query(value = "SELECT CEIL(COUNT(*)/12.0) FROM sul_item "
			+ "WHERE icno=2", nativeQuery = true)
	public int whiskeyTotalpage();
	
	@Query(value = "SELECT COUNT(*) FROM sul_item "
			+ "WHERE icno=2", nativeQuery = true)
	public int whiskeyCount();
	
	@Query(value = "SELECT * FROM sul_item WHERE icno=3 "
			+ "ORDER BY ino LIMIT :start,12", nativeQuery = true)
	public List<WineEntity> cognacListData(@Param("start") Integer start);
	
	@Query(value = "SELECT CEIL(COUNT(*)/12.0) FROM sul_item "
			+ "WHERE icno=3", nativeQuery = true)
	public int cognacTotalpage();
	
	@Query(value = "SELECT COUNT(*) FROM sul_item "
			+ "WHERE icno=3", nativeQuery = true)
	public int cognacCount();
	
	//주류 상세
	public WineEntity findByIno(@Param("ino") Integer ino);
	
	//주류 검색
	@Query(value = "SELECT * FROM sul_item "
			+ "WHERE nation LIKE CONCAT('%',:nation,'%') "
			+ "ORDER BY ino LIMIT :start,10", nativeQuery = true)
	public List<WineEntity> wineFindData(@Param("nation") String nation, @Param("start") Integer start);
	
	@Query(value = "SELECT CEIL(COUNT(*)/10.0) FROM sul_item "
			+ "WHERE nation LIKE CONCAT('%',:nation,'%')", nativeQuery = true)
	public int wineFindTotalpage(String nation);
	
	@Query(value = "SELECT COUNT(*) FROM sul_item "
			+ "WHERE nation LIKE CONCAT('%',:nation,'%')", nativeQuery = true)
	public int wineFindCount(String nation);
}
