<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.rt').hover(function(){
		$(this).css("cursor","pointer")
	})
	$('.rt').click(function(){
		let time=$(this).text()
		$('#r_time').text(time)
	})
})
</script>
</head>
<body>
	<table class=table>
	  <tr>
	  	<th class=text-center>시간대</th>
	  </tr>
	  <tr>
	      <td class=rt>10:00 ~ 12:00</td>
	  </tr>
	  <tr>
	      <td class=rt>12:00 ~ 14:00</td>
	  </tr>
	  <tr>
	      <td class=rt>12:00 ~ 16:00</td>
	  </tr>
	  <tr>
	      <td class=rt>16:00 ~ 18:00</td>
	  </tr>
	</table>
</body>
</html>