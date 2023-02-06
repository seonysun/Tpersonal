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
	$('#kpers').change(function(){
		let inwon1=$(this).val()
	})
	$('#apers').change(function(){
		let inwon=$(this).val()
		$('#r_pers').text(inwon+"명")
		$('#reservpers').val(inwon)
		$('.rBtn').show()
	})
})
</script>
</head>
<body>
    <div style="height:10px"></div>
	<div>
		<label for=kpers><b>청소년</b></label>&nbsp;&nbsp;
		<select name=kpers id=kpers>
			<c:forEach var="i" begin="1" end="10">
				<option value="${i }">${i }명</option>
			</c:forEach>
		</select>
 	</div>
    <div style="height:10px"></div>
 	<div>
		<label for=apers><b>성인</b></label>&nbsp;&nbsp;
		<select name=apers id=apers>
			<c:forEach var="i" begin="1" end="10">
				<option value="${i }">${i }명</option>
			</c:forEach>
		</select>
 	</div>
</body>
</html>