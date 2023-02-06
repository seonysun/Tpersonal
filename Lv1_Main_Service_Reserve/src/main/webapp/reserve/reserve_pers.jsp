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
	$('#pers').change(function(){
		let inwon=$(this).text()
		$('#r_pers').text(inwon+"명")
		$('.rBtn').show()
	})
})
</script>
</head>
<body>
	<select id=pers>
		<c:forEach var="i" begin="1" end="10">
			<option>${i }</option>
		</c:forEach>
	</select>
</body>
</html>