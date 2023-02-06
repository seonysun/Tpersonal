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
	//날짜 선택 효과
	$('.days').hover(function(){
		$(this).css("cursor","pointer")
	})
	$('.days').click(function(){
		$(this).css("background-color","powderblue")
		
		//선택된 데이터 입력
		let year=$(this).attr("data-year")
		let month=$(this).attr("data-month")
		let day=$(this).text()
		$('#r_day').text(year+"년 "+month+"월 "+day+"일")
		$('#reservedate').val(year+"/"+month+"/"+day)
		
		//시간 선택 옵션 출력
		$.ajax({
			type:'post',
			url:'../reserve/reserve_time.do',
			data:{"day":day},
			success:function(response){
				$('#select_time').html(response)
			}
		})
	})
})
</script>
</head>
<body>
	<h5>${year }년 ${month }월</h5>
	<div style="height: 10px"></div>
	
	<c:set var="week" value="${week }"/>
	<table class="table">
	  <tr>
  		<c:forEach var="w" items="${strWeek }">
	  		<th height=35>${w }</th>
	  	</c:forEach>
	  </tr>
	  <tr>
	    <c:forEach var="i" begin="1" end="${lastday }" varStatus="s">
	  	  <c:if test="${i==1 }">
	  	  	<c:forEach var="j" begin="1" end="${week }">
		  	  	<td height=30></td>
	  	  	</c:forEach>
	  	  </c:if>
	  	  <c:if test="${rdays[s.index]==1 }">
		  	  <td class="days" height=30 style="background-color: powderblue" data-year="${year }" data-month="${month }"><b>${i }</b></td>
	  	  </c:if>
	  	  <c:if test="${rdays[s.index]!=1 }">
		  	  <td height=30 style="color: gray">${i }</td>
	  	  </c:if>
	  	  <c:set var="week" value="${week+1 }"/>
	  	  <c:if test="${week>6 }">
		  	  <c:set var="week" value="0"/>
	  </tr>
	  	  </c:if>
	    </c:forEach>
	  <tr>
	    <td colspan=7>
		  <span style="float: right">※<img src="../reserve/image/bluebox.png" style="width:10px;height:10px">표시된 날짜만 예매 가능</span>
	    </td>
	  </tr>
	</table>
</body>
</html>