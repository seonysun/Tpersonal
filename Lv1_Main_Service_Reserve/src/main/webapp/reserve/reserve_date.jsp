<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	
})
</script>
</head>
<body>
	<table class="table">
	  <tr>
		<td class=text-center><h4>${year }년 ${month }월</h4></td>
	  </tr>
	</table>
	
	<c:set var="week" value="${week }"/>
	<table class=table>
	  <!-- 일~토 요일 제목 출력 -->
	  <tr>
  		<c:forEach var="w" items="${strWeek }">
	  		<th class=text-center height=35>${w }</th>
	  	</c:forEach>
	  </tr>
	  <!-- 달력 날짜 출력 -->
	  <c:forEach var="i" begin="1" end="${lastday }">
	  	  <!-- 1일까지 공백 주기 -->
	  	  <c:if test="${i==1 }">
	  	  	<c:forEach var="j" begin="1" end="${week }">
		  	  	<td height=35></td>
	  	  	</c:forEach>
	  	  </c:if>
	  	  <!-- 날짜 출력 -->
	  	  <td class="days text-center ${i==day?'danger':'' }" height=35 data-year="${year }" data-month="${month }"><b>${i }</b></td>
	  	  <!-- 요일 하나씩 증가 -->
	  	  <c:set var="week" value="${week+1 }"/>
	  	  <!-- 일주일 지나면 요일 초기화, 줄바꿈 -->
	  	  <c:if test="${week>6 }">
		  	  <c:set var="week" value="0"/>
		  	  </tr>
		  	  <tr>
	  	  </c:if>
	  </c:forEach>
	  </tr>
	</table>
</body>
</html>