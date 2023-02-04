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
	
})
</script>
</head>
<body>
	<table class="table">
	  <tr>
    	<td class=text-center colspan=2>
    	 	<img src="${vo.poster }" style="width: 150px;height: 200px">
    	</td>
      </tr>
      <tr>
    	<td class="text-left" colspan=2><span style="color: black">${vo.title }</span></td>
      </tr>
      <tr>
    	<th width=30%>예매날짜</th>
    	<td width=70%><span id="r_day"></span></td>
      </tr>
      <tr>
    	<th width=30%>예매시간</th>
    	<td width=70%><span id="r_time"></span></td>
      </tr>
	</table>
</body>
</html>