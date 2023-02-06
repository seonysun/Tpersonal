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
	//시간 선택 효과
	$('.times td').hover(function(){
		$(this).css({"cursor":"pointer","background-color":"powderblue","border-radius":"25px"})
	},function(){
		$(this).css({"cursor":"none","background-color":"white"})
	})
	$('.times tr').click(function(){
		let time=$(this).text()
		$('#r_time').text(time)
		$('#reservetime').val(time)
		$.ajax({
			type:'post',
			url:'../reserve/reserve_pers.do',
			success:function(response){
				$('#select_pers').html(response)
			}
		})
	})
})
</script>
</head>
<body>
  <table class="table times">
	<c:forEach var="t" items="${rtimes }" varStatus="s">
	  <tr>
	  	<th>${s.index+1 }회</th>
	    <td>${t }</td>
	  </tr>
	</c:forEach>
  </table>
</body>
</html>