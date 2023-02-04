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
	$.ajax({
		type:'post',
		url:'../reserve/reserve_date.do',
		success:function(response){
			$('#select_date').html(response)
		}
	})
	$.ajax({
		type:'post',
		url:'../reserve/reserve_list.do',
		success:function(response){
			$('#select_list').html(response)
		}
	})
})
</script>
</head>
<body>
<div class=container>
  <div style="height: 30px"></div>
	<h3 class="text-primary px-3">GOD 전시 예매</h3>
	<div style="height: 5px"></div>
    <table class=table style="width: 100%;height: 700px">
    	<tr>
    	  <td width="40%" height=500>
    	  	<table class=table>
    	  		<caption align="top"><h5>날짜 선택</h5></caption>
    	  		<tr>
    	  		  <td>
    	  		    <div id="select_date">
    	  		    
    	  		    </div>
    	  		  </td>
    	  		</tr>
    	  	</table>
    	  </td>
    	  <td width="30%" height=500>
    	  	<table class=table>
    	  		<caption align="top"><h5>회차 선택</h5></caption>
    	  		<tr>
    	  		  <td>
    	  		  	<div id="select_time">
    	  		  	
    	  		  	</div>
    	  		  </td>
    	  		</tr>
    	  	</table>
    	  </td>
    	  <td width="30%" rowspan=2 height=700>
    	  	<table class=table>
    	  		<caption align="top"><h5>예약 정보</h5></caption>
    	  		<tr>
    	  		  <td>
    	  		  	<div id="select_list">
    	  		  	
    	  		  	</div>
    	  		  </td>
    	  		</tr>
    	  	</table>
    	  </td>
    	</tr>
    	<tr>
    	  <td width="35%" height=200>
    	  	<table class=table>
    	  		<caption align="top"><h5>인원 선택</h5></caption>
    	  		<tr>
    	  		  <td>
    	  		  	<div id="select_pers">
    	  		  	
    	  		  	</div>
    	  		  </td>
    	  		</tr>
    	  	</table>
    	  </td>
    	  <td width="35%" height=200>
    	  	<table class=table>
    	  		<caption align="top"><h5>잔여석</h5></caption>
    	  		<tr>
    	  		  <td>
    	  		  	<div id="select_seat">
    	  		  	
    	  		  	</div>
    	  		  </td>
    	  		</tr>
    	  	</table>
    	  </td>
    	</tr>
    </table>
</div>
</body>
</html>